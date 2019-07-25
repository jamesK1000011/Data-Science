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
  
  # Title of the app
  titlePanel("Scatter plot and summary of two variables"),
  
  # Select input from a list of inputs
  selectInput(inputId = "variable1",    #<- input1 id
              label = "Choose the first variable:", #<- input1 label
              choices = as.list(names(CMP)), #<- input1 list
              selected = names(CMP)[1]),  #<- default value of input1
  
  # Select input from a list of inputs
  selectInput(inputId = "variable2",  #<- input2 id
              label = "Choose the second variable:", #<- input2 label
              choices = as.list(names(CMP)), #<- input2 list
              selected = names(CMP)[2]),  #<- default value of input2
  
  # Render the output as plot
  plotOutput(outputId = "scatterPlot"),
  
  # Print the summary as text output
  verbatimTextOutput("summary")
)
