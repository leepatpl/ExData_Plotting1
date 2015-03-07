# set the working directory
setwd("D://data science specialization//exploratory data analysis//prog assignment 1")

# read in the selected data; skip lines and number of rows to read are found from plot1.R
subsetDs <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, stringsAsFactors=FALSE)
colnames<-read.table( "household_power_consumption.txt", sep=";",nrows=1, stringsAsFactors=FALSE )
colnames( subsetDs ) <- colnames[1,1:9] 

# concatenate the dates and times
dateTime <- paste( subsetDs$Date, subsetDs$Time )
dt<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# plot the line graph for Global_active_power over time
png( file="plot2.png", width=480, height=480)
plot( dt, subsetDs$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines( dt, subsetDs$Global_active_power, type="l")
dev.off()