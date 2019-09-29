

#load "oooh, Shiny" library
library(shiny)

# load the Fast and furious food data
fast_food_data = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = FALSE)

# Creae server
server <- function(input, output){
  
  # render output table
  output$fast_food_data = renderTable(
    #check input option to display
    if(input$option == 'Display all columns'){
      head(fast_food_data, input$num)
    }
    else{
      head(fast_food_data[,c(3,5)], input$num)
    }
  )
}





