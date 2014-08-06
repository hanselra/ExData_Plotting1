setwd("/Users/RHansel/Documents/AAAS_2013_2014/R_Stats/courserastuff/ExploratoryDataAnalysis/Project1/")

rm(list=ls())

library(ca)
library(FactoMineR)
library(missMDA)
library(plyr)
library(dplyr)
library(rattle)
library(caret)
library(lattice) 
library(stats) 
library(ggplot2)
library(car)
library(reshape2)
library(foreach) 
library(methods)
library(BradleyTerry2)
library(sm)

#read file
epc<-read.table("household_power_consumption.txt", header=TRUE, nrows= 2075259, sep=";")

#get only two days of information
twodays<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#Can use to write and read twodays to file (to speed things up)
#write.csv(twodays, "twodays.csv")
#twodays<-read.csv("twodays.csv", sep=",")

#combine date and time
timestamp<-paste(twodays$Date, twodays$Time)
timestamp<-strptime(timestamp, "%d/%m/%Y %H:%M:%S")

#plot
png(file="plot2.png", width=480, height=480)
plot(timestamp, twodays$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(timestamp, twodays$Global_active_power, xlab="")
dev.off()