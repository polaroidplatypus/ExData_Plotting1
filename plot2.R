plot2 <- function(){
  dt <- read.table('./household_power_consumption.txt'
                   ,stringsAsFactors=FALSE,header=TRUE,sep=';')
  dt$Date <- as.Date(dt$Date,format='%d/%m/%Y')
  dt$Time <- format(dt$Time,format='%H:%M:%S')
  dt$DateTime <- as.POSIXct(paste(dt$Date,dt$Time))
  dt$Global_active_power <- as.numeric(dt$Global_active_power)
  dt<-dt[dt$Date=='2007-02-01'|dt$Date=='2007-02-02',]
  png('plot2.png',height=480,width=480)
  with(dt, plot(DateTime, Global_active_power,type='l'
                ,xlab='',ylab='Global Active Power (kilowatts)'))
  dev.off()
}