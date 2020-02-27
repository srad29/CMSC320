install.packages("rvest")
library(rvest)
library(tidyverse)
sw <- xml2::read_html("https://www.spaceweatherlive.com/en/solar-activity/top-50-solar-flares")
df <-html_table(sw)
new_frame<- data.frame(df[1])
names(new_frame)[] <-c("rank", "flare_classification", "date", "flare_region", "start_time", "maximum_time", "end_time", "movie")
#displays tibble
step1<-as_tibble(new_frame)

#STEP2
s2 <- new_frame[c(1:7)]
