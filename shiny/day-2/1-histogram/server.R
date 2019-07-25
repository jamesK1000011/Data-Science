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

server <- function(input, output) {
  
  # Create a renderPlot function
  output$histPlot <- renderPlot({
    
    # Get the bin width from user and adjust the bin size
    bins <- seq(min(CMP[[input$variable]]),  #<- min bin value is min value of variable chosen
                max(CMP[[input$variable]]), #<- max bin value is max value of variable chosen
                length.out = input$bins + 1) #<- length is value chosen by the user
    
    
    # Plot the histogram
    hist(CMP[[input$variable]], #<- variable name chosen by user
         breaks = bins,         #<- bin width
         col = "salmon",        #<- color of the histogram
         main = input$variable, #<- title of the histogram
         xlab = input$variable) #<- x axis label
    
 })
}