# before I worked on the file to keep only two days
electricity<-read.table("electricity_two_days.txt",header=T,sep=";")
# plot1
with(electricity,hist(Global_active_power,xlab="Global Active Power (kilowatts)",col="red"))
dev.copy(png,file="figure/plot1.png")
dev.off()

# make a new column date_time
date_time <- strptime(paste(electricity$Date, electricity$Time), format="%d/%m/%Y %H:%M:%S")
cbind(date_time,electricity)
# plot 2
with(electricity,plot(date_time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png,file="figure/plot2.png")
dev.off()
#plot 3
with(electricity,plot(date_time,Sub_metering_1,type="l",ylab="Energy Sub metering",xlab=""))
with(electricity,points(date_time,Sub_metering_2,type="l",col="red"))
with(electricity,points(date_time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.75)
dev.copy(png,file="figure/plot3.png")
dev.off()
#plot 4 
par(mfcol=c(2,2))
# sub plot 1  (plot 2 again as subplot)
with(electricity,plot(date_time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
# sub plot 2  (plot 3 again as subplot)
with(electricity,plot(date_time,Sub_metering_1,type="l",ylab="Energy Sub metering",xlab=""))
with(electricity,points(date_time,Sub_metering_2,type="l",col="red"))
with(electricity,points(date_time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.75)
# sub plot 3 
with(electricity,plot(date_time,Voltage,type="l"))
# sub plot 4 
with(electricity,plot(date_time,Global_reactive_power,type="l"))
dev.copy(png,file="figure/plot4.png")
dev.off()



