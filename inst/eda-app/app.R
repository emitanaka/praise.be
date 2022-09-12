library(shiny)
library(praise.be)
library(magrittr)

ui <- fluidPage(
  sidebarLayout(sidebarPanel(radioButtons("season",
                                          "Season",
                                          choices = 1:4,
                                          selected = 1)),
                mainPanel(tableOutput("season_table")))
)

server <- function(input, output, session) {
  output$season_table <- renderTable({
    episode %>%
      subset(as.character(season) == as.character(input$season))
  })
}

shinyApp(ui, server)
