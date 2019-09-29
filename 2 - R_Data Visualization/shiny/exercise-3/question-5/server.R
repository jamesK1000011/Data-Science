

#load "oooh, Shiny" library
library(shiny)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)

# Creae server
server <- function(input, output){
  output$my_exercise_plot <- renderPlot({
    plot(fast_food_data$Calories,fast_food_data$Total.Fat..g.)
  })
}





