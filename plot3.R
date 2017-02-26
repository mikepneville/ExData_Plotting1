## Exploratory Data Analysis
## Week 1: Course Project 1
## Import only the required data: dates 2007-02-01 and 2007-02-02
filename <- "../data/household_power_consumption.txt"
data <- subset(read.csv(file = filename, sep=";", header=T, 
                        stringsAsFactors = F, as.is = T,
                        na.strings = "?"), 
               Date %in% c("1/2/2007","2/2/2007"))
data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Plot3: Energy Sub Metering with legend
png(filename = "plot3.png")
with(data, {
     plot(x=date_time, y=Sub_metering_1, type="l",
          xlab="", ylab="Energy Sub Metering")
     lines(x=date_time, y=Sub_metering_2, type="l", col="red") 
     lines(x=date_time, y=Sub_metering_3, type="l", col="blue")
     legend("topright", lwd=2, lty=1, col=c("black","blue","red"),
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()
