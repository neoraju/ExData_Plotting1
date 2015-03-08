## Plot 1
power<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors = FALSE) # Reads the data from txt file
power$datetime<-(strptime((paste(power$Date, power$Time)),"%d/%m/%Y %H:%M:%S")) ## Concatenates Date and time variables into single
power$Date<-strptime(power$Date, "%d/%m/%Y") ## Conversion of Date to POSIXt object
power$Time<-strptime(power$Time, "%H:%M:%S") ## Conversion of Time to POSIXt object
data<-subset(power, (power$Date== "2007-02-01" | power$Date== "2007-02-02" ) ) ## Selecting the data for plotting
attach(data)
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()