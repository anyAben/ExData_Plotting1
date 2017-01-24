fileName<-"household_power_consumption.txt"
colName<-strsplit(readLines(fileName,n=1),";")[[1]]
specificData<-grep("^[1,2]/2/2007",readLines(fileName),value=TRUE)
data<-read.table(text=specificData,sep=";",col.names=colName,na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$datetime<-as.POSIXct(paste(data$Date,data$Time))
png("plot2.png")
plot(data$datetime,data$Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l")
dev.off()