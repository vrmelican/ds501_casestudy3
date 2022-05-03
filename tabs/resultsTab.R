ResultsTab = tabPanel("Results",
                      tags$h2("Results"),
                      tags$p("First, I experimented with using different combinations
                             of variables. For the hyperparameters, I started with 3 
                             (approximately square root 7) for number of variables, 1 for min 
                             leaf size because that is the default, and 100 decision 
                             trees per forest. Since machine learning results can vary 
                             from trial to trial depending on factors such as the 
                             train/test split, I ran 10 trials for each configuration 
                             to get a better performance estimate. Note that I could 
                             have had the interaction run and average multiple trials 
                             by default but I decided to just do one at a time because 
                             I wanted to show the confusion matrices."),
                      tags$p("The table below shows the results from these experiments:"),
                      tableOutput("variableExperimentResults"),
                      tags$p("First I ran trials using all variables. After that I
                             removed the Month and Year variables because I wanted
                             to predict whether an animal would be euthanized based
                             on the properties of the animal itself, not when it
                             arrived at the shelter. We can see that the results are
                             comparable for these two sets of variable. Finally, I
                             removed the Fixed variable beacuse I suspect that more
                             adopted animals were fixed because it was required and
                             did not impact whether the animal was adopted or euthanized.
                             We can see that removing this variable causes the results
                             to decrease significantly. However, the results are still
                             above 0.50 indicating that this model performed better
                             than random and it could likely be improved with some changes.
                             In addition, we can see that the specificity and sensitivity
                             are about equal for these variables. This shows that the
                             model is not predicting positives better than negatives,
                             which is desirable in this scenario. If an animal is
                             falsely predicted to be adopted but is actually at risk
                             of being euthanized, that would not be ideal. In addition,
                             if an animal is predicted to be euthanized but in reality
                             is likely to be adopted, the shelter could waste time
                             and resources giving more attention to that animal."),
                      tags$p("Next, I experimented with different hyperparameters.
                             However, I found that the hyperparameters did not improve
                             my results. I tried changing the number of trees to 500
                             and the min leaf size to 10. I suspect that the number
                             of trees did not matter in this case because it was
                             such a simple problem (4 predictor variables and two
                             possible outcomes). So, 100 trees was enough in this case,
                             as it would not make sense to waste resources training
                             more trees than necessary. In addition, it is probably better to have min leaf size
                             set at 1 in this case because we can get a finer
                             separation of instances during training."),
                      tags$h3("Future Improvements"),
                      tags$p("The above models performed better than random, indicating
                             that using machine learning for this application is
                             promising. However, a higher accuracy is desirable. Here
                             are a few improvements that could potentially yield
                             better performances:"),
                      tags$ul(
                        tags$li("Use more data. As mentioned previously, the original
                                dataset had about 140,000 entries with new entries
                                being added every day. To allow the models to train
                                quickly for this assignment, I only used 1000 entries.
                                If we had more time to train, using all the entries
                                would likely result in better performance. In addition,
                                finding data from a variety of sources, not just this
                                one Texas animal center would be helpful because different
                                shelters may have different policies."),
                        tags$li("Collect more variables. The variables in this dataset
                                were fairly limited. Having more information would
                                reveal new patterns and lead to better models. Examples
                                of variables that would be intersting to have are
                                the reason why an animal is at the shelter (was it given
                                up by its owner or found on the street?) and the
                                temperament of the animal (could rate aggression,
                                affection level, etc.)."),
                        tags$li("Try different methods. In this assignment I focused
                                on one machine learning method, random forests. Experimenting
                                with different classification methods such as SVM and
                                neural networks could be promising.")
                      ))