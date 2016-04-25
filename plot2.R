## Code to plot Global_active_power vs. time


# Load the data
dataPath <- 'data/household_power_consumption.txt'
totalData <- read.table(dataPath, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

# consider only those data that lie between 1/2/2007 and 2/2/2007
subsetData <- totalData[totalData$Date %in% c('1/2/2007', '2/2/2007'), ]

# read the data from Global_active_power column
globalActivePower <- as.numeric(subsetData$Global_active_power)

# read and combine the data from Date and Time columns
dates <- strptime(paste(subsetData$Date, subsetData$Time, sep = ' '), '%d/%m/%Y %H:%M:%S')

# plot the graph on screen
png(filename = 'plot2.png', width = 480, height = 480, units = 'px', bg = 'white')

plot(dates, globalActivePower, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.off()