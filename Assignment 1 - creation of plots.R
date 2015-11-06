
# Read the table and transform the dataset to only include dates for 2007-02-01 and 2007-02-02 and create a datatime field
df <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";",na.strings = "?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[(df$Date == "2007-02-01" | df$Date == "2007-02-02"), ]
df <- transform(df, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Create plot 1
hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=500, height=500)
dev.off()

# Create plot 2
plot(df$DateTime,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=500, height=500)
dev.off()

# Create plot 3
plot(df$DateTime,df$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2 ,col = "red")        
lines(df$DateTime,df$Sub_metering_3 ,col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=500, height=500)
dev.off()

# Create plot 4
#define the shape of the plot
par(mfrow = c(2,2))

# add first plot
plot(df$DateTime,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# add second plot
plot(df$DateTime,df$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

# add third plot
plot(df$DateTime,df$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2 ,col = "red")        
lines(df$DateTime,df$Sub_metering_3 ,col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), bty="n", cex=.5)

# add fourth plot
plot(df$DateTime,df$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive power")
dev.copy(png, file="plot4.png", width=500, height=500)
dev.off()

