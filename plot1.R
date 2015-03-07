# set the working directory
setwd("D://data science specialization//exploratory data analysis//prog assignment 1")

# to read in the first column, the dates, and find the indices of the selected rows
colclasses<-rep("NULL", 9)
colclasses[1]<-"character"
dates<-read.table( "household_power_consumption.txt", header=TRUE, sep=";", colClasses=colclasses)
datesVec <- dates$Date
datesSubset<- datesVec=="1/2/2007" | datesVec=="2/2/2007"
datesInd <- 1: (length(datesVec))
datesSubsetInd <- datesInd[ datesSubset ]

# read in only the selected rows
subsetDs <- read.table( "household_power_consumption.txt", header=TRUE, sep=";", skip=(datesSubsetInd[1]-1), nrows=length(datesSubsetInd))

# get the column names
colnames<-read.table( "household_power_consumption.txt", sep=";",nrows=1, stringsAsFactors=FALSE )
colnames( subsetDs ) <- colnames[1,1:9]

# plot the histogram
png( file="plot1.png", width=480, height=480)
hist( subsetDs$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red" )
dev.off()