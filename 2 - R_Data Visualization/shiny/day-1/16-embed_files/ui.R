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
  tags$h1("Display pdf and images"), #<- html header tag
  
  img(src='r-studio-image.png'),    #<- embed image
  
  tags$br(),                       #<- html break tag
  tags$br(),                       #<- html break tag 
  tags$br(),                       #<- html break tag
  
  uiOutput("pdf_view")             #<- embed pdf
)
