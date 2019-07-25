#### Set working directory ####
session_info = sessionInfo()

platform = session_info$platform
directory = "af-werx"

if(length(grep("linux|apple", platform)) > 0){
  Sys.getenv("USER")
  dir = paste0("~/Desktop/", directory)
}else{
  username = Sys.getenv("USERNAME")
  dir=paste0("C:/Users/", username, "/Desktop/", directory)
}

# Set the working directory to data directory
data_dir = paste0(dir, "/data")
setwd(data_dir)


# Load the shiny package
library(shiny)
library(tidyverse)

# Load the CMP datasetinput$variable
CMP = read.csv("ChemicalManufacturingProcess.csv", 
               header = TRUE, stringsAsFactors = FALSE)


ui <- fluidPage(
  
  # Give the title to the app
  titlePanel("Understanding layouts"),
  
  # Start the tab window
  tabsetPanel(
    
    # Tab 1
    tabPanel("Histogram 1",                      #<- tab 1 name
             tags$br(), tags$br(),               #<- html breaks
             tags$h2("Histogram of variable 1"), #<- title of plot
             tags$br(), tags$br(),               #<- html breaks
             
             # Select input from a list of inputs
             selectInput(inputId = "variable1",          #<- input id
                         label = "Choose the variable:", #<- input label
                         choices = as.list(names(CMP)),  #<- input list
                         selected = names(CMP)[1]),      #<- default value of input
             
             plotOutput("histogram1")          #<- Plot output
    ),
    
    # Tab 2
    tabPanel("Histogram 2",                       #<- tab 2 name
             tags$br(), tags$br(),                #<- html breaks
             tags$h2("Histogram of variable 2"),  #<- title of the plot
             tags$br(), tags$br(),                #<- html breaks
             
             # Select input from a list of inputs
             selectInput(inputId = "variable2",          #<- input id
                         label = "Choose the variable:", #<- input label
                         choices = as.list(names(CMP)),  #<- input list
                         selected = names(CMP)[1]),      #<- default value of input
             
             plotOutput("histogram2")            #<- plot output
    ),
    
    # Tab 3
    tabPanel("Relationship between two variables",     #<- tab 3 name
             tags$br(), tags$br(),                     #<- html breaks
             tags$h2("Scatter plot of two variables"), #<- title of the plot
             tags$br(), tags$br(),                     #<- html breaks
             plotOutput("scatter_plot")                #<- plot output
             
             )
    )
  )
