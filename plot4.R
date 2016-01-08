# Exploratory Data Analysis - Assignment 1, Week 1 - plot3
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

day1 <- "1/2/2007"
day2 <- "2/2/2007"

hhpc1 <- subset(data, day1 == Date)
hhpc2 <- subset(data, day2 == Date)

hhPowCons <- rbind(hhpc1, hhpc2)

hhPowCons$Time <- strptime(paste(hhPowCons$Date, hhPowCons$Time), "%d/%m/%Y %H:%M:%S")
hhPowCons$Date <- as.Date(hhPowCons$Date, "%d/%m/%Y")


# Apologies for Cairo - I don't have basic PNG support
# and I don't want to reinstall R and RStudio just now.
CairoPNG(filename="plot4.png") # defaults to 480 x 480

par(mfrow=c(2,2))
par(mar=c(3,3,2,2))
plot(hhPowCons$Time, hhPowCons$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(hhPowCons$Time, hhPowCons$Voltage, type = "l", xlab = "datetime", 
     ylab = "Global Active Power")
plot(hhPowCons$Time, hhPowCons$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(hhPowCons$Time, hhPowCons$Sub_metering_2, type="l", col="red")
lines(hhPowCons$Time, hhPowCons$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2, col=c("black", "red", "blue"),
       x.intersp = 0.1, y.intersp = 1, bty="n")
plot(hhPowCons$Time, hhPowCons$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global Active Power")
par(mfrow=c(1,1))        # change plotting display back to normal 
par(mar=c(5, 4, 4, 2))   # set margins back to normal
dev.off()
