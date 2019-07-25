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
library(tidyverse)
library(shiny)

# Load the CMP datasetinput$variable
CMP = read.csv("ChemicalManufacturingProcess.csv", 
               header = TRUE, stringsAsFactors = FALSE)

server <- function(input, output, session) {
  
  output$histogram1 = renderPlot({
    
    # Plot the histogram
    hist(CMP[[input$variable1]],      #<- variable name chosen by user
         col = "salmon",              #<- color of the histogram
         main = input$variable1,      #<- title of the histogram
         xlab = input$variable1)      #<- x axis label
  })
  
  output$histogram2 = renderPlot({
    
    # Plot the histogram
    hist(CMP[[input$variable2]],      #<- variable name chosen by user
         col = "lightblue",           #<- color of the histogram
         main = input$variable2,      #<- title of the histogram
         xlab = input$variable2)      #<- x axis label
  })

  # Print output scatter plot
  output$scatter_plot <- renderPlot({
    
    plot(CMP[[input$variable1]],      #<- variable 1
         CMP[[input$variable2]],      #<- variable 2
         col = "salmon",              #<- color of the plot
         pch = 16,                    #<- plot with filled circles
         xlab = input$variable1,      #<- x axis label
         ylab = input$variable2       #<- y axis label
         )                    
    
  })
  
}