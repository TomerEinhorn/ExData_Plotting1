##assumption - lubridate is already installed; needed for formatting the date and time columns
library(lubridate)
#reading the data into a data frame
df <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
# merging the date and time columns
df$DateTime <- paste(df$Date, df$Time)
# changing the new DateTime column to a suitable format
df$DateTime <- dmy_hms(df$DateTime)
# changing the Date column format and subsetting the data as needed
df$Date <- as.Date(df$Date, "%d/%m/%Y")
subdf <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
# creating the png file and the plot
png("plot4.png")
# using par function to make a 2 by 2 grid of plots
par(mfrow=c(2,2))
# plotting of all 4 plots
plot(subdf$DateTime, subdf$Global_active_power, 
     type ="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(subdf$DateTime, subdf$Voltage, 
     type ="l", xlab="datetime", ylab="Voltage")
plot(subdf$DateTime, subdf$Sub_metering_1, type ="l", col="black", 
     xlab = "", ylab = "Energy sub metering")
lines(subdf$DateTime, subdf$Sub_metering_2, col="red")
lines(subdf$DateTime, subdf$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1), bty = "n")
plot(subdf$DateTime, subdf$Global_reactive_power, 
     type ="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()