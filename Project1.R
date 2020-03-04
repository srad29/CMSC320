install.packages("rvest")
library(rvest)
library(tidyverse)
library(lubridate)
sw <- xml2::read_html("https://www.spaceweatherlive.com/en/solar-activity/top-50-solar-flares")
df <-html_table(sw)
new_frame<- data.frame(df[1])
names(new_frame)[] <-c("rank", "flare_classification", "date", "flare_region", "start_time", "maximum_time", "end_time", "movie")
#displays tibble
step1<-as_tibble(new_frame)

#STEP2
s2 <- new_frame[-(ncol(new_frame))] #removes last column
start_datetime<-with(s2, ymd(date)+hm(start_time))
s2[["start_time"]]<-start_datetime
max_datetime<-with(s2, ymd(date)+hm(maximum_time))
s2[["maximum_time"]]<-max_datetime
end_datetime<-with(s2, ymd(date)+hm(end_time))
s2[["end_time"]]<-end_datetime
s2<-rename(s2, start_datetime= start_time, max_datetime=maximum_time, end_datetime=end_time)
s2[-c(3)]
