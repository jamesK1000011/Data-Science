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
  
  sliderInput( # create sliderInput element
    "slider1", # give a name to this element
    label ="My first slider", # give a header 
    min = 0, # specify the minimum value that can be selected
    max = 100, # specify the maximum value that can be selected
    value = 50) # specify the default value that is selected

)             