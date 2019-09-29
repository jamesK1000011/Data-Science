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
  titlePanel("Correlation plot of choosen variables"),
  
  uiOutput("cor_var"), #<- input list of variables to select multiple variables
  
  # Action button to trigger the event
  actionButton(inputId = "submit",  #<- input id
               label = "Update plot"), #<- input label
  
  # Render the output as plot
  plotOutput(outputId = "corr_plot")
  
)
