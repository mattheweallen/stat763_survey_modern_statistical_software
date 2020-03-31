library(shiny)
library(shinythemes)
library(readr)
library(tidyverse)
library(lubridate)
library(plotly)
library(DT)

# #get data from github
# urlfile <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
# confirmed_data <- read_csv(url(urlfile))
# 
# urlfile <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
# deaths_data <- read_csv(url(urlfile))
# 
# urlfile <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"
# recovered_data <- read_csv(url(urlfile))




#create list of endings for file name. do for each
#download repo, open and read all the files that have a data ending into single data frame.
#https://stackoverflow.com/questions/48612676/how-to-download-entire-repository-from-github-using-r/48614528
# set working directory so I know where the .zip file will be located
#setwd(dir = "/some/path/")
#setwd("/home/rstudio")
current_dir <- getwd()

#commented out start
#wget https://github.com/CSSEGISandData/COVID-19/archive/master.zip
#data_url = "https://github.com/CSSEGISandData/COVID-19/archive/master.zip"

# download a .zip file of the repository
# from the "Clone or download - Download ZIP" button
# on the GitHub repository of interest
#download.file(url = data_url
#              , destfile = "COVID-19-master.zip")

# unzip the .zip file
#unzip(zipfile = "COVID-19-master.zip")
#unzip(zipfile = "master.zip")

# set the working directory
# to be inside the newly unzipped
# GitHub repository of interest
#setwd(dir = "COVID-19-master/csse_covid_19_data/csse_covid_19_daily_reports")
# examine the contents
#list.files()
#https://blog.exploratory.io/how-to-read-multiple-excel-or-csv-files-together-42af5d314a10
files <- list.files(path = "COVID-19-master/csse_covid_19_data/csse_covid_19_daily_reports", pattern = "*.csv", full.names = T)


#sapply(files, read_csv, simplify=FALSE)
#https://stackoverflow.com/questions/46789010/error-in-bind-rows-x-id-column-cant-be-converted-from-factor-to-numeric
#https://www.datalorax.com/post/a-tidyeval-use-case/

#column names in the files have changed over time.
#this function standardizes names and selects columns

#https://github.com/tidyverse/dplyr/issues/3211
select_cols <-function(daily_report) {

  #adjust column names. column names have been changed over time.
  daily_report <- possibly(rename, otherwise = daily_report)(daily_report, Report_Date = `Last Update`)
  daily_report <- possibly(rename, otherwise = daily_report)(daily_report, Report_Date = Last_Update)
  daily_report <- possibly(rename, otherwise = daily_report)(daily_report, Province_State = `Province/State`)
  daily_report <- possibly(rename, otherwise = daily_report)(daily_report, Country_Region = `Country/Region`)

  #daily_report <- daily_report %>%
  #  mutate(File_Date = substr(id, length(id) - 10,length(id) - 4))
  #print(daily_report)
  #possibly() rename(daily_report, report_date = `Last Update`)
  #rename(daily_report, report_date = Last_Update)
 #TODO clean up report date column, it currently had different formats

  daily_report <- daily_report %>%
    mutate(Report_Date = as.character(Report_Date)) %>%
    select(Report_Date,
        Province_State,
        Country_Region,
        Confirmed,
        Deaths,
        Recovered)
  #print(daily_report)
  return(daily_report)
}

covid19_data <- sapply(files, read_csv, simplify=FALSE) %>%
  sapply(.,select_cols, simplify = FALSE) %>%
  bind_rows(.id = "id") %>%
  mutate(File_Date = mdy(substr(id, str_length(id) - 13,str_length(id) - 4)))

#class(covid19_data$File_Date)

#test <- "COVID-19-master/csse_covid_19_data/csse_covid_19_daily_reports/01-22-2020.csv"
#substr(test,str_length(test)-13,str_length(test)-4)
#length("COVID-19-master/csse_covid_19_data/csse_covid_19_daily_reports/01-22-2020.csv")

#covid19_data <- covid19_data %>%
#  mutate(Report_Date = ymd(Report_Date))
#covid19_data[[1]]


#clean up downloads. remove the files
#setwd(current_dir)
#file.remove("COVID-19-master.zip")
#unlink("COVID-19-master", recursive = TRUE)

#merge data set

#extract year month day from column, and make new column for all data sets
#commented out end



#geom_point(aes(y = Deaths, col = "Deaths"), size=2, shape=11)
  #summarize(Total_Confirmed = sum(Confirmed, na.rm = TRUE)) %>%
  #summarize(Total_Recovered = sum(Recovered, na.rm = TRUE))
  

midwest_states <- c("Illinois",
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
                    "Wisconsin")

# Define UI ----
ui <- fluidPage(theme = shinytheme("paper"),
                title = "Midwest Covid Cases",
                fluidRow(
                  column(6, h1("Covid 19 Cases in the Midwest")),
                
                    
                ),
                fluidRow(
                  column(2, h3("Select State: ")),
                  
                  
                  # Select type of trend to plot
                  column(4, selectInput(inputId = "state", label = strong("State"),
                                        choices = midwest_states,
                                        selected = "Wisconsin"))
                ),
                    # # Select date range to be plotted
                    # dateRangeInput("date", strong("Date range"), start = "2007-01-01", end = "2017-07-31",
                    #                min = "2007-01-01", max = "2017-07-31"),
                    # 
                    # # Select whether to overlay smooth trend line
                    # checkboxInput(inputId = "smoother", label = strong("Overlay smooth trend line"), value = FALSE),
                    # 
                    # # Display only if the smoother is checked
                    # conditionalPanel(condition = "input.smoother == true",
                    #                  sliderInput(inputId = "f", label = "Smoother span:",
                    #                              min = 0.01, max = 1, value = 0.67, step = 0.01,
                    #                              animate = animationOptions(interval = 100)),
                    #                  HTML("Higher values give more smoothness.")
                    #)
                  
                  
                  # Output: Description, lineplot, and reference
                
                    fluidRow(
                      #column(6, DT::dataTableOutput('x1')),
                      column(8, plotlyOutput(outputId = "lineplot"))
                    ),
                    fluidRow(
                      column(12, DT::dataTableOutput("x1"))
                        #column(8, plotlyOutput(outputId = "lineplot", height = "300"))
                    )
                    #plotlyOutput(outputId = "lineplot", height = "300"),
                    #DT::dataTableOutput("x1")
                    #textOutput(outputId = "desc")
                  
              
)

# Define server logic ----
server <- function(input, output) {
  #state_data <- reactive(filter(covid19_data, Province_State == input$state))
  
  
  # render the table (with row names)
  output$x1 <- DT::renderDataTable(filter(covid19_data, Province_State == input$state), server = FALSE)
      
  # Create scatterplot object the plotOutput function is expecting
  output$lineplot <- renderPlotly({
    
    state_data <- filter(covid19_data, Province_State == input$state) %>%
      group_by(Province_State, File_Date) %>%  
      summarise_at(c("Confirmed", "Recovered", "Deaths"), sum, na.rm = TRUE)
      
    #put title of state summary
    state_plot <- ggplot(state_data, aes(File_Date, y = Cases, color = Cases)) + 
      geom_line(aes(y = Confirmed, col = "Confirmed")) + 
      geom_line(aes(y = Recovered, col = "Recovered")) + 
      geom_line(aes(y = Deaths, col = "Deaths"))
    ggplotly(state_plot)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)