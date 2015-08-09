#Read in the provided data from txt file and filter it for 1st and 2nd of February 2007 data

pow_cons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
library(dplyr)
pow_cons_filter <- filter(pow_cons, Date=="1/2/2007")
pow_cons_filter_1 <- filter(pow_cons, Date=="2/2/2007")
req_dates <- rbind(pow_cons_filter, pow_cons_filter_1)


#Create Datetime variable and set it to R date/time format

req_dates_pasted <- within(req_dates, Datetime <- paste(Date, Time, sep=":"))
req_dates_pasted$Datetime <- strptime(req_dates_pasted$Datetime, "%d/%m/%Y:%H:%M:%S")

#Open png device, plot, close the device

png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(req_dates_pasted$Datetime, req_dates_pasted$Global_active_power, type="l", xlab= " ", ylab="Global Active Power")
plot(req_dates_pasted$Datetime, req_dates_pasted$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(req_dates_pasted$Datetime, req_dates_pasted$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l")
par(new=T)
plot(req_dates_pasted$Datetime, req_dates_pasted$Sub_metering_2, xlab=" ", ylab=" ", type="l", col="red", ylim=c(0,max(req_dates_pasted$Sub_metering_1)))
par(new=T)
plot(req_dates_pasted$Datetime, req_dates_pasted$Sub_metering_3, xlab=" ", ylab=" ", type="l", col="blue", ylim=c(0,max(req_dates_pasted$Sub_metering_1)))
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c("_", "_", "_"), col=c("black", "red", "blue"))
plot(req_dates_pasted$Datetime, req_dates_pasted$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()