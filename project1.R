# before I worked on the file to keep only two days
electricity<-read.table("electricity_two_days.txt",header=T,sep=";")
# plot1
with(electricity,hist(Global_active_power,xlab="Global Active Power (kilowatts)",col="red"))
# make a new column date_time
date_time <- strptime(paste(electricity$Date, electricity$Time), format="%d/%m/%Y %H:%M:%S")
cbind(date_time,electricity)
# plot 2
with(electricity,plot(date_time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
#plot 3
with(electricity,plot(date_time,Sub_metering_1,type="l",ylab="Energy Sub metering",xlab=""))
with(electricity,points(date_time,Sub_metering_2,type="l",col="red"))
with(electricity,points(date_time,Sub_metering_3,type="l",col="blue"))
#legend TO DO

