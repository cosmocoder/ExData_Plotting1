## Code to plot sub-meter readings vs. time


# Load the data
dataPath <- 'data/household_power_consumption.txt'
totalData <- read.table(dataPath, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

# consider only those data that lie between 1/2/2007 and 2/2/2007
subsetData <- totalData[totalData$Date %in% c('1/2/2007', '2/2/2007'), ]

# read and combine the data from Date and Time columns
dates <- strptime(paste(subsetData$Date, subsetData$Time, sep = ' '), '%d/%m/%Y %H:%M:%S')

# read the data from Global_active_power column
globalActivePower <- as.numeric(subsetData$Global_active_power)

# read the data from Global_reactive_power column
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)

# store the sub-meter readings
subMeter1 <- as.numeric(subsetData$Sub_metering_1)
subMeter2 <- as.numeric(subsetData$Sub_metering_2)
subMeter3 <- as.numeric(subsetData$Sub_metering_3)

# store the Voltage readings
voltage <- as.numeric(subsetData$Voltage)

# plot the graphs
png(filename = 'plot4.png', width = 480, height = 480, units = 'px', bg = 'white')
par(mfrow = c(2, 2))

plot(dates, globalActivePower, type = 'l', xlab = '', ylab = 'Global Active Power')

plot(dates, voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(dates, subMeter1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(dates, subMeter2, type = 'l', col = 'red')
lines(dates, subMeter3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1, col = c('black', 'red', 'blue'), bty = 'n')

plot(dates, globalReactivePower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()