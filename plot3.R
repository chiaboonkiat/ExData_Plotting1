dataElectricPower <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
#get all rows where column values do not have missing values '?'
rowsContainValues <- c(1:length(colnames(dataElectricPower)))!='?'
dataElectricPower <- subset(dataElectricPower,rowsContainValues)

# set $Date column values as values of Date class 
# and get all rows that have 2007-02-01 or 2007-02-02
dataElectricPower$Date<-as.Date(dataElectricPower$Date,"%d/%m/%Y")
dataElectricPower <- subset(dataElectricPower,grepl("2007-02-01|2007-02-02",dataElectricPower$Date))

#create new column datetime
datetime<-paste(dataElectricPower$Date,dataElectricPower$Time)
dataElectricPower<-cbind(datetime,dataElectricPower)

#plot3
png(file="plot3.png",width=480,height=480)
with(dataElectricPower,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",axes=F))
lines(dataElectricPower$datetime,dataElectricPower$Sub_metering_1)
lines(dataElectricPower$datetime,dataElectricPower$Sub_metering_2,col="red")
lines(dataElectricPower$datetime,dataElectricPower$Sub_metering_3,col="blue")
axis(side=2,at=seq(0,30,10))
axis(side=1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
box()
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-",lwd=3)
dev.off()
