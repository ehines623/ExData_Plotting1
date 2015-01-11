library(dplyr)

fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

DataSub <- filter(fullData, Date == "1/2/2007"| Date == "2/2/2007")

DataSub$DateTime <- strptime(paste(DataSub$Date,DataSub$Time),
                             format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfcol = c(2,2))

plot(DataSub$DateTime, DataSub$Global_active_power, type="l"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")

plot(DataSub$DateTime, DataSub$Sub_metering_1,type="n", xlab = ""
     , ylab = "Energy sub metering")

lines(DataSub$DateTime, DataSub$Sub_metering_1, col = "black")
lines(DataSub$DateTime, DataSub$Sub_metering_2, col = "red")
lines(DataSub$DateTime, DataSub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty = c(1,1,1), col= c("black","red","blue")
       , box.lwd = 0)

plot(DataSub$DateTime, DataSub$Voltage, type ="l"
     , xlab = "datetime", ylab = "Voltage")

plot(DataSub$DateTime, DataSub$Global_reactive_power
     , type = "l",  xlab = "datetime", ylab="Global_reactive_power")



#dev.copy(png, file = "plot4.png", height=480, width=480, bg = "white")
dev.off()

