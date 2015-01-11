library(dplyr)

fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

DataSub <- filter(fullData, Date == "1/2/2007"| Date == "2/2/2007")

DataSub$DateTime <- strptime(paste(DataSub$Date,DataSub$Time),
                             format = "%d/%m/%Y %H:%M:%S")

plot(DataSub$DateTime, DataSub$Global_active_power, type="l"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height=480, width=480, bg = "white")
dev.off()
