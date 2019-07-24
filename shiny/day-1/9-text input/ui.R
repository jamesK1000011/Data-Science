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


### Create Shiny application ###
fluidPage(
  
  textInput(                 # create text input element
    "text",                  # give a name to this element
    label = "My first text input",    # define the title of the element to be displayed
    value = "Enter text..."  # specify the default value
  )
  
)   