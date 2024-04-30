library(dplyr)
library(lubridate)

# read the data into R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#select data by date
hdata <- filter(df, Date=="2/1/2007" | Date=="1/1/2007")
# convert the Date and Time varialbe to Date/Time classes
hdata$datetime <- strptime(paste(hdata$Date, hdata$Time),"%d/%m/%Y %H:%M:%S")
#construct plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1))

#plot the first picture
plot(hdata$datetime, hdata$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts", xlab =" ")
#plot the second picture
hdata$Voltage <- as.numeric(hdata$Voltage)
plot(hdata$datetime, hdata$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
#plot the third picture
plot(mdata$datetime, mdata$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue", ylim =c(0,40) )
par(new=TRUE)
plot(mdata$datetime, mdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col="black", ylim =c(0,40) )
par(new=TRUE)
plot(mdata$datetime, mdata$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col="red", ylim =c(0,40) )

#add legend to the plot
legend("topright",col=c("black","red","blue"),lty= 1,lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

#plot the fourth picture
hdata$Global_reactive_power <- as.numeric(hdata$Global_reactive_power)
plot(hdata$datetime, hdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",type="l")

#construct plot4.png
dev.copy(png, file="plot4.png")
dev.off()