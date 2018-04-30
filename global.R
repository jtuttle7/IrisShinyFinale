library(xgboost)
library(tidyverse)
library(shiny)
library(DT)

# Load the model
SpeciesPredict <- xgb.load("irisSpecies.model")
load("irisSpeciesInfo.rda")


# Build a function to see how well the predict function does. Make it near the actual stuff in your dataset
generatePreds <- function(Sepal.Length = 5.8, Sepal.Width = 3, Petal.Length = 4.35, Petal.Width = 1.3){
  
  # This must be the same order as the x that the model was built on
  testDF <- as.matrix(
    Sepal.Length,Sepal.Width,Petal.Length,Petal.Width
  )
  
  preds <- predict(SpeciesPredict, as.matrix(testDF))
  
  data.frame(
    Species = irisSpeciesInfo$var.levels
    , preds
  ) %>%
    arrange(desc(preds))
}

