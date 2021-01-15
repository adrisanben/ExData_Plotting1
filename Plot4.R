#Import dataset and open libraries
all <- read.csv(file = "household_power_consumption.txt", sep = ";", header =T)
all$Date <- as.Date(all$Date, format = "%d / %m / %Y")
subset <- subset(all, Date == "2007-02-01" | Date == "2007-02-02")

library(tidyverse)

dev.cur()
png(filename = "Plot4.png", width = 480, height = 480)

#Days vs Global active power
data <- subset[, c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
datetimepaste <- paste(subset$Date, subset$Time , sep = " ")
datetime <- strptime(datetimepaste, format = "%Y-%m-%d %H:%M:%S")
data$Date <- datetime
par(mfcol = c(2,2))
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

#Energy Submetering
plot(data$Date,data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$Date,data$Sub_metering_2, type ="l", col="blue")
lines(data$Date, data$Sub_metering_3, type ="l", col="red")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),
       lty = 1, lwd = 2.5)

#Voltage
plot(data$Date,data$Voltage,type="l", ylab="Voltage", xlab="datetime")

#Global Reactive Power
plot(data$Date, data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime" )
dev.off()







