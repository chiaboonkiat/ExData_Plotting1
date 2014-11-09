
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

#plot2
png(file="plot2.png",width=480,height=480)
with(dataElectricPower,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",axes=F))
axis(side=1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
axis(side=2,at=seq(0,6,2))
box()
dev.off()