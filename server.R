library(shiny)
library(car)
shinyServer(function(input, output) {
  values <- reactiveValues()
  observe({
    input$action_Calc
    values$int <- isolate({
      (input$autocost / 100) * 10})
    values$int2 <- isolate({
      input$autocm3 * recode(input$autoyear, "1 = '0.063'; 2 = '1.367'; 3 = '1.761'")})
    values$int3 <- isolate({
      values$int2 + input$autocost + values$int})
    values$int4 <- isolate({
      (values$int3 / 100) * 20})
    values$int5 <- isolate({
      values$int + values$int2 + values$int4 + input$autocost})
    })
  output$text_int <- renderText({
    if(input$action_Calc == 0) ""
    else
    paste("Ввізна пошлина:", values$int, "EURO", " | ",
	"Акцизний збір:", values$int2, "EURO", " | ",
	"НДС:", values$int4, "EURO", " | ",
	"Повна вартість:", values$int5, "EURO")
  })
})