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
png("plot3.png")
plot(subdf$DateTime, subdf$Sub_metering_1, type ="l", col="black", 
     xlab = "", ylab = "Energy sub metering")
lines(subdf$DateTime, subdf$Sub_metering_2, col="red")
lines(subdf$DateTime, subdf$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()