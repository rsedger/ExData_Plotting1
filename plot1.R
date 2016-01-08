# Exploratory Data Analysis - Assignment 1, Week 1 - plot1

data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

day1 <- "1/2/2007"
day2 <- "2/2/2007"

hhpc1 <- subset(data, as.Date(day1) == as.Date(Date))
hhpc2 <- subset(data, as.Date(day2) == as.Date(Date))

householdPowerConsump <- rbind(hhpc1, hhpc2)

# Apologies for Cairo - I don't have basic PNG support
# and I don't want to reinstall R and RStudio
CairoPNG(filename="plot1a.png") # defaults to 480 x 480

hist(householdPowerConsump$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main= "Global Active Power")

dev.off()

