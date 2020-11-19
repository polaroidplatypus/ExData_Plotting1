plot1 <- function(){
  dt <- read.table('./household_power_consumption.txt'
                   , stringsAsFactors=FALSE, header=TRUE,sep=';')
  dt$Date <- as.Date(dt$Date,format='%d/%m/%Y')
  dt$Global_active_power <- as.numeric(dt$Global_active_power)
  dt<-dt[dt$Date=='2007-02-01'|dt$Date=='2007-02-02',]
  png('plot1.png',height=480,width=480)
  hist(dt$Global_active_power,col='red',
       xlab='Global Active Power (kilowatts)',main='Global Active Power')
  dev.off()
}