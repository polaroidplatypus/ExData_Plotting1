plot4 <- function(){
  dt <- read.table('./household_power_consumption.txt'
                   ,stringsAsFactors=FALSE,header=TRUE,sep=';')
  dt$Date <- as.Date(dt$Date,format='%d/%m/%Y')
  dt$Time <- format(dt$Time,format='%H:%M:%S')
  dt$DateTime <- as.POSIXct(paste(dt$Date,dt$Time))
  dt$Global_active_power <- as.numeric(dt$Global_active_power)
  dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
  dt$Voltage <- as.numeric(dt$Voltage)
  dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
  dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
  dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
  dt<-dt[dt$Date=='2007-02-01'|dt$Date=='2007-02-02',]
  png('plot4.png',height=480,width=480)
  par(mfrow=c(2,2))
  with(dt, plot(DateTime, Global_active_power,type='l'
                ,xlab='',ylab='Global Active Power (kilowatts)'))
  with(dt, plot(DateTime, Voltage,type='l'
                ,xlab='datetime',ylab='Voltage'))
  with(dt, plot(DateTime,Sub_metering_1,type='l'
                ,col='black',ylab='Energy sub metering',xlab=''))
  lines(dt$DateTime,dt$Sub_metering_2,col='red')
  lines(dt$DateTime,dt$Sub_metering_3,col='blue')
  legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
         ,col=c('black','red','blue'),lty=1,bty='n')
  with(dt, plot(DateTime, Global_reactive_power,type='l'
                ,xlab='datetime',ylab='Global_reactive_power'))
  dev.off()
}