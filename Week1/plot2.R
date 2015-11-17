

g <- "C:/Users/seanco/Desktop/R/Exploratory Data Analysis/Week 1"

setwd(g)

filename <- paste(g,"/household_power_consumption.txt",sep="")
#print(file)
d <- read.table(filename,sep = ";",header = TRUE,na.strings = "?",nrows = 100000)
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d <- d[d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"),]

datetime <- with(d,paste(Date,Time,sep=" "))
d$Time  <- strptime(datetime,"%Y-%m-%d %H:%M:%S")

png("plot2.png")
plot(d$Time,d$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()