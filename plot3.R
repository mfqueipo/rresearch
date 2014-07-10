data<-read.table("C:/Users/Hp/Desktop/household_power_consumption.txt",header=T,sep=";")
data2<-data
data2$Date<-as.Date(data2$Date, format = "%d/%m/%Y")

new_data<-subset( data2, Date>="2007-02-01" & Date<= "2007-02-02")

new_data$Global_active_power<-as.numeric(levels(new_data$Global_active_power)[new_data$Global_active_power])


new_data$Sub_metering_1<-as.numeric(levels(new_data$Sub_metering_1)[new_data$Sub_metering_1])
new_data$Sub_metering_2<-as.numeric(levels(new_data$Sub_metering_2)[new_data$Sub_metering_2])
new_data$Sub_metering_3<-as.numeric(levels(new_data$Sub_metering_3)[new_data$Sub_metering_3])


plot(new_data$Sub_metering_1, type="l",col="black",xaxt = 'n',ylab="Energy sub metering",xlab="")
lines(new_data$Sub_metering_2, type="l",col="red")
lines(new_data$Sub_metering_3, type="l",col="blue")

axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = .05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
