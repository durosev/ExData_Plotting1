#Read in the provided data from txt file and filter it for 1st and 2nd of February 2007 data

pow_cons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
library(dplyr)
pow_cons_filter <- filter(pow_cons, Date=="1/2/2007")
pow_cons_filter_1 <- filter(pow_cons, Date=="2/2/2007")
req_dates <- rbind(pow_cons_filter, pow_cons_filter_1)


#Create Datetime variable and set it to R date/time format

req_dates_pasted <- within(req_dates, Datetime <- paste(Date, Time, sep=":"))
req_dates_pasted$Datetime <- strptime(req_dates_pasted$Datetime, "%d/%m/%Y:%H:%M:%S")


#Open png device, plot, close png device
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(req_dates_pasted$Datetime, req_dates_pasted$Global_active_power, type="l", xlab= " ", ylab="Global Active Power (kilowatts)")
dev.off()