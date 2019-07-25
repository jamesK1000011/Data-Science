

#load "oooh, Shiny" library
library(shiny)
library(tidyverse)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)
fast_food_sub = fast_food_data[,4:13]
# Creae server
server <- function(input, output){
  
  data <- reactive({
      fast_food_sub %>%
      select(input$variable1, input$variable2)
  })
  
  # Print output scatterplot.
  output$scatter <- renderPlot({
    
    plot(data(),
         col = "blue",
         pch = 1)
      
  })

  output$Structure <- renderPrint({
    
    str(data())
    
  })
}