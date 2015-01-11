library(dplyr)
#read in the data
fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

#subset to the dates we care about
DataSub <- filter(fullData, Date == "1/2/2007"| Date == "2/2/2007")

#make a new feature that combines date and time into a more useful format
DataSub$DateTime <- strptime(paste(DataSub$Date,DataSub$Time),
                             format = "%d/%m/%Y %H:%M:%S")

#open the png file for writing (can be commented out to display to screen)
png(file = "plot2.png",height=480, width=480, bg = "white")

#make the line plot
plot(DataSub$DateTime, DataSub$Global_active_power, type="l"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")


#uncomment if displaying to screen and want to also  copy, maybe some
#slight differences
#dev.copy(png, file = "plot2.png", height=480, width=480, bg = "white")
dev.off()
