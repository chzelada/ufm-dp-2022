
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {

    observeEvent(input$lim_inf,{
      updateSliderInput(session,"sl1",min=input$lim_inf)
    })
  
  observeEvent(input$lim_sup,{
    updateSliderInput(session,"sl1",max = input$lim_sup)
  })
  
  
  observeEvent(input$limpiar,{
    updateSliderInput(session,'sl2',value=0)
    updateSliderInput(session,'sl3',value=0)
    updateSliderInput(session,'sl4',value=0)
    updateSliderInput(session,'sl5',value=0)
    updateSliderInput(session,'sl6',value=0)
  })
  
  observeEvent(input$runs,{
    new_label <- paste0('Correr ', input$runs, ' veces')
    if(input$runs==1){
      new_label <- paste0('Correr ', input$runs, ' vez')
    }
    updateActionButton(session,'correr',label=new_label)
  })
  
  observeEvent(input$nvalue,{
    updateNumericInput(session,'nvalue',value=input$nvalue+1)
  })

  observeEvent(input$celsius,{
    f <- input$celsius*(9/5)+32
    updateNumericInput(session,'farenheit',value=f)
  })
  
  observeEvent(input$farenheit,{
    c <- (input$farenheit-32)*5/9
    updateNumericInput(session,'celsius',value=c)
  })
  
  observeEvent(input$dist,{
    updateTabsetPanel(session,'parametros',selected = input$dist)
  })
  
  sample <- reactive({
    switch (input$dist,
      normal = rnorm(input$nrandom,input$n_media,input$n_sd),
      uniforme = runif(input$nrandom,input$a,input$b),
      exponencial = rexp(input$nrandom,input$lambda)
    )
  })
  
  output$plot_dist <- renderPlot({
    hist(sample())
  })
  
  
  
  
  
  
})







