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
  
  radioButtons(              # create radioButton element
    "radio",                 # give a name to this element
    label = "My first radio buttons", # define the title of the element to be displayed
    choices = list("Choice 1" = 1, "Choice 2" = 2), # specify the list of possible choices
    selected = 1             # specify the default choice to be selected
  )
  
)   