library(dplyr)
# load data and subset days
Data  <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
Data2 <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]
Time  <- strptime(paste(Data2$Date, Data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create plot
png("plot2.png", width=504, height=504)

plot(x=Time,y=Data2$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
axis(side=2, lwd=2)

dev.off()