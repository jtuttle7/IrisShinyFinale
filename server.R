
server <- function(input,output){
  
  
  Preds <- reactive({
    generatePreds(
      Sepal.Length = input$SepalLength
      ,Sepal.Width = input$SepalWidth
      ,Petal.Length = input$PetalLength
      ,Petal.Width = input$PetalWidth
    ) 
  })
  
  output$pred_table <- DT::renderDataTable({
    Preds() %>%
      datatable() %>%
      formatPercentage(columns = 'preds', digits = 2)
  })
  
  output$scatterPlot<- renderPlot({
    ggplot(data = iris) +
      geom_point(size = 4,aes(x=Sepal.Length,y=Sepal.Width,color = Species,shape = Species)) +
      xlab("Sepal Length") + ylab("Sepal Width") +
      ggtitle("Current Prediction vs Data") +
      geom_point(shape=17,size = 6,alpha=0.5,color = "red",aes(x=input$SepalLength,y=input$SepalWidth))
  })
  
  output$densityPlot <- renderPlot({
    ggplot(data=iris) +
      geom_density(aes(Sepal.Length,fill = Species),alpha = 0.45) +
      geom_vline(size = 2,aes(xintercept = input$SepalLength),color = 'red',linetype = "dashed")
    
  })
  
  output$densityPlot2 <- renderPlot({
    
    ggplot(data=iris) +
      geom_density(aes(Sepal.Width,fill = Species),alpha = 0.45) +
      geom_vline(size = 2,aes(xintercept = input$SepalWidth),color = 'red',linetype = "dashed")
    
    
  })
  
  
  output$densityPlot3 <- renderPlot({
    
    ggplot(data=iris) +
      geom_density(aes(Petal.Length,fill = Species),alpha = 0.45) +
      geom_vline(size = 2,aes(xintercept = input$PetalLength),color = 'red',linetype = "dashed")
    
    
  })
  
  
  output$densityPlot4 <- renderPlot({
    
    ggplot(data=iris) +
      geom_density(aes(Petal.Width,fill = Species),alpha = 0.45) +
      geom_vline(size = 2,aes(xintercept = input$PetalWidth),color = 'red',linetype = "dashed")
    
    
  })
  
  
  
}