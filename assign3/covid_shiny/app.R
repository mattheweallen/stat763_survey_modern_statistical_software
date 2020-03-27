library(shiny)

# Define UI ----
ui <- fluidPage(
  "hello matt!" 
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)