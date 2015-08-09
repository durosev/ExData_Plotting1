#Read in the provided data from txt file and filter it for 1st and 2nd of February 2007 data

pow_cons <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
library(dplyr)
pow_cons_filter <- filter(pow_cons, Date=="1/2/2007")
pow_cons_filter_1 <- filter(pow_cons, Date=="2/2/2007")
req_dates <- rbind(pow_cons_filter, pow_cons_filter_1)


#Open png device, plot, close png device

png(filename="plot1.png", width = 480, height = 480, units = "px")
par(mar=c(4,4,2,2))
hist(req_dates$Global_active_power, xlab="Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()
