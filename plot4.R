fileName<-"household_power_consumption.txt"
colName<-strsplit(readLines(fileName,n=1),";")[[1]]
specificData<-grep("^[1,2]/2/2007",readLines(fileName),value=TRUE)
data<-read.table(text=specificData,sep=";",col.names=colName,na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%y")
data$datetime<-as.POSIXct(paste(data$Date,data$Time))
png("plot4.png")
par(mfrow=c(2,2))
##plot1
plot(data$datetime,data$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l")
##plot2
plot(data$datetime,data$Voltage,xlab="datetime",ylab="Voltage",type="l")
##plot3
plot(data$datetime,data$Sub_metering_1,xlab="",ylab="Global Active Power(kilowatts)",type="l")
lines(data$datetime,data$Sub_metering_2,type="l",col="red")
lines(data$datetime,data$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
##plot4
plot(data$datetime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()