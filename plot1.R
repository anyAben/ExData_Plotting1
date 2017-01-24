fileName<-"household_power_consumption.txt"
colName<-strsplit(readLines(fileName,n=1),";")[[1]]
specificData<-grep("^[1,2]/2/2007",readLines(fileName),value=TRUE)
data<-read.table(text=specificData,sep=";",col.names=colName,na.strings="?")
png("plot1.png")
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
dev.off()