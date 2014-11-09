dataElectricPower <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
#get all rows where column values do not have missing values '?'
rowsContainValues <- c(1:length(colnames(dataElectricPower)))!='?'
dataElectricPower <- subset(dataElectricPower,rowsContainValues)

# set $Date column values as values of Date class 
# and get all rows that have 2007-02-01 or 2007-02-02
dataElectricPower$Date<-as.Date(dataElectricPower$Date,"%d/%m/%Y")
dataElectricPower <- subset(dataElectricPower,grepl("2007-02-01|2007-02-02",dataElectricPower$Date))

#plot1
png(file="plot1.png",width=480,height=480)
hist(as.numeric(dataElectricPower$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()