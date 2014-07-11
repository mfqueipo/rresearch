data<-read.table("C:/Users/Hp/Desktop/household_power_consumption.txt",header=T,sep=";")
data2<-data
data2$Date<-as.Date(data2$Date, format = "%d/%m/%Y")

new_data<-subset( data2, Date>="2007-02-01" & Date<= "2007-02-02")

new_data$Global_active_power<-as.numeric(levels(new_data$Global_active_power)[new_data$Global_active_power])
new_data$Sub_metering_1<-as.numeric(levels(new_data$Sub_metering_1)[new_data$Sub_metering_1])
new_data$Sub_metering_2<-as.numeric(levels(new_data$Sub_metering_2)[new_data$Sub_metering_2])
new_data$Sub_metering_3<-as.numeric(levels(new_data$Sub_metering_3)[new_data$Sub_metering_3])
new_data$Voltage<-as.numeric(levels(new_data$Voltage)[new_data$Voltage])
new_data$Global_reactive_power<-as.numeric(levels(new_data$Global_reactive_power)[new_data$Global_reactive_power])

par(mfrow=c(2,2))
#1
plot(new_data$Global_active_power, type="l",xaxt = 'n',ylab="Global Active Power (kilowatts)",xlab="")
axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))
#3
plot(new_data$Voltage,type="l",xlab="datetime",ylab="Voltage",xaxt="n")
axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))
#2
plot(new_data$Sub_metering_1, type="l",col="black",xaxt = 'n',ylab="Energy sub metering",xlab="")
lines(new_data$Sub_metering_2, type="l",col="red")
lines(new_data$Sub_metering_3, type="l",col="blue")
axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black", "red", "blue"), bty="n",lty= "solid", inset = 0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(new_data$Global_reactive_power,type="l",xlab="datetime",xaxt='n',ylab="Global_reactive_power")
axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))



