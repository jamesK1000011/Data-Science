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
  
  # Create a reactive expression to select two variables choosen by user
  data <- reactive({
    CMP %>% select(input$variable1, input$variable2)
  })
  
  # Print output scatter plot
  output$scatterPlot <- renderPlot({
    
    plot(data(),          #<- the new data selected
         col = "salmon",  #<- color of the plot
         pch = 16)        #<- plot with filled circles
    
  })
  
  # Print the summary output
  output$summary <- renderPrint({
    
    summary(data())     #<- print the summary of data
    
  })
  
}