library(dplyr)
Data  <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
Data2 <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Time  <- strptime(paste(Data2$Date, Data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create plot
png("plot3.png", width=504, height=504)

plot(x=Time,y=Data2$Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l")
lines(x=Time,y=Data2$Sub_metering_2,col="red")
lines(x=Time,y=Data2$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, col = c("black", "red", "blue"))
axis(side=2, lwd=2)

dev.off()