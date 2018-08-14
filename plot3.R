# Prepare Data
energyData = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)
filterData <- energyData[energyData$Date == '1/2/2007'| energyData$Date == '2/2/2007',]
time = strptime(paste(filterData$Date, filterData$Time) ,format="%d/%m/%Y %H:%M:%S")

#Draw
png(filename="figure/plot3.png")

with(filterData, plot(time, Sub_metering_1, type="n",
                yaxp = c(0, 30, 3),
                ylab="Energy sub metering",
                xlab=""))
with(filterData, lines(time,  Sub_metering_1))
with(filterData, lines(time,  Sub_metering_2, col="red"))
with(filterData, lines(time,  Sub_metering_3, col="blue"))
legend("topright", lty="solid", col = c("black", "red", "blue"), 
       legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()