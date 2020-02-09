#should the data import be moved to dockerfile?
devtools::install_github("alastairrushworth/tdf")
#https://www.htmlwidgets.org/showcase_datatables.html
library(tdf) #Tour De France Data
library(tidyverse)

?editions
nrow(editions)
ncol(editions)
editions$stage_results[0]
nrow(editions$stage_results[0])
class(editions$stage_results)
#https://www.r-bloggers.com/how-to-use-lists-in-r/
editions$start_date
colnames(editions)
hist(editions$nationality)
hist(editions$distance)
hist(editions$height)
hist(editions$weight)
hist(editions$stage_wins)
hist(editions$time_overall)
hist(editions$time_margin)


hist(editions$distance/editions$time_overall)
class(editions$start_date)
plot(year(editions$start_date),editions$distance)
plot(year(editions$start_date),length(editions$stage_results[0]))
count(editions$stage_results$`1903`)
summarise(editions$stage_results)
editions$stage_results$`1903`

lapply(mylist, function(x) mean(x))


unestestedfdsfs <- editions %>% unnest(stage_results)


colnames(unestestedfdsfs)

#https://stackoverflow.com/questions/43787663/how-to-count-rows-in-nested-data-frames-with-dplyr
editions %>% 
  mutate(num_stages = map_dfr(stage_results, nrow))


editions %>% 
  group_by(start_date) %>%
  mutate(N = nrow(data.frame(stage_results)))


sapply(editions$stage_results, nrow)

editions %>%
  rowwise() %>%
  mutate(Num_Stages = nrow(stage_results))

editions$stage_results



apply(editions$stage_results, 1, nrow)

nrow(editions$stage_results[1])


#get number of stages in each edition
editions %>% group_by(start_date)  %>% tally(stage_results)
#
num_stages <- editions %>% unnest(stage_results) %>% group_by(start_date)  %>% tally()
editions_join_stage <- editions %>% inner_join(num_stages)
#rename column
colnames(editions_join_stage)[which(names(editions_join_stage) == "n")] <- "num_stages"

#length of stages decreasing
plot(year(editions_join_stage$start_date), editions_join_stage$distance/editions_join_stage$num_stages)

#nationality of winners
editions %>% count(winner_name,nationality)

colnames(editions_join_stage)

#http://www.htmlwidgets.org/showcase_plotly.html


colnames(editions)

nrow(editions)

#https://www.wjst.de/blog/sciencesurf/2019/11/tour-de-france-average-speed/

#https://alastairrushworth.github.io/Visualising-Tour-de-France-data-in-R/


editions$stage_results$`2019`$`stage-21`


class(editions$stage_results)
class(editions$stage_results[1])
editions$stage_results[1]$`1903`$`stage-1`


editions$stage_results[[99]][5]


#latern rouge
latern_rouge_data <- editions %>% 
  unnest(stage_results)

latern_rouge_data <- latern_rouge_data %>% 
  unnest(stage_results[1])

latern_rouge_data$stage_results[[1]]

glimpse(latern_rouge_data)
rlang::last_error()
?top_n
latern_rouge_data %>% top_n(5)

speariment <- editions %>% map(unlist) %>% as_tibble()
speariment

#https://stackoverflow.com/questions/38860380/unnesting-a-list-of-lists-in-a-data-frame-column
speariment <- editions %>% bind_rows(editions) %>%    # make larger sample data
  mutate_if(is.list, simplify_all) %>%    # flatten each list element internally 
  unnest()    # expand
speariment
glimpse(speariment)


s2 <- editions %>% unnest(stage_results)
glimpse(s2)

s2 <- s2 %>% bind_rows(s2) %>%    # make larger sample data
  mutate_if(is.list, simplify_all) #%>%    # flatten each list element internally 
  #unnest()    # expand
glimpse(s2)
s2


editions[1,"stage_results"]

add_latern_rouge <- function(stage_results) {
   
}


num_stages <- editions %>% unnest(stage_results) %>% group_by(start_date)  %>% tally()
editions_join_stage <- editions %>% inner_join(num_stages)
#rename column
colnames(editions_join_stage)[which(names(editions_join_stage) == "n")] <- "num_stages"

tdf_data <- mutate(editions_join_stage, year = year(start_date), month = month(start_date)) %>%
  select(edition,year,month,winner_name,distance,time_overall,time_margin,stage_wins,stages_led,height,weight,age,nationality,num_stages)
