setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  titlePanel("Select you fast_food_data scattrplot"),

  selectInput(inputId = "variable1",
              label = "Choos the first variable:",
              choices = as.list(names(fast_food_sub)),
              selected = names(fast_food_sub)[1]),

  selectInput(inputId = "variable2",
              label = "Choos the first variable:",
              choices = as.list(names(fast_food_sub)),
              selected = names(fast_food_sub)[2]),
  
  plotOutput("scatter"),

  verbatimTextOutput("Structure")
)