library(dplyr)

fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

fullData$Date <- as.Date(fullData$Date, "%d/%m/%Y")
##fullData$Time <- strptime(fullData$Time,"%H:%M:%S")

DataSub <- filter(fullData, Date == "2007-2-1"| Date == "2007-2-2")

hist(DataSub$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)",
,ylab="Frequency")

dev.copy(png, file = "plot1.png", height=480, width=480, bg = "white")
dev.off()
