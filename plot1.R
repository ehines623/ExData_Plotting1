library(dplyr)


#Read in the data from the local directory
fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))

fullData$Date <- as.Date(fullData$Date, "%d/%m/%Y")


#subset to only the 2 days that we care about
DataSub <- filter(fullData, Date == "2007-2-1"| Date == "2007-2-2")

#open the png file for writing (can be commented out to display in window)
png(file = "plot1.png",height=480, width=480, bg = "white")

#make the plot
hist(DataSub$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)"
,ylab="Frequency")

#uncomment this line if displaying to window and want to copy to file
#note may be some slight differences in the copy 
#dev.copy(png, file = "plot1.png", height=480, width=480, bg = "white")
dev.off()
