
library(shiny)


shinyServer(function(input, output) {

    output$out_numeric_input <- renderPrint({
      print(input$ninput)
    })

    output$out_slider_input <- renderPrint({
      print(input$slinput)
    })
    
})
