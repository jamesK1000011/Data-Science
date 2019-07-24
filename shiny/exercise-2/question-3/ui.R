setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  
  sliderInput(
    "exerciseSliderRange",
    label ="Select your range",
    min = -100,
    max = 100,
    value = c(-10,10)
  )
)





