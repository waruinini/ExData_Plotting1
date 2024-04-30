library(dplyr)
library(lubridate)

# read the data into R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#select data by date
hdata <- filter(df, Date=="2/2/2007" | Date=="1/2/2007")
# convert the Date and Time varialbe to Date/Time classes
hdata$datetime <- strptime(paste(hdata$Date, hdata$Time),"%d/%m/%Y %H:%M:%S")
#construct plot 3
hdata$Sub_metering_1 <- as.numeric(hdata$Sub_metering_1)
hdata$Sub_metering_2 <- as.numeric(hdata$Sub_metering_2)
hdata$Sub_metering_3 <- as.numeric(hdata$Sub_metering_3)

mdata <- hdata[c(7,8,9,10)]

plot(mdata$datetime, mdata$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue", ylim =c(0,40) )
par(new=TRUE)
plot(mdata$datetime, mdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col="black", ylim =c(0,40) )
par(new=TRUE)
plot(mdata$datetime, mdata$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab = "", col="red", ylim =c(0,40) )

#add legend to the plot
legend("topright",col=c("black","red","blue"),lty= 1,lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#construct plot3.png
dev.copy(png, file="plot3.png")
dev.off()