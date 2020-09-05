library(dplyr)
Data  <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
Data2 <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Time  <- strptime(paste(Data2$Date, Data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create plot
png("plot4.png", width=504, height=504)

par(mfrow=c(2,2))

plot(x=Time,y=Data2$Global_active_power,ylab="Global Active Power",xlab="",type="l")

plot(x=Time, y=Data2$Voltage,ylab="Voltage",xlab="datetime",type="l")

plot(x=Time,y=Data2$Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l",bty="n")
lines(x=Time,y=Data2$Sub_metering_2,col="red")
lines(x=Time,y=Data2$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, col = c("black", "red", "blue"), box.lty = 0)
box(lwd=1)

plot(x=Time,y=Data2$Global_reactive_power,ylab="Global_reactiver_power",xlab="datetime",type="l")

dev.off()