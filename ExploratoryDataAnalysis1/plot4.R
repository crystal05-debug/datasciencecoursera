##Read the Table
epc<-read.table("household_power_consumption.txt",header = TRUE, sep= ";",na.strings = "?")
##Subset the data you want
epc <- subset(epc,Date == "2/2/2007" | Date == "1/2/2007")
##Added Date & Time in another variable
epc$DateTime<-paste(epc$Date, epc$Time)
##Added DateTime to epc
epc$DateTime<-strptime(epc$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", height=480, width=480)

par(mfrow=c(2,2))
plot(epc$DateTime, as.numeric(as.character(epc$Global_active_power)), type='l',ylab="Global Active Power (kilowatts)", xlab="")
plot(epc$DateTime, as.numeric(as.character(epc$Voltage)), type='l',ylab="Voltage", xlab="datetime")
plot(epc$DateTime, epc$Sub_metering_1,type="l",ylab = "Energy sub metering", xlab="")
lines(epc$DateTime, epc$Sub_metering_2,type='l', col='red')
lines(epc$DateTime, epc$Sub_metering_3,type='l', col='blue')
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), bty="n")
plot(epc$DateTime, as.numeric(as.character(epc$Global_reactive_power)), type='l',ylab="Global_reactive_power", xlab="datetime")

dev.off()