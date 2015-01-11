library(dplyr)

fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

DataSub <- filter(fullData, Date == "1/2/2007"| Date == "2/2/2007")

DataSub$DateTime <- strptime(paste(DataSub$Date,DataSub$Time),
                             format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png",height=480, width=480, bg = "white")

plot(DataSub$DateTime, DataSub$Sub_metering_1,type="n", xlab = ""
     , ylab = "Energy sub metering")

lines(DataSub$DateTime, DataSub$Sub_metering_1, col = "black")
lines(DataSub$DateTime, DataSub$Sub_metering_2, col = "red")
lines(DataSub$DateTime, DataSub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty = c(1,1,1), col= c("black","red","blue")
       , text.width= strwidth("Sub_metering_1"))


#dev.copy(png, file = "plot3.png", height=480, width=480, bg = "white"
#         , pointsize = 12)
dev.off()
