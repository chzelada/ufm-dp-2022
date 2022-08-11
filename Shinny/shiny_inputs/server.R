
library(shiny)


shinyServer(function(input, output) {

    output$out_numeric_input <- renderPrint({
      print(input$ninput)
    })

    output$out_slider_input <- renderPrint({
      print(input$slinput)
    })
    
    output$out_slider_input_multi <- renderPrint({
      print(input$slinputmulti)
      print(str(input$slinputmulti))
    })
    
    output$out_slider_input_ani <- renderPrint({
      print(input$slinputanimate)
    })
    
    output$out_date_input <- renderPrint({
      print(input$date_input)
    })
    
    output$date_range_input <- renderPrint({
      print(input$date_range_input)
      print(str(input$date_range_input))
    })
    
  output$out_select_input <- renderPrint({
    print(input$select_input)
  })
  
  output$check_box_group_out <- renderPrint({
    print(input$chkbox_group_input)
  })
  
  output$multiple_select_input <- renderPrint({
    print(input$select_input_2)
  })
  
  output$checkbox_output <- renderPrint({
    print(input$chkbox_input)
  })
  
  output$radio_buttons_out <- renderPrint({
    print(input$radio_buttons)
    print(str(input$radio_buttons))
  })
  
  output$boton <- renderPrint({
    print(input$action)
  })
    
})
