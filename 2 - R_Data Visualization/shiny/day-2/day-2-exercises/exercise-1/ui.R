setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  # title of the app
  titlePanel("Select your fast_food_data table"),
  
  # radio button to choose the option
  radioButtons("option",
               "Choose an option",
               c("Display all columns", "Only display 'Type' and 'Calories'")),
  
  # numeric inputs
  numericInput("num",
               "no of unhealthy options",
               value = 10,
               min = 1,
               max = nrow(fast_food_data),
               step = 1
               ),
  # output function to display
  tableOutput("fast_food_data")
               
)





