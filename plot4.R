# Prepare Data
energyData = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)
filterData <- energyData[energyData$Date == '1/2/2007'| energyData$Date == '2/2/2007',]
time = strptime(paste(filterData$Date, filterData$Time) ,format="%d/%m/%Y %H:%M:%S")


png(filename="figure/plot4.png")

par(mfrow=c(2,2))

with(filterData, plot(time, Global_active_power, type="l", 
                ylab="Global Active Power (kilowatts)",
                xlab="",))

with(filterData, plot(time, Voltage, type = "l", xlab = ""))

with(filterData, plot(time, Sub_metering_1, type="l", col="black", log="",
                lines(time, Sub_metering_2, col="red"),
                lines(time, Sub_metering_3, col="blue"),
                yaxp = c(0, 30, 3),                
                ylab="Energy sub metering",
                xlab="",                
                legend("topright", lty="solid", col = c("black", "red", "blue"), 
                       legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
))

with(filterData, plot(time, Global_reactive_power, type = "l"))

dev.off()