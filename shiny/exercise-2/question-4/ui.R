setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  checkboxGroupInput(
    "exerciseCheckGroupp",
    label = "Select a color",
    choices = list("Red" = 1, "Blue" = 2, "Green" = 3,"Orange" = 4),
    selected = c(3,4)
  )
)



