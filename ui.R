library(shiny)
shinyUI(fluidPage(
  titlePanel("Калькулятор розмитнення авто в Україні"),
  sidebarLayout(
    sidebarPanel(
      numericInput("autocost", label = h6("Ціна автомобіля: "), value = 100),
      numericInput("autocm3", label = h6("Обєм двигуна (см3): "), value = 1500),
      selectInput("autoyear", label = h6("Роки експлуатації авто: "), choices = list("Новий автомобіль" = 1, "Використовувався до 5 років" = 2, "Використовувався більше 5 років" = 3), selected = 1),
      actionButton("action_Calc", label = "Розрахувати")),
    mainPanel("",p(h5("")), textOutput("text_int")))))