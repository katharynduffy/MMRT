rm(list=ls(all=TRUE))
tem <- 273:333
source("MMRT_log.R")
mmrt<-MMRT_log(70000,-50,-1500,tem)
plot(tem,mmrt$rate)
