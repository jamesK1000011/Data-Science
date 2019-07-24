

#load "oooh, Shiny" library
library(shiny)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)

# Creae server
server <- function(input, output){
  output$my_exercise_text <- renderText({"Text output for exercise 3 question 3"})
}





