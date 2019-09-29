#### Set working directory ####
session_info = sessionInfo()

platform = session_info$platform
directory = "af-werx"

if(length(grep("linux|apple", platform)) > 0){
  Sys.getenv("USER")
  dir = paste0("~/Desktop/", directory)
}else{
  username = Sys.getenv("USERNAME")
  dir=paste0("C:/Users/", username, "/Desktop/", directory)
}

# Set the working directory to data directory
data_dir = paste0(dir, "/data")
setwd(data_dir)

# Load the shiny package
library(shiny)
library(corrplot)
library(tidyverse)

# Load the CMP datasetinput$variable
CMP = read.csv("ChemicalManufacturingProcess.csv", 
               header = TRUE, stringsAsFactors = FALSE)

cmp_sub = na.omit(CMP)

server <- function(input, output) {
  
  output$cor_var = renderUI({
    selectInput("cor_var",                         #<- input variable id
                "Choose Variables",                #<- label to the select input
                choices = as.list(names(cmp_sub)), #<- choice list
                multiple = T,                      #<- allow multiple selection
                selected = names(CMP)[1:2])        #<- default values
  })
  
  data <- eventReactive(input$submit, {
    cmp_sub[, input$cor_var]     #<- selected input list
  })
  
  output$corr_plot = renderPlot({
               corrplot(cor(data()))  #,- render plot
             })
}