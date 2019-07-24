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
  
  checkboxGroupInput(             # create CheckboxGroupInput element
    "checkGroup",                 # give a name to this elements
    label = "Your three choices", # define the title of the checkbox group to be displayed
    choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), # specify the choices in the group
    selected = 1                  # specify the choices to be selected by default
  )
  
)  