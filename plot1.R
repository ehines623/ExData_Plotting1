fullData <- read.table("household_power_consumption.txt",header=TRUE, sep =";",
                       na.strings="?",
                       colClasses=c("character","character","numeric","numeric",
                                    "numeric","numeric","numeric","numeric",
                                    "numeric"))



hist(fullData$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)",
,ylab="Frequency")

dev.copy(png, file = "plot1.png")
dev.off()
