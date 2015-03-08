## Plot 4- prints 4 different plots onto a single page
power<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors = FALSE) # Reads the data from txt file
power$datetime<-(strptime((paste(power$Date, power$Time)),"%d/%m/%Y %H:%M:%S")) ## Concatenates Date and time variables into single
power$Date<-strptime(power$Date, "%d/%m/%Y") ## Conversion of Date to POSIXt object
power$Time<-strptime(power$Time, "%H:%M:%S") ## Conversion of Time to POSIXt object
data<-subset(power, (power$Date== "2007-02-01" | power$Date== "2007-02-02" ) ) ## Selecting the data for plotting
attach(data) ## Attach the data so that it's read directly from memory rather than subsetting each time a new plot is called in
par(mfrow=c(2,2)) ## decalring the layout of the graphs
#1st plot
plot(datetime, Global_active_power, type="s", ylab="Global Active Power ", xlab="") 
# 2nd plot
plot(datetime, Voltage, type="s", ylab="Voltage")
# 3rd plot
plot(datetime, Sub_metering_1, type="s",  ylab="Energy sub metering", xlab="")
points(datetime, Sub_metering_2, type="s", col="red" ) 
points(datetime, Sub_metering_3, type="s", col="blue")
(legend("topright", lty=c(1,1, 1), col = c("black","red", "blue"),bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ) )
#4th plot
plot(x=datetime, Global_reactive_power, type="s")
dev.copy(png, file = "plot4.png",  width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
dev.off()

