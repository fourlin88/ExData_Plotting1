##### This programs creates the plot to PNG file.
##### For plot4.png
#####

###### Load data
DF <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric",7)),na = "?")
DF2 <- subset(DF, (DF$Date == "1/2/2007") | (DF$Date == "2/2/2007"))
DF2$DateTime <- paste(DF2$Date, DF2$Time)
DF2$DateTime <- strptime(DF2$DateTime, "%d/%m/%Y %H:%M:%S")

##### Open PNG file
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfcol=c(2,2))

###### Plot the first graph
plot(DF2$DateTime, 
     DF2$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")


###### Second plot
plot(DF2$DateTime, 
     DF2$Sub_metering_1, 
     type = "l", 
     col="black",  
     xlab = "", 
     ylab = "Energy sub metering")

lines(DF2$DateTime, DF2$Sub_metering_2, col="red")
lines(DF2$DateTime, DF2$Sub_metering_3, col="blue")
legend("topright",  
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


###### Third One

plot(DF2$DateTime, 
     DF2$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")

###### last plot

plot(DF2$DateTime, 
     DF2$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")

dev.off()
