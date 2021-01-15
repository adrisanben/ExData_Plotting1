#Import dataset and open libraries
all <- read.csv(file = "household_power_consumption.txt", sep = ";", header =T)
library(tidyverse)

dev.cur()
png(filename = "Plot2.png", width = 480, height = 480)
#Separate 2007-02-01 and 2007-02-02.
dates <- as.Date(all$Date , "%d / %m / %Y")
aall <- cbind(dates,all)
dateandtime <- paste(all$Date,aall[,3],sep = " ")
feb_dates <- subset(dateandtime, dates == "2007-02-01" | dates == "2007-02-02")
time <- strptime(feb_dates, format = "%d / %m / %Y %H:%M:%S")
GAP <- aall[, c("dates","Global_active_power")]
globactpwr <- subset(GAP, dates == "2007-02-01" | dates == "2007-02-02")

#Days vs Global active power
plot(time,globactpwr$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()
