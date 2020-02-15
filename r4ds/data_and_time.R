#note did not understand the clock math with division by 100 at first,
#but after looking data see an example dep_time like 517 understand. 
#Was thinking it was like in milliseconds.
#It is in HHMM or HMM format.

120%/%100
library(nycflights13)
library(lubridate)
flights %>% 
  select(year,month,day,hour,minute) %>%
  mutate(departure = make_datetime(year,month,day,hour,minute))

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))
flights_dt
flights
?flights

60*60*24
