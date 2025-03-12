library(data.table)
library(dplyr)
library(plotly)
library(shiny)
library(bslib)

source("./my_functions.R")

ui <- fluidPage(
  theme = bs_theme(bootswatch = "vapor"),
  titlePanel("Total salary by Country"),
  sidebarLayout(
    sidebarPanel(
      selectInput("theme", "Choose a theme:",
                  choices = c("vapor", "flatly"),
                  selectize = FALSE,
                  selected = "vapor"),
      numericInput("my_num", "Enter a number", 
                   value = 5,
                   min = 3,
                   max = 10)
    ),
    mainPanel(
      plotlyOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  observe({
    session$setCurrentTheme(
      bs_theme(bootswatch = input$theme)
    )
  })
  
  output$plot <- renderPlotly({
    data <- load_data(input$my_num)
    
    fig <- draw_plot(data)
    
    fig <- htmlwidgets::onRender(fig, sprintf("
      function(el, x) {
        el.setAttribute('aria-label', 'Bar plot showing %s columns');
      }
    ", input$my_num))
    
    fig
  })
}

shinyApp(ui, server)