#Butterfly movement analysis with new datascopes
#Edge behavior from 2013
#7/14/14
library(lubridate)
library(stringr)

setwd("C:/Users/Tyson/Dropbox/Bragg movement/reconciled data")

date.folders <- list.files()

#for each date/site folder, there are 2 or more data files
data.files <- list.files(list.files()[1])

test <- read.table(file = paste(date.folders[1], data.files[5], sep = "/"), header = FALSE)

test$date <- str_split_fixed(test$V4, pattern = "T", 2)[,1]
test$time <- str_split_fixed(test$V4, pattern = "T", 2)[,2]
test$time <- str_split_fixed(test$time, pattern = "-", 2)[,1]
test$date.time <- ymd_hms(paste(test$date, test$time, sep = "_"))

data <- test[, c("V5", "date.time")]
names(data) <- c("bearing", "date.time")

