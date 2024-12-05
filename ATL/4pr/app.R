library(shiny)

# UI Section
ui <- fluidPage(
  titlePanel("Enhanced Project on R"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Sidebar Panel"),
      selectInput("color", "Pick a color:", 
                  choices = c("Red", "Blue", "Green")),
      numericInput("value", "Enter a number:", value = 5, min = 1, max = 100)
    ),
    mainPanel(
      h3("Main Panel"),
      textOutput("selectedColor"),
      textOutput("enteredValue")
    )
  ),
  
  # Add some light CSS for a better look
  tags$head(
    tags$style(HTML("
      body { font-family: 'Arial', sans-serif; background-color: #f9f9f9; }
      .title-panel { text-align: center; color: #4CAF50; }
      .sidebar-panel, .main-panel { margin-top: 10px; padding: 10px; }
    "))
  )
)

# Server Section
server <- function(input, output) {
  output$selectedColor <- renderText({
    paste("You selected the color:", input$color)
  })
  output$enteredValue <- renderText({
    paste("You entered the number:", input$value)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
