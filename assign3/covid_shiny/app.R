library(shiny)
library(readr)
library(tidyverse)
library(lubridate)

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
#current_dir <- getwd()

data_url = "https://github.com/CSSEGISandData/COVID-19/archive/master.zip"

# download a .zip file of the repository
# from the "Clone or download - Download ZIP" button
# on the GitHub repository of interest
download.file(url = data_url
              , destfile = "COVID-19-master.zip")

# unzip the .zip file
unzip(zipfile = "COVID-19-master.zip")

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
  
  #possibly() rename(daily_report, report_date = `Last Update`)
  #rename(daily_report, report_date = Last_Update)
  
  
  daily_report <- daily_report %>%
    mutate(Report_Date = as.character(Report_Date)) %>%
    select(Report_Date,
        Province_State,
        Country_Region,
        Confirmed, 
        Deaths, 
        Recovered)
  print(daily_report)
  return(daily_report)

}

covid19_data <- sapply(files, read_csv, simplify=FALSE) %>%
  sapply(.,select_cols, simplify = FALSE) %>%
  bind_rows(.id = "id")

#covid19_data[[1]]


#clean up downloads. remove the files
#setwd(current_dir)
file.remove("COVID-19-master.zip")
unlink("COVID-19-master", recursive = TRUE)

#merge data set

#extract year month day from column, and make new column for all data sets


# Define UI ----
ui <- fluidPage(
  "how are you matt?" 
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)