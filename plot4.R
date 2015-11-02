# read file
input_filepath = 'input\\household_power_consumption.txt'
# 01/02/2007 is row#66637 and 02/02/2007 ends after 2880 rows
data <- read.table(input_filepath, header=TRUE, sep =';', nrows=2880, skip = 66636, na.strings="?")
# read one row to get the header
data_header <- read.table(input_filepath, header=TRUE, sep =';', nrows=1)
# Assign header information to data (which did not have header because of skip)
names(data) <- names(data_header)
# remove unused variables to free up memory
rm(data_header)

# plot1.png is a histogram of Global Active Power
# create a new png device of 480x480 to directly write the plot
png(filename = "plot4.png", width = 480, height = 480) 
par(mfcol=c(2,2)) # makes a matrix of plots filled column by column
# 1st plot
plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Global_active_power,type="l",xlab="", ylab="Global Active Power")
# 2nd plot (same column)
plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering",col="Black") # plot 1st against time
lines(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Sub_metering_2,col="Red") # add 2nd against time
lines(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Sub_metering_3,col="Blue") # add 3rd against time
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),bty="n",cex=0.9,col=c("Black","Red","Blue")) # add legend to top-right corner and give correct labels, symbols and colors
# 3rd plot
plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Voltage,type="l",xlab="datetime", ylab="Voltage",col="Black") # plot 1st against time
# 4th plot
plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"),data$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power",col="Black") # plot 1st against time
while(dev.cur()!=1){dev.off(which = dev.cur())} ## close all graphics devices
