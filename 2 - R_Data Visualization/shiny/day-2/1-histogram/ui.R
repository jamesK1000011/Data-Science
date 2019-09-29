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

# Load the CMP dataset
CMP = read.csv("ChemicalManufacturingProcess.csv", 
               header = TRUE, stringsAsFactors = FALSE)


ui <- fluidPage(
  
  # Title of the app
  titlePanel("Histogram"),
  
  # Create a slider input
  sliderInput(inputId = "bins",  #<- input id
              label = "Number of bins:", #<- input label
              min = 1,  #<- min number in slider
              max = 50, #<- max number in slider
              value = 30), #<- default value in slider
  
  # Select input from a list of inputs
  selectInput(inputId = "variable",  #<- input id
              label = "Choose the variable:", #<- input label
              choices = as.list(names(CMP)), #<- input list
              selected = names(CMP)[1]),  #<- default value of input
  
  # Render the output as plot
  plotOutput(outputId = "histPlot")
)
