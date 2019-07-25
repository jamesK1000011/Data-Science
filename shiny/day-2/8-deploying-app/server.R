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