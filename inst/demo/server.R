function(input, output, session) {

  # Start tracking
  shinyga::enableTracking("PUT HERE YOUR TRACKIN ID")
  # Record page view
  shinyga::recordPageView();

  output$actionOut <- renderPrint({ input$action })
  output$checkboxOut <- renderPrint({ input$checkbox })
  output$checkGroupOut <- renderPrint({ input$checkGroup })
  output$dateOut <- renderPrint({ input$date })
  output$datesOut <- renderPrint({ input$dates })
  output$fileOut <- renderPrint({ input$file })
  output$numOut <- renderPrint({ input$num })
  output$radioOut <- renderPrint({ input$radio })
  output$selectOut <- renderPrint({ input$select })
  output$slider1Out <- renderPrint({ input$slider1 })
  output$slider2Out <- renderPrint({ input$slider2 })
  output$textOut <- renderPrint({ input$text })

  # Track inputs inputs
  shinyga::gaTrack("action",session,"test","test")
  shinyga::gaTrack("checkbox",session,"test","test")
  shinyga::gaTrack("checkGroup",session,"test","test")
  shinyga::gaTrack("date",session,"test","test")
  shinyga::gaTrack("dates",session,"test","test")
  shinyga::gaTrack("file",session,"test","test")
  shinyga::gaTrack("num",session,"test","test")
  shinyga::gaTrack("radio",session,"test","test")
  shinyga::gaTrack("select",session,"test","test")
  shinyga::gaTrack("text",session,"test","test")
  shinyga::gaTrack("slider1",session,"test","test")
  shinyga::gaTrack("slider2",session,"test","test")

}
