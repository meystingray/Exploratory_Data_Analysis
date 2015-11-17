

g <- "C:/Users/seanco/Desktop/R/Exploratory Data Analysis/Week 1"

setwd(g)

filename <- paste(g,"/household_power_consumption.txt",sep="")
#print(file)
d <- read.table(filename,sep = ";",header = TRUE,na.strings = "?",nrows = 100000)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]

datetime <- with(d,paste(Date,Time,sep=" "))
d$Time  <- strptime(datetime,"%Y-%m-%d %H:%M:%S")


png("plot3.png")

plot(d$Time,d$Sub_metering_1,col="black",type="l",ylab="Energy sub  metering",xlab="")
lines(d$Time,d$Sub_metering_2,col="red",type="l")
lines(d$Time,d$Sub_metering_3,col="blue",type="l")

legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2),col=c("black","red", "blue"))

dev.off()