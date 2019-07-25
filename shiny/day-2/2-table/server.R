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
  
# Render output table
output$cmp_table = renderTable(
  
  # Check input option to display head or tail
  if(input$option == 'Head'){
    head(CMP[1:10], input$num) #<- display head of the data 
  }
  
  else{
    tail(CMP[1:10], input$num) #<- display tail of the data
  }
  
)
}