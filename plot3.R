plot3 <- function(){
  dt <- read.table('./household_power_consumption.txt'
                   ,stringsAsFactors=FALSE,header=TRUE,sep=';')
  dt$Date <- as.Date(dt$Date,format='%d/%m/%Y')
  dt$Time <- format(dt$Time,format='%H:%M:%S')
  dt$DateTime <- as.POSIXct(paste(dt$Date,dt$Time))
  dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
  dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
  dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
  dt<-dt[dt$Date=='2007-02-01'|dt$Date=='2007-02-02',]
  png('plot3.png',height=480,width=480)
  with(dt, plot(DateTime,Sub_metering_1,type='l'
                ,col='black',ylab='Energy sub metering',xlab=''))
  lines(dt$DateTime,dt$Sub_metering_2,col='red')
  lines(dt$DateTime,dt$Sub_metering_3,col='blue')
  legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
         ,col=c('black','red','blue'),lty=1)
  dev.off()
}