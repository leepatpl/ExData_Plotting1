# set the working directory
setwd("D://data science specialization//exploratory data analysis//prog assignment 1")

# read in the data for the specified dates
colnames<-read.table( "household_power_consumption.txt", sep=";",nrows=1, stringsAsFactors=FALSE )
subsetDs <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, stringsAsFactors=FALSE)
colnames( subsetDs ) <- colnames[1,1:9]
dateTime <- paste( subsetDs$Date, subsetDs$Time )
dt<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")


png("plot4.png", height=480, width=480)
par( mfrow=c(2,2))

# plot 1
plot( dt, subsetDs$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines( dt, subsetDs$Global_active_power, type="l")

# plot 2
plot( dt, subsetDs$Voltage, type="n", ylab="Voltage", xlab="datetime", yaxt="n")
lines( dt, subsetDs$Voltage, type="l")
axis(2, at=c(234,238,242,246), labels=c("234","238","242","246"))

# plot 3
plot( dt, subsetDs$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines( dt, subsetDs$Sub_metering_1, type="l")
lines( dt, subsetDs$Sub_metering_3, type="l", col="blue")
lines( dt, subsetDs$Sub_metering_2, type="l", col="red")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"),bty="n")

# plot 4
plot( dt, subsetDs$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines( dt, subsetDs$Global_reactive_power, type="l")

dev.off()
 