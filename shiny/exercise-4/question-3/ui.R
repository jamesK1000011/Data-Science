setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  
  tags$h1("Adding HTML tags for the exercise"),
  
  tags$h3("Choose the range"),
  
  sliderInput(
    "exerciseSliderRange", #give a name to this element
    label = "Select your range",
    min = 0, # specify min val
    max = 100, # specify max val
    value = c(35,65) # specify default range
  ),
  
  tags$br(),
  tags$br(),
  tags$br(),
  
  tags$h3("Link to more information"),
  p("More information can be found here:",
  a('RShiny Cheatsheet', href = "https://shiny.rstudio.com/images/shiny-cheatsheet.pdf"))
  
)





