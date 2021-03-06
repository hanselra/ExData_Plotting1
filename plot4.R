setwd("/Users/RHansel/Documents/AAAS_2013_2014/R_Stats/courserastuff/ExploratoryDataAnalysis/Project1/")
rm(list=ls())

#read file
epc<-read.table("household_power_consumption.txt", header=TRUE, nrows= 2075259, sep=";", stringsAsFactors=FALSE)

#only get 2 days of information
twodays<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#Can use this to write/read data to file (to speed things up)
#write.csv(twodays, "twodays.csv")
#twodays<-read.csv("twodays.csv", sep=",")

#numeric conversion
twodays$Global_active_power<- as.numeric(twodays$Global_active_power)
twodays$Sub_metering_1<-as.numeric(twodays$Sub_metering_1)
twodays$Sub_metering_2<-as.numeric(twodays$Sub_metering_2)
twodays$Sub_metering_3<-as.numeric(twodays$Sub_metering_3)
twodays$Voltage<-as.numeric(twodays$Voltage)
twodays$Global_reactive_power<-as.numeric(twodays$Global_reactive_power)

#combine date and time
timestamp<-paste(twodays$Date, twodays$Time)
timestamp<-strptime(timestamp, "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1
plot(timestamp, twodays$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(timestamp, twodays$Global_active_power, xlab="")

#plot2
plot(timestamp, twodays$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(timestamp, twodays$Voltage, xlab="datetime", ylab="Voltage")

#plot3
plot(timestamp, twodays$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(timestamp, twodays$Sub_metering_1, xlab="", col="black")
lines(timestamp, twodays$Sub_metering_2, xlab="", col="red")
lines(timestamp, twodays$Sub_metering_3, xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

#plot4
plot(timestamp, twodays$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(timestamp, twodays$Global_reactive_power, xlab="datetime")

dev.off()