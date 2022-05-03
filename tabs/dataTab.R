DataTab = tabPanel("Data",
                   tags$h2("Data"),
                   tags$p("To assist with this task, I used the Austin Animal Center
                           Outcome dataset [2], which records the outcomes of animals
                           that passed through an Austin, Texas shelter. Possible outcomes
                           included adoption, transfer to another facility, and
                           euthanasia. Since the full dataset included approximatley 140,000
                           entries at the time of download, I cleaned it locally
                           before uploading to the app. The cleaning code can be
                           found on the GitHub repository. The steps that were taken
                           to clean the data are detailed below:"),
                   tags$ul(
                     tags$li("I decided to just focus on one type of animal, cats,
                              to reduce the complexity of the problem. However, this
                              method could be expanded to any type or multiple types
                              of animals."),
                     tags$li("In the original dataset, the sex of the animal and whether
                              the animal was fixed were combined into one variable. I
                              separated these into two different variables."),
                     tags$li("I decided to focus on adult cats (aged 1 year or older)
                              because I know kittens have a much higher adoption rate
                              and I wanted to see what factors affect the outcome of
                              adult animals."),
                     tags$li("The color and breed variables had a very high number of
                              possible categories. Since this can make it harder to train
                              a model, I combined categories that made up fewer than 5%
                              of the total entries into an 'Other' category."),
                     tags$li("I reduced the problem to binomial classification (two
                             outcomes) by taking only `Adoption` and `Euthanasia`
                             outcomes."),
                     tags$li("Finally, I randomly sampled 500 entries for each outcome,
                             resulting in a dataset with 1000 entries.")
                   ),
                   tags$p("The table below describes the variables in the dataset:"),
                   tableOutput("dataVariables")
)