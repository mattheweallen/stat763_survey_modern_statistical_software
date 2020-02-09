devtools::install_github("alastairrushworth/tdf")
#https://www.htmlwidgets.org/showcase_datatables.html
library(tdf) #Tour De France Data
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


editions$stage_results[[99]][1]
