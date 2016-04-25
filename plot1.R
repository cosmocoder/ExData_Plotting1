## Code to plot histogram of Global_active_power


# Load the data
dataPath <- 'data/household_power_consumption.txt'
totalData <- read.table(dataPath, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)

# consider only those data that lie between 1/2/2007 and 2/2/2007
subsetData <- totalData[totalData$Date %in% c('1/2/2007', '2/2/2007'), ]

# read the data from Global_active_power column
globalActivePower <- as.numeric(subsetData$Global_active_power)

# plot a histogram on screen
hist(globalActivePower, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

# copy that histogram into 'png' device
dev.copy(png, file = 'plot1.png', width = 480, height = 480, units = 'px', bg = 'white')
dev.off()