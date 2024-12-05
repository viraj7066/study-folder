library(shiny)

# UI Section
ui <- fluidPage(
  # Title Panel
  titlePanel(
    div(style = "color: white; background-color: #2C3E50; padding: 10px; border-radius: 5px;",
        h1("First R Project", style = "text-align: center;"))
  ),
  
  # Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      style = "background-color: #E8F6F3; border-radius: 10px; padding: 15px;",
      h3("Sidebar Panel", style = "color: #16A085; text-align: center;"),
      selectInput("theme", "Choose a Theme:", 
                  choices = c("Light", "Dark", "Colorful")),
      sliderInput("slider", "Adjust Value:", min = 1, max = 100, value = 50)
    ),
    mainPanel(
      style = "background-color: #FDFEFE; border: 1px solid #E5E7E9; border-radius: 10px; padding: 15px;",
      h3("Main Panel", style = "color: #2980B9; text-align: center;"),
      h4("Your Selections:", style = "color: #34495E; margin-top: 15px;"),
      textOutput("themeText"),
      textOutput("sliderValue")
    )
  )
)

# Server Section
server <- function(input, output) {
  output$themeText <- renderText({
    paste("Selected Theme:", input$theme)
  })
  output$sliderValue <- renderText({
    paste("Slider Value:", input$slider)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
