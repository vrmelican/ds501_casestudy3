function(input, output) {
  library(ggplot2) #visualizations
  library(caret) #downsampling
  library(randomForest) #random forest
  
  #--------------------LOAD DATA--------------------
  data = reactive({
    df = read.csv("data.csv")
    return(df)
  })
  
  #--------------------OVERVIEW TAB--------------------
  output$catImg = renderImage({
    list(src="cat.jpg", width=310, height=163, deleteFile=FALSE)
  })
  
  #--------------------DATA TAB--------------------
  output$dataVariables = renderTable({
    Variable = c("Sex", "Fixed", "Age", "Breed", "Color", "Month", "Year", "Outcome")
    Description = c("Sex of the animal",
                    "Whether the animal is fixed (spayed/neutered)",
                    "Age of the animal at time of outcome",
                    "Breed of the animal", 
                    "Color of the animal",
                    "Month of the outcome",
                    "Year of the outcome",
                    "Whether the animal was adopted or euthanized")
    data.frame(Variable, Description)
  })
  
  #--------------------EXPLORATORY ANALYSIS TAB--------------------
  output$tablePreview = renderTable({head(data(), 5)})
  output$sexOutcome = renderPlot({
    ggplot(data(), aes(x=Sex)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by sex")
  })
  output$fixedOutcome = renderPlot({
    ggplot(data(), aes(x=Fixed)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by whether animal is fixed")
  })
  output$ageOutcome = renderPlot({
    ggplot(data(), aes(x=Age)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by age")
  })
  output$breedOutcome = renderPlot({
    ggplot(data(), aes(x=Breed)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by breed")
  })
  output$colorOutcome = renderPlot({
    ggplot(data(), aes(x=Color)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by color")
  })
  output$monthOutcome = renderPlot({
    ggplot(data(), aes(x=Month)) +
      geom_histogram(stat="count", aes(fill=Outcome.Type)) +
      labs(title="Outcome by month")
  })
  output$yearOutcome = renderPlot({
    ggplot(data(), aes(x=Year)) +
      geom_histogram(stat="count", binwidth=1, aes(fill=Outcome.Type)) +
      labs(title="Outcome by year") +
      scale_x_continuous(breaks = round(seq(2013, 2022, by = 1),1))
  })
  
  #--------------------MACHINE LEARNING TAB--------------------
  output$entropyEquation = renderImage({
    list(src="entropyEquation.png", width=391, height=91, deleteFile=FALSE)
  })
  output$modelParameters = renderTable({
    Parameter = c("Number Variables", "Number Estimators", "Min Leaf Size")
    Description = c("The number of variables to use in each random subset per decision tree.
                    A common value for this parameter is the square root of the
                    total number of parameters.",
                    "The number of decision trees to build. Having more trees will
                    yield better results but will take longer to train.",
                    "Determines the stopping criteria for splitting of decision trees.
                    For example, if this is set at 5, splitting will stop when there
                    are 5 data instances in a given node.")
    data.frame(Parameter, Description)
  })
  output$performanceMetrics = renderTable({
    Parameter = c("Accuracy", "Sensitivity", "Specificity")
    Description = c("Percentage of correctly predicted outcomes",
                    "Percentage of correctly predicted positive outcomes",
                    "Percentage of correctly predicted negative outcomes")
    data.frame(Parameter, Description)
  })
  results = eventReactive(input$train, {
    #random train/test split
    split = sample(1000, 800)
    train = data()[split,]
    test = data()[-split,]
    
    #downsample training set
    trainX = subset(train, select= -c(Outcome.Type))
    trainY = as.factor(train$Outcome.Type)
    train_balanced = downSample(trainX, trainY)
    
    #get inputs
    formula = as.formula(paste("Class ~", paste(input$variables, collapse=" + ")))
    numVar = as.integer(input$numVariables)
    numEst = as.integer(input$numEstimators)
    minSize = as.integer(input$minLeafSize)
    
    #train model and generate confusion matrix
    rf = randomForest(formula, data=train_balanced, ntree=numEst, mtry=numVar, nodeSize=minSize)
    True = test$Outcome.Type
    Predicted = as.vector(predict(rf, test))
    results = table(True, Predicted)
    return(results)
  })
  output$confusionMatrix = renderTable({
    results()
  })
  output$performanceResults = renderTable({
    total = 200
    truePositives = results()[4]
    trueNegatives = results()[1]
    falsePositives = results()[3]
    falseNegatives = results()[2]
    
    accuracy = (truePositives + trueNegatives) / total
    sensitivity = truePositives / (truePositives + falseNegatives)
    specificity = trueNegatives / (trueNegatives + falsePositives)
      
    Metric = c("Accuracy", "Sensitivity", "Specificity")
    Value = c(accuracy, sensitivity, specificity)
    data.frame(Metric, Value)
  })
  
  #--------------------RESULTS TAB--------------------
  output$variableExperimentResults = renderTable({
    Variables = c("All Variables", "Sex, Fixed, Age, Breed, Color", "Sex, Age, Breed, Color")
    Accuracy = c(0.75, 0.76, 0.58)
    Sensitivity = c(0.68, 0.67, 0.58)
    Specificity = c(0.82, 0.85, 0.59)
    data.frame(Variables, Accuracy, Sensitivity, Specificity)
  })
}