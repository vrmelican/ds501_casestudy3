MachineLearningTab = tabPanel("Machine Learning",
                              tags$h2("Machine Learning"),
                              tags$p("I selected the random forest method for this task.
                                     Random forest is a machine learning method that 
                                     can be used for classification tasks. In 
                                     classification, the model tries to predict which 
                                     class, or category, a data instance belongs to based
                                     on predictor variables. For example, in this 
                                     scenario, the classes are Adoption and Euthanasia. 
                                     The data instances are each animal, and the predictor
                                     variables are sex, age, breed, etc. "),
                              tags$p("Random forest trains multiple decision trees to 
                                     make a prediction. Decision trees work by 
                                     iteratively splitting the data instances into 
                                     groups, or nodes, based on which variable best 
                                     separates the classes [4]. In order to determine which
                                     variable is 'best' to split on, a value called
                                     entropy is calculated. A higher value for entropy
                                     indicates that splitting on that variable will
                                     better separate classes. The formula for entropy
                                     is shown below. What this formula says is that
                                     you sum (-p * log2(p)) for each class in a variable,
                                     where p is the proportion that the class makes up [5].
                                     For example, if our Sex variable had 20 entries
                                     total and 13 were male and 7 were female, we would
                                     do (-13/20 * log2(13/20)) + (-7/20 * log2(7/20))."),
                              imageOutput("entropyEquation", height="91px"),
                              tags$p("Splitting stops when all 
                                     the instances in a node have the same class or 
                                     when there are a minimum number of instances in 
                                     that node. In random forest, each decision tree is 
                                     trained on a random subset of variables. The 
                                     final prediction is assigned based on a majority 
                                     vote by each decision tree. I chose to use random 
                                     forest for this task because it performs well 
                                     for classification tasks. In addition, it works 
                                     well with categorical (non-numerical) variables. 
                                     Since random forest uses multiple decision trees 
                                     to make a prediction, error due to variance is reduced [4]."),
                              tags$p("Some parameters that can be adjusted for random
                                     forest are described below [6]:"),
                              tableOutput("modelParameters"),
                              tags$p("Some performance metrics that are used for classification
                                     tasks are described below [7]:"),
                              tableOutput("performanceMetrics"),
                              tags$p("NOTE: Since the business problem here is predicting
                                     whether an animal is at risk of being euthanized,
                                     we define a 'positive' result as a Euthanasia outcome."),
                              tags$p("Other important details:"),
                              tags$ul(
                                tags$li("Each model is trained on 80% of the dataset
                                        and evaluated on 20% of the dataset. The performance
                                        metrics shown below are for the testing set. A
                                        random train/test split is taken for each model."),
                                tags$li("The training set is balanced using downsampling
                                        (we want the same number of each outcome so the
                                        model is not biased).")
                              ),
                              tags$h3("Train Models"),
                              tags$p("Experiment with different parameters and see
                                     the performance of the model."),
                              sidebarPanel(
                                checkboxGroupInput("variables", "Select which variables to use:",
                                                   choices=c("Sex", "Fixed", "Age", "Breed", "Color", "Month", "Year"),
                                                   selected=c("Sex", "Fixed", "Age", "Breed", "Color", "Month", "Year")),
                                sliderInput("numVariables", "Select the number of variables:", 1, 7, 3, step=1),
                                sliderInput("numEstimators", "Select the number of estimators:", 10, 500, 100, step=10),
                                sliderInput("minLeafSize", "Select the minimum leaf size:", 1, 50, 1, step=1),
                                actionButton("train", "Train")),
                              tags$p("The table below compares the correct outcomes with
                                     the outcomes predicted by the model:"),
                              tableOutput("confusionMatrix"),
                              tags$p("Tbe table below shows performance metrics for this
                                     parameter configuration:"),
                              tableOutput("performanceResults")
)