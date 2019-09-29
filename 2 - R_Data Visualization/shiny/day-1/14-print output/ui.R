# Get working directory
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

# Load the CMP dataset
CMP = read.csv("ChemicalManufacturingProcess.csv", header = TRUE, stringsAsFactors = FALSE)


### Create Shiny application ###
fluidPage(
  
  verbatimTextOutput("my_print") # create print output element that will display output contents of my_print element
  
) 