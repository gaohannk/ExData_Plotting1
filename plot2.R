energyData = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)
filterData <- energyData[energyData$Date == '1/2/2007'| energyData$Date == '2/2/2007',]
png("figure/plot2.png")
time = strptime(paste(filterData$Date, filterData$Time) ,format="%d/%m/%Y %H:%M:%S")
plot(time, as.numeric(filterData$Global_active_power),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     main = "" )                                    
dev.off()