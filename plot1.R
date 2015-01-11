
power.data <- read.csv("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE)

power.data$Date <- as.Date(power.data$Date, format="%d/%m/%Y" )

power.feb <- subset(power.data, Date=="2007-02-01" | Date=="2007-02-02")

power.feb$DateTime <- as.POSIXct(strptime(paste(as.character(power.feb$Date),as.character(power.feb$Time)), "%Y-%m-%d %H:%M:%S"))
power.feb$Global_active_power <- as.numeric(power.feb$Global_active_power)
power.feb$Sub_metering_1 <- as.numeric(power.feb$Sub_metering_1)
power.feb$Sub_metering_2 <- as.numeric(power.feb$Sub_metering_2)
power.feb$Sub_metering_3 <- as.numeric(power.feb$Sub_metering_3)
power.feb$Voltage <- as.numeric(power.feb$Voltage)

par(mfrow = c(1, 1))
hist (power.feb$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
