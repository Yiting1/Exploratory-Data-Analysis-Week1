library(data.table)
library(dplyr)
data <- fread("household_power_consumption.txt")
data <- as.data.frame(data)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data %>% filter(Date=="2007-02-01" | Date=="2007-02-02") %>% 
  mutate(datetime=as.POSIXct(paste(Date,Time,sep=" ")))


par(mfrow = c(2,2))

plot(x = data$datetime,
     y = data$Global_active_power,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Global Active Power"
)

plot(x = data$datetime,
     y = data$Voltage, 
     type = "l", 
     col = "black", 
     xlab = "datetime", 
     ylab = "Voltage"
)


plot(x = data$datetime,
     y = data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "" ,
     ylab = "Energy sub metering"
)


lines(x = data$datetime,
      y = data$Sub_metering_2,
      type = "l",
      col = "red")

lines(x = data$datetime,
      y = data$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright" ,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1, 
       bty = "n",
       col = c("black", "red", "blue"))

plot(x = data$datetime,
     y = data$Global_reactive_power,
     type = "l", 
     col = "black",
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
