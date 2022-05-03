ExploratoryAnalysisTab = tabPanel("Exploratory Analysis",
                                  tags$h2("Exploratory Analysis"),
                                  tags$p("First, the first five rows of the dataset
                                  are displayed to gain a sense of what it looks like."),
                                  tableOutput("tablePreview"),
                                  tags$p("Next, we explore the relationship between
                                         the predictors and the outcome using a series
                                         of visualizations."),
                                  tags$p("Below is a histogram that compares the outcome
                                         of animals based on sex. It appears that male cats
                                         are more likely to be euthanized than female cats."),
                                  plotOutput("sexOutcome"),
                                  tags$p("Next is a histogram that compares the outcomes
                                         of animals based on whether they are fixed. We
                                         can clearly see that nearly all adopted cats
                                         are fixed while the euthanized category has
                                         a mix of fixed and intact (non-fixed) animals. However, this
                                         trend is most likely not causal and due to the 
                                         fact that shelters fix animals before they
                                         are adopted out. So, animals that come to the
                                         shelter intact and are deemed to be euthanized
                                         for whatever reason do not get
                                         the procedure."),
                                  plotOutput("fixedOutcome"),
                                  tags$p("The next histogram compares the age of cats
                                         who come into the shelter with their outcome.
                                         We can clearly see that the majority of cats
                                         are younger. It appears that for younger cats,
                                         the rates of adoption versus euthanization are
                                         fairly similar, or if there is a difference the
                                         adoption rate is higher. However, older cats, specifically
                                         those aged 10 or older, are more likely to 
                                         be euthanized. This trend makes sense because
                                         people are often more likely to adopt younger animals."),
                                  plotOutput("ageOutcome"),
                                  tags$p("Next, we investigate whether the breed and
                                         color of the cat have an effect on whether they
                                         are adopted. As shown in the histograms below,
                                         it appears that these variables do not impact
                                         the outcome. The only case where adoption appears
                                         to be slightly higher is for the `Other` category
                                         of breed. This could just be a property of the
                                         sample that was selected and not be representative
                                         of the overall population. However, it would
                                         make sense that people would be more likley to
                                         adopt a `rare` or less common breed. I think it makes sense that color
                                         and breed do not appear to have a large impact
                                         on the outcome. Many people adopt shelter animals
                                         based on their personality and whether that
                                         animal's temperament fits their lifestyle,
                                         not their appearance."),
                                  plotOutput("breedOutcome"),
                                  plotOutput("colorOutcome"),
                                  tags$p("Finally, we investigate whether when the
                                         animal was in the shelter affects the outcome.
                                         For month, there do not seem to be any 
                                         major differences, indicating that the time
                                         of year does not impact the outcome. For the year
                                         histogram, we can see that there are fewer
                                         entries for 2013 and 2022. This is because
                                         the earliest entries in this dataset are
                                         from late 2013 and the latest entries are
                                         from April of 2022, so it makes sense that
                                         these years would have fewer entries. Overall,
                                         we can see that euthanization rates decrease
                                         over time. This is most likely due to increased
                                         activism."),
                                  plotOutput("monthOutcome"),
                                  plotOutput("yearOutcome")
)