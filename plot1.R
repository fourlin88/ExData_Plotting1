
##### This programs creates the plot to PNG file.
##### For plot1,png
#####

###### Load data
DF <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric",7)),na = "?")
DF2 <- subset(DF, (DF$Date == "1/2/2007") | (DF$Date == "2/2/2007"))
DF2$DateTime <- paste(DF2$Date, DF2$Time)
DF2$DateTime <- strptime(DF2$DateTime, "%d/%m/%Y %H:%M:%S")

##### Open PNG file
png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
###### Plot the graph
hist((DF2$Global_active_power), xlab = "Global Active Power (in kilowatt)", main="Global Active Power", col="red")

dev.off()