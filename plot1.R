energyData = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors=FALSE)
energyData$Date = as.Date(energyData$Date, format = "%d/%m/%Y")
energyData <- energyData[energyData$Date == as.Date('2007-02-01')| energyData$Date == as.Date('2007-02-02'),]
png("figure/plot1.png")
hist(as.numeric(energyData$Global_active_power), # Coverting to kilowatts
     xlab = "Global Active Power (kilowatts)",           # Settin X-label
     main = "Global Active Power",                     # Title of the plot
     col= "red")                                        # fill color
dev.off()