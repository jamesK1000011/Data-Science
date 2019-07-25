

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  titlePanel("Fast food exploration"),
  
  #Start the tab window
  tabsetPanel(
    
  # Tab 1
  tabPanel("Histogram",
           tags$br(),
           tags$br(),
           tags$h2("Serving Size (g)"),
           tags$br(),
           tags$br(),
           plotOutput("histogram")
  ),
  # Tab 2
  tabPanel("Scatter plot",
           tags$br(),
           tags$br(),
           tags$h2("Serving.Size (g) vs Calories (g)"),
           tags$br(),
           tags$br(),
           plotOutput("scatterplot")
  ),
  # Tab 3
  tabPanel("Summary",
           tags$br(),
           tags$br(),
           tags$h2("Serving.Size (g) & Calories (g)"),
           tags$br(),
           tags$br(),
           verbatimTextOutput("Summary")
  )
)
)