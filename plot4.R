dataA1 <- read.table("D:/Users/Katja/Documents/RCourse/household_power_consumption.txt", header=TRUE, sep=";", str na.strings="")
sub <- dataA1[dataA1$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub$Global_active_power)
globalReactivePower <- as.numeric(sub$Global_reactive_power)
voltage <- as.numeric(sub$Voltage)

time <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(sub$Sub_metering_1)
subMetering2 <- as.numeric(sub$Sub_metering_2)
subMetering3 <- as.numeric(sub$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time, voltage, type="l", xlab="time", ylab="Voltage")
plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(time, globalReactivePower, type="l", xlab="time", ylab="Global_reactive_power")
dev.off()