glimpse(tdf_data) 
head(tdf_data)
summary(as.factor(tdf_data$nationality))

plot(as.factor(tdf_data$nationality))


#mutate(nationfality = reorder(state, murder_rate)) %>%
ggplot(data = tdf_data) +
  geom_bar(mapping = aes(x = nationality))



# winners_nationality <- tdf_data %>% 
#   group_by(nationality) %>% 
#   mutate(num_wins = tally()) %>%
#   mutate(state = reorder(state, murder_rate)) %>%
#   ggplot(aes(state, murder_rate)) +
#   geom_bar(stat="identity") +
#   coord_flip() +
#   theme(axis.text.y = element_text(size = 6)) +
#   xlab("")

#start here
#create initial dataset
devtools::install_github("alastairrushworth/tdf")
#https://www.htmlwidgets.org/showcase_datatables.html
library(tdf) #Tour De France Data
library(tidyverse)
library(lubridate) #is this needed, try again after moving other library calls up
library(DT)
library(plotly)

num_stages <- editions %>% unnest(stage_results) %>% group_by(start_date)  %>% tally()
editions_join_stage <- editions %>% inner_join(num_stages)
#rename column
colnames(editions_join_stage)[which(names(editions_join_stage) == "n")] <- "num_stages"
editions
tdf_data <- mutate(editions_join_stage, year = year(start_date), month = month(start_date)) %>%
  select(edition,year,month,winner_name,nickname,age, distance,time_overall,time_margin,stage_wins,stages_led,height,weight,age,nationality,num_stages)
tdf_data
# winners_nationality <- tdf_data %>% 
#   group_by(nationality) %>% 
#   tally() %>%
#   mutate(num_wins = reorder(nationality, n)) #%>%
# winners_nationality  



winners_nationality_data <- tdf_data %>%
  select(nationality) %>% #select(year, winner_name, nickname, age, nationality)
  group_by(nationality) %>%
  tally(name = "NumberWins")
#https://dplyr.tidyverse.org/reference/arrange.html
ordered_winners_nationality_data <- arrange(winners_nationality_data, desc(NumberWins))  
datatable(ordered_winners_nationality_data, options = list(pageLength = 20), rownames = FALSE)
#winners_nationality_data <- winners_nationality_data %>%
#  order_by(NumberWins, cumsum(NumberWins))

winners_nationality_data
  #https://dplyr.tidyverse.org/reference/tally.html
#https://rstudio.github.io/DT/

datatable(winners_nationality_data, options = list(pageLength = 20), rownames = FALSE)

#who are the oldest and yougest winners, average?

winners_nationality_plot <- ggplot(data = tdf_data) +
  geom_bar(mapping = aes(x = nationality))
#p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
#  geom_bar(position = "dodge")
#When was the last time a French person won?
ggplotly(winners_nationality_plot)


#what do you know about the Tour De France
#TDF is a race that people who know nothing else about bike racing know about.
#This dashboard shows things they may not know.

#show top ten winningest countries

#french drought. there has been a drought of the French


#distance and stages over the years
tdf_data

distance_plot <- ggplot(data = tdf_data) +
  geom_point(mapping= aes(x = year, y =  distance, colour = nationality)) +
  theme(legend.position="none")

ggplotly(distance_plot)

#https://stackoverflow.com/questions/35618260/remove-legend-ggplot-2-2
  #geom_text(aes(x = year, y = distance, label = nationality), 
  #          show.legend = FALSE)

num_stages_plot <- ggplot(data = tdf_data) +
  geom_point(mapping= aes(x = year, y =  num_stages))
num_stages_plot

ave_stage_distance <- ggplot(data = tdf_data) +
  geom_point(mapping= aes(x = year, y =  distance / num_stages))

#add column for isFrench, isAmerican, LeMond slaying the Badger. Famous Rivalry between LeMond and Badger Did he also slay the French hopes of victory?

#distance_plot <- distance_plot +
#  geom_point(mapping= aes(x = year, y =  distance / num_stages))

ggplotly(ave_stage_distance)
#note the breaks from 1914 to 1919, and 1939 to 1947, WWI and WWII
#discontinuities after the wars

ggplotly(ave_stage_distance)

#put on dual axis


#overall speed and length of stages

#speed of stages and distance of stages over time

#american winners, one with *, winner at the end of the race.

#wins over over threshold of 10 by nation

