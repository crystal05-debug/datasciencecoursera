##Read the Table
epc<-read.table("household_power_consumption.txt",header = TRUE, sep= ";",na.strings = "?")
##Subset the data you want
epc <- subset(epc,Date == "2/2/2007" | Date == "1/2/2007")
##Added Date & Time in another variable
epc$DateTime<-paste(epc$Date, epc$Time)
##Added DateTime to epc
epc$DateTime<-strptime(epc$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot1.png", height=480, width=480)

hist(epc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red", ylim = c(0,1200) )

dev.off()
