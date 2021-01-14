#Import dataset and open libraries
all <- read.csv(file = "household_power_consumption.txt", sep = ";", header =T)
library("base")

#Separate 2007-02-01 and 2007-02-02.
dates <- as.Date(all$Date , "%d / %m / %Y")
all$Date <- NULL
aall <- cbind(dates,all)
feb_days <- subset(aall, dates == "2007-02-01" | dates == "2007-02-02")

#Global active power Plot
GAP <- as.numeric(feb_days$Global_active_power)
hist(GAP,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power",
     col = "red", axes = T)
