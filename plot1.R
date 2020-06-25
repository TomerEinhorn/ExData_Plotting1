
#reading the data into a data frame
df <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
# changing the date format from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# subsetting the relevant data according to the dates
subdf <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")
# creating the png file and plotting
png("plot1.png")
hist(subdf$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
