setwd("/Users/datasociety/Desktop/af-werx/data")

#load "oooh, Shiny" library
library(shiny)

# Creae ui.r
ui <- fluidPage(
  titlePanel("Variable explorer"),

  uiOutput("cor_var"), 
  
  actionButton(inputId = "submit",
               label = "submit"),
  
  verbatimTextOutput(outputId = "Summary_ff")

)