library(dplyr)
# load data and subset days
Data <- read.table(file="household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
Data2<-Data[Data$Date %in% c("1/2/2007","2/2/2007"),]

#create plot
png("plot1.png", width=504, height=504)

hist(Data2$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

dev.off()