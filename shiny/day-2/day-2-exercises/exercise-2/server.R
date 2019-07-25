

#load "oooh, Shiny" library
library(shiny)
library(tidyverse)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)
fast_food_sub = fast_food_data[,4:13]
# Creae server
server <- function(input, output){

  
  output$cor_var = renderUI({
    selectInput("cor_var",
                "Choose Variables",
                choices = as.list(names(fast_food_data)),
                multiple = T,
                selected = names(fast_food_data) [1:2])
                
  })

  data <- eventReactive(input$submit, {
    fast_food_data[,input$cor_var]
  })
  
  output$Summary_ff <- renderPrint({
    summary(data())
    
  })
  }