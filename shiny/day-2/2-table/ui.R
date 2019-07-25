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
  titlePanel("Table"),
  
  # Radio button to choose the option
  radioButtons("option",            #<- input id
               "Choose the option", #<- input label
               c("Head", "Tail")),  #<- options
  
  # Numeric inputs
  numericInput("num",                #<- input id
               "No of observations", #<- input label
               value = 10,           #<- default value
               min = 1,              #<- minimum value 
               max = nrow(CMP),      #<- maximum value
               step = 1),            #<- increase in step of
  
  # Ouput function to display
  tableOutput("cmp_table")
)
