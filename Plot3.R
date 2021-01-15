#Import dataset and open libraries
all <- read.csv(file = "household_power_consumption.txt", sep = ";", header =T)
all$Date <- as.Date(all$Date, format = "%d / %m / %Y")
subset <- subset(all, Date == "2007-02-01" | Date == "2007-02-02")

library(tidyverse)

dev.cur()
png(filename = "Plot3.png", width = 480, height = 480)

#Separate 2007-02-01 and 2007-02-02.
ESM <- subset[, c("Date","Time","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
datetimepaste <- paste(subset$Date, subset$Time , sep = " ")
datetime <- strptime(datetimepaste, format = "%Y-%m-%d %H:%M:%S")
ESM$Date <- datetime

plot(ESM$Date,ESM$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(ESM$Sub_metering_2, type = "l", col="blue")
lines(ESM$Sub_metering_3, type = "l", col="red")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),
       lty = 1, lwd = 2.5)
dev.off()