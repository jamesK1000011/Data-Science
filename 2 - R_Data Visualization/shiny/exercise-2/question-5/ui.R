setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  numericInput(
    "exerciseNumericInput",
    label = "Select your number",
    value = 999
  ),
  textInput(
    "exerciseTextInput",
    label = "Write your text",
    value = "I'm on a boat..."
  ),
  actionButton( 
    "BoatButtom", 
    label = "Boat",
    onclick ="location.href='https://youtu.be/R7yfISlGLNU?t=27';"
    ) 
)





