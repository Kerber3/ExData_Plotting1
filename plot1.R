dataA1 <- read.table("~/household_power_consumption.txt", header=TRUE, sep=";",str na.strings="")
sub <- dataA1[dataA1$Date %in% c("1/2/2007","2/2/2007") ,]

### change factor to numeric
globalactivepower <- as.numeric(sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
