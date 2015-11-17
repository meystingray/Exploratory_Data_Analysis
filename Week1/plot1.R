

 g <- "C:/Users/seanco/Desktop/R/Exploratory Data Analysis/Week 1"

setwd(g)

filename <- paste(g,"/household_power_consumption.txt",sep="")
#print(file)
d <- read.table(filename,sep = ";",header = TRUE,na.strings = "?",nrows = 100000)

d$Time  <- strptime(d$Time,"%H:%M:%S")
d$Date <- as.Date(d$Date,"%d/%m/%Y")

use <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]

png("plot1.png")
hist(use$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()