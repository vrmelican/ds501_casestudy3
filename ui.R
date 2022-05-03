source("tabs/overviewTab.R")
source("tabs/dataTab.R")
source("tabs/exploratoryAnalysisTab.R")
source("tabs/machineLearningTab.R")
source("tabs/resultsTab.R")

navbarPage("Case Study 3",
           OverviewTab,
           DataTab,
           ExploratoryAnalysisTab,
           MachineLearningTab,
           ResultsTab
)