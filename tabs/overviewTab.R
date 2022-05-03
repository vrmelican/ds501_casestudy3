OverviewTab = tabPanel("Overview",
                       tags$h1("Predicting Euthanasia Risk in Animal Shelters"),
                       tags$p("Each year, approximately one million animals are euthanized
                              in United States shelters. This number can be reduced by
                              encouraging adoption and attempting to return animals to
                              their owners [1]. Identifying animals that have a higher
                              risk of euthanization is important because shelter workers
                              can then devote more time to getting these animals adopted.
                              Data analysis and machine learning can help with this
                              task by determining what factors make an animal more
                              likely to be euthanized. In this case study, I used a 
                              dataset from the Austin Animal Center and the random 
                              forest machine learning method to predict whether animals 
                              would be adopted or euthanized."),
                       imageOutput("catImg", height="165px"),
                       tags$a("Image source", href="https://icatcare.org/"),
                       
                       tags$h2("References"),
                       tags$a("[1] ASPCA Pet Statistics", href="#https://www.aspca.org/helping-people-pets/shelter-intake-and-surrender/pet-statistics"),
                       tags$br(),
                       tags$a("[2] Austin Animal Center Outcome Dataset", href="#https://data.austintexas.gov/Health-and-Community-Services/Austin-Animal-Center-Outcomes/9t4d-g238"),
                       tags$br(),
                       tags$a("[3] R randomForest Documentation", href="#https://www.rdocumentation.org/packages/randomForest/versions/4.7-1/topics/randomForest"),
                       tags$br(),
                       tags$a("[4] About Random Forest", href="#https://towardsdatascience.com/understanding-random-forest-58381e0602d2"),
                       tags$br(),
                       tags$a("[5] About Entropy", href="https://towardsdatascience.com/entropy-how-decision-trees-make-decisions-2946b9c18c8"),
                       tags$br(),
                       tags$a("[6] Random Forest Parameters", href="#https://www.analyticsvidhya.com/blog/2015/06/tuning-random-forest-model/"),
                       tags$br(),
                       tags$a("[7] Classification Performance Metrics", href="#"),
                       tags$br()
)