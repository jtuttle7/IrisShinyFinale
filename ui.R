
ui <- shinyUI(fluidPage(
  titlePanel("Predicting Plant Species"),
  
  fluidRow(
    column(3,
      sliderInput("SepalLength", label = "Sepal Length:", value = 5.8
                  , min = 4.3, max = 7.9
                  , step = 0.1)
      , sliderInput("SepalWidth", "Sepal Width:", value = 3
                     , min = 2, max = 4.4, step = 0.1)
      , sliderInput("PetalLength", "Petal Length:", value = 4.3
                     , min = 1, max = 6.9, step = 0.05)
      , sliderInput("PetalWidth", "Petal Width:", value = 1.3
                    , min = 0.1, max = 2.5, step = 0.1)
      , style = 'height: 400px;overflow-y: scroll')
      
    ,
    column(9,
      DT::dataTableOutput("pred_table")
      ,plotOutput("scatterPlot")
      ,plotOutput("densityPlot")
      ,plotOutput("densityPlot2")
      ,plotOutput("densityPlot3")
      ,plotOutput("densityPlot4")
      , style = 'height: 800px;overflow-y: scroll')
      
    )
  )
)
