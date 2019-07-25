

#load "oooh, Shiny" library
library(shiny)
library(tidyverse)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)
fast_food_sub = fast_food_data[,4:5]
fast_food_sub



# Create server
server <- function(input, output){
  output$histogram <- renderPlot({
    hist(fast_food_sub$Serving.Size..g.,
    col = "salmon",
    main = "Serving.Size..g.",
    xlab = fast_food_sub$Serving.Size..g.)
  })
  
  output$scatterplot <- renderPlot({
    plot(fast_food_sub$Serving.Size..g.,
         fast_food_sub$Calories,
         col = "salmon",
         pch = 16,
         xlab = "Serving.Size..g.",
         ylab = "Calories")
  })
  output$Summary <- renderPrint({
    summary(fast_food_sub)
  })
  
}