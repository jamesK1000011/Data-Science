setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  tags$h2("Embedding images and pdf files for the exercise"),
  
  img(src='r-studio-image.png'),
  tags$br(),
  tags$br(),
  tags$br(),
  
  uiOutput("PDFCheats")
)



