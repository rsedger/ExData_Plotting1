# Exploratory Data Analysis - Assignment 1, Week 1 - plot2
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

day1 <- "1/2/2007"
day2 <- "2/2/2007"

hhpc1 <- subset(data, Date == day1)
hhpc2 <- subset(data, Date == day2)
hhPowCons <- rbind(hhpc1, hhpc2)

hhPowCons$Time <- strptime(paste(hhPowCons$Date, hhPowCons$Time), "%d/%m/%Y %H:%M:%S")
hhPowCons$Date <- as.Date(hhPowCons$Date, "%d/%m/%Y")

# Apologies for Cairo - I don't have basic PNG support
# and I don't want to reinstall R and RStudio just now.
CairoPNG(filename="plot2.png") # defaults to 480 x 480

plot(hhPowCons$Time, hhPowCons$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

