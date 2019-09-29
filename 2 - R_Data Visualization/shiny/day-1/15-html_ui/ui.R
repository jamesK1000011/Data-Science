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
library(colourpicker)


### Create Shiny application ###
fluidPage(
  tags$h1("Display HTML tags"),    #<- header tag
  
  tags$h3("View action button"),  #<- header tag
  
  actionButton("action", label = "Action", width = "300px"), #<_ action button
  
  tags$h3("View color input"), #<- header tag
  
  # HTML tag div specifies style with vertical display aligning at top with width 200 pixels
  # Color input is another input widget which displays the color palette
  div(style="display: vertical-align:top; width: 200px;",
      colourInput("box_fillcol", "Select colour to fill", "orangered")),
  
  tags$br(), #<- break tag to create the space
  
  h1("View other apps"), #<- header tag
  
  # Paragraph tag
  p(style = "font-family:Times new roman", "See other apps in the",
    
  # a and href to display the hyperlink  
    a('Shiny Showcase', href = "https://www.rstudio.com/products/shiny/shiny-user-showcase/"))
) 