#author Matt Allen
#20200331

library(shiny)
library(shinythemes)
library(readr)
library(tidyverse)
library(lubridate)
library(plotly)
library(DT)

#this shiny app just focuses on states in the midwest
midwest_states <- c(
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Michigan",
  "Minnesota",
  "Missouri",
  "Nebraska",
  "North Dakota",
  "Ohio",
  "South Dakota",
  "Wisconsin"
)

#get the names of the csv files from the directory where data is stored
files <-
  list.files(path = "COVID-19-master/csse_covid_19_data/csse_covid_19_daily_reports",
             pattern = "*.csv",
             full.names = T)

#function to select columns from csv
#csv files have inconsistent columns and column names
select_cols <- function(daily_report) {
  #adjust column names. column names have been changed over time.
  daily_report <-
    possibly(rename, otherwise = daily_report)(daily_report, Report_Date = `Last Update`)
  daily_report <-
    possibly(rename, otherwise = daily_report)(daily_report, Report_Date = Last_Update)
  daily_report <-
    possibly(rename, otherwise = daily_report)(daily_report, State = `Province/State`)
  daily_report <-
    possibly(rename, otherwise = daily_report)(daily_report, State = Province_State)
  daily_report <-
    possibly(rename, otherwise = daily_report)(daily_report, Country_Region = `Country/Region`)
  
  daily_report <- daily_report %>%
    mutate(Report_Date = as.character(Report_Date)) %>%
    select(Report_Date,
           State,
           Country_Region,
           Confirmed,
           Deaths,
           Recovered)
  
  return(daily_report)
}

#build dataset
covid19_data <- sapply(files, read_csv, simplify = FALSE) %>%
  sapply(., select_cols, simplify = FALSE) %>%
  bind_rows(.id = "id") %>%
  mutate(Date = mdy(substr(id, str_length(id) - 13, str_length(id) - 4)))

# Define UI ----
ui <- fluidPage(
  theme = shinytheme("flatly"),
  title = "Midwest Covid 19 Cases",
  fluidRow(column(6, offset = 1, h1(
    "Covid 19 Cases in the Midwest"
  )),),
  fluidRow(
           # State Selection
           column(
             3, offset = 1,
             selectInput(
               inputId = "state",
               label = strong("Select State"),
               choices = midwest_states,
               selected = "Wisconsin"
             )
           )),
  
  fluidRow(
    column(4, offset = 1, DT::dataTableOutput("state_table")),
    column(6, offset = 1, plotlyOutput(outputId = "lineplot", height = 450))
  )
  
)

# Define server logic ----
server <- function(input, output) {
  state_data <- reactive(
    filter(covid19_data, State == input$state) %>%
      group_by(State, Date) %>%
      summarise_at(c("Confirmed", "Recovered", "Deaths"), sum, na.rm = TRUE)
  )
  
  # render state data table
  output$state_table <-
    DT::renderDataTable(state_data(), server = FALSE)
  
  # Create plot of cases
  output$lineplot <- renderPlotly({
    
    state_plot <-
      ggplot(state_data(), aes(Date, y = Cases, color = Cases)) +
      ggtitle(paste(input$state, 'Covid 19 Cases')) +
      geom_line(aes(y = Confirmed, col = "Confirmed")) +
      geom_line(aes(y = Recovered, col = "Recovered")) +
      geom_line(aes(y = Deaths, col = "Deaths")) +
      theme_bw()
    ggplotly(state_plot)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)