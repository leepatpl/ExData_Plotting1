# set the working directory
setwd("D://data science specialization//exploratory data analysis//prog assignment 1")

# read in the data for the specified dates
subsetDs <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, stringsAsFactors=FALSE)
colnames<-read.table( "household_power_consumption.txt", sep=";",nrows=1, stringsAsFactors=FALSE )
colnames( subsetDs ) <- colnames[1,1:9]
dateTime <- paste( subsetDs$Date, subsetDs$Time )
dt<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# plot the graphs
png( file="plot3.png", width=480, height=480)
plot( dt, subsetDs$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines( dt, subsetDs$Sub_metering_1, type="l")
lines( dt, subsetDs$Sub_metering_2, type="l", col="red")
lines( dt, subsetDs$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()