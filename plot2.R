data<-read.table("C:/Users/Hp/Desktop/household_power_consumption.txt",header=T,sep=";")
data2<-data
data2$Date<-as.Date(data2$Date, format = "%d/%m/%Y")

new_data<-subset( data2, Date>="2007-02-01" & Date<= "2007-02-02")

new_data$Global_active_power<-as.numeric(levels(new_data$Global_active_power)[new_data$Global_active_power])

plot2<-plot(new_data$Global_active_power, type="l",xaxt = 'n',ylab="Global Active Power (kilowatts)",xlab="")
axis(1, at=c(1,nrow(new_data)/2,nrow(new_data)),labels=c("Thu","Fri","Sat"))

