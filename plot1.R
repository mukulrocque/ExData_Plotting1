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
# create a new png device
png(filename = "plot1.png", width = 480, height = 480) 
# makes a histogram of the Global_Active_Power column and sets y axis limits appropriately and gives teh right title and x label and colors the plot red.
hist(data$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylim = c(0,1200),col = "Red")
while(dev.cur()!=1){dev.off(which = dev.cur())} ## close all graphics devices