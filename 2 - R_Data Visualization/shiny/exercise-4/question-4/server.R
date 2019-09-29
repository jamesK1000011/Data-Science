

#load "oooh, Shiny" library
library(shiny)

# Creae server
server <- function(input, output){
  output$PDFCheats <- renderUI({
    
  tags$iframe(style="height:300px; width:500px",
                src="cheatsheet.pdf")
  })

}





