library(dplyr)
#read in full data
fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

#subset to dates we care about
DataSub <- filter(fullData, Date == "1/2/2007"| Date == "2/2/2007")

#make a new feature combining day and time into useful format
DataSub$DateTime <- strptime(paste(DataSub$Date,DataSub$Time),
                             format = "%d/%m/%Y %H:%M:%S")

#open png file for writing, can be commented out for display to screen
png(file = "plot3.png",height=480, width=480, bg = "white")

#make the plot, initially empty
plot(DataSub$DateTime, DataSub$Sub_metering_1,type="n", xlab = ""
     , ylab = "Energy sub metering")

#plot the 3 difference sub meters
lines(DataSub$DateTime, DataSub$Sub_metering_1, col = "black")
lines(DataSub$DateTime, DataSub$Sub_metering_2, col = "red")
lines(DataSub$DateTime, DataSub$Sub_metering_3, col = "blue")

#make the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty = c(1,1,1), col= c("black","red","blue")
       , text.width= strwidth("Sub_metering_1"))

#uncomment this line if displaying to screen and want to also copy to png
#may be some slight differences in the copy
#dev.copy(png, file = "plot3.png", height=480, width=480, bg = "white"
#         , pointsize = 12)
dev.off()
