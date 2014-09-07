setwd("/Users/RHansel/Documents/AAAS_2013_2014/R_Stats/courserastuff/ExploratoryDataAnalysis/Project1/")

rm(list=ls())

#read file
epc<-read.table("household_power_consumption.txt", header=TRUE, nrows= 2075259, sep=";", stringsAsFactors=FALSE)

#get 2 days of info
twodays<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#Can use this to write/read data to file (to speed things up)
#write.csv(twodays, "twodays.csv")
#twodays<-read.csv("twodays.csv", sep=",")

#numeric conversion
twodays$Sub_metering_1<-as.numeric(twodays$Sub_metering_1)
twodays$Sub_metering_2<-as.numeric(twodays$Sub_metering_2)
twodays$Sub_metering_3<-as.numeric(twodays$Sub_metering_3)

#combine date and time
timestamp<-paste(twodays$Date, twodays$Time)
timestamp<-strptime(timestamp, "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480)
plot(timestamp, twodays$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(timestamp, twodays$Sub_metering_1, xlab="", col="black")
lines(timestamp, twodays$Sub_metering_2, xlab="", col="red")
lines(timestamp, twodays$Sub_metering_3, xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()