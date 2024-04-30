library(dplyr)
library(lubridate)

# read the data into R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#select data by date
hdata <- filter(df, Date=="2/2/2007" | Date=="1/2/2007")
# convert the Date and Time varialbe to Date/Time classes
hdata$datetime <- strptime(paste(hdata$Date, hdata$Time),"%d/%m/%Y %H:%M:%S")
#construct plot 2
hdata$Global_active_power <- as.numeric(hdata$Global_active_power)
plot(hdata$datetime, hdata$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts", xlab =" ")

#construct plot2.png
dev.copy(png, file="plot2.png")
dev.off()