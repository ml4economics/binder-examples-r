library(shiny)

# Benutzeroberfläche definieren
ui <- fluidPage(
  titlePanel("Beispiel einer Shiny-App"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Anzahl der Balken:", min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Serverlogik definieren
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]  # Old Faithful Geysir Daten
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white', main = 'Geysir eruptions')
  })
}

# Shiny-App erstellen
shinyApp(ui = ui, server = server)
