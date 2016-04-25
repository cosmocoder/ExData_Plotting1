## Code to plot sub-meter readings vs. time


# Load the data
dataPath <- 'data/household_power_consumption.txt'
totalData <- read.table(dataPath, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

# consider only those data that lie between 1/2/2007 and 2/2/2007
subsetData <- totalData[totalData$Date %in% c('1/2/2007', '2/2/2007'), ]

# read and combine the data from Date and Time columns
dates <- strptime(paste(subsetData$Date, subsetData$Time, sep = ' '), '%d/%m/%Y %H:%M:%S')

# store the sub-meter readings
subMeter1 <- as.numeric(subsetData$Sub_metering_1)
subMeter2 <- as.numeric(subsetData$Sub_metering_2)
subMeter3 <- as.numeric(subsetData$Sub_metering_3)

# plot the graph
png(filename = 'plot3.png', width = 480, height = 480, units = 'px', bg = 'white')

plot(dates, subMeter1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(dates, subMeter2, type = 'l', col = 'red')
lines(dates, subMeter3, type = 'l', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 2, col = c('black', 'red', 'blue'), xjust = 0, yjust = 0)

dev.off()