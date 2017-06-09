library(data.table)
library(dplyr)
data <- fread("household_power_consumption.txt")
data <- as.data.frame(data)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data %>% filter(Date=="2007-02-01" | Date=="2007-02-02") %>% 
        mutate(datetime=paste(Date,Time,sep=" "))


plot(as.POSIXct(data$datetime), as.numeric(data$Global_active_power), 
     ylab="Global Active Power (kilowatts)", xlab="", type = "l")
axis.Date(side = 1, at=c("Thu","Fri","Sat"),labels=T)
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off ()
