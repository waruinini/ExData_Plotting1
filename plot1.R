library(dplyr)
library(lubridate)

# read the data into R
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#select data by date
hdata <- filter(df, Date=="2/1/2007" | Date=="1/1/2007")
# convert the Date and Time varialbe to Date/Time classes
hdata$datetime <- strptime(paste(hdata$Date, hdata$Time),"%d/%m/%Y %H:%M:%S")
#construct plot 1
hdata$Global_active_power <- as.numeric(hdata$Global_active_power)
hist(hdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
#construct plot1.png
dev.copy(png, file="plot1.png")
dev.off()