dataA1 <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";", str na.strings="")
sub <- dataA1[dataA1$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub$Global_active_power)
time <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

