## Exploratory Data Analysis
## Week 1: Course Project 1
## Import only the required data: dates 2007-02-01 and 2007-02-02
filename <- "../data/household_power_consumption.txt"
data <- subset(read.csv(file = filename, sep=";", header=T, 
                        stringsAsFactors = F, as.is = T,
                        na.strings = "?"), 
               Date %in% c("1/2/2007","2/2/2007"))
data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Plot1: Histogram of Global Active Power
png(filename = "plot1.png")
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
