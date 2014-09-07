setwd("/Users/RHansel/Documents/AAAS_2013_2014/R_Stats/courserastuff/ExploratoryDataAnalysis/Project1/")

rm(list=ls())


#read file
epc<-read.table("household_power_consumption.txt", header=TRUE, nrows= 2075259, sep=";", stringsAsFactors=FALSE)

#get only 2 days of info
twodays<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#Can use to write/read info to file (to speed things up)
#write.csv(twodays, "twodays.csv")
#twodays<-read.csv("twodays.csv", sep=",")

#convert active power to numeric
twodays$Global_active_power<- as.numeric(twodays$Global_active_power)

#plot
png(file="plot1.png", width=480, height=480)
hist(twodays$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=c(0,1200))
dev.off()