## Exploratory Data Analysis
## Week 1: Course Project 1
## Import only the required data: dates 2007-02-01 and 2007-02-02
filename <- "../data/household_power_consumption.txt"
data <- subset(read.csv(file = filename, sep=";", header=T, 
                        stringsAsFactors = F, as.is = T,
                        na.strings = "?"), 
               Date %in% c("1/2/2007","2/2/2007"))
data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Plot4: Plot 4 charts in a 2x2 array including 
## left to right, top to bottom
## Global Active Power time series
## Voltage time series w/ x-axis label "date/time"
## Energy sub metering time series w/legend
## Global Reactive Power time series w/ x-axis label "date/time"
## 
png(filename = "plot4.png")
par(mfrow=c(2,2))
with(data, plot(x=date_time, y=Global_active_power,type="l",
                xlab="", ylab="Global Active Power (kilowatts)"))
with(data, plot(x=date_time, y=Voltage,type="l",
                xlab="date/time", ylab="Voltage"))
with(data, {
     plot(x=date_time, y=Sub_metering_1, type="l",
          xlab="", ylab="Energy Sub Metering")
     lines(x=date_time, y=Sub_metering_2, type="l", col="red") 
     lines(x=date_time, y=Sub_metering_3, type="l", col="blue")
     legend("topright", lwd=2, lty=1, col=c("black","blue","red"),
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
with(data, plot(x=date_time, y=Global_reactive_power,type="l",
                xlab="date/time"))
dev.off()
