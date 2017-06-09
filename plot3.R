library(data.table)
library(dplyr)
data <- fread("household_power_consumption.txt")
data <- as.data.frame(data)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data %>% filter(Date=="2007-02-01" | Date=="2007-02-02") %>% 
  mutate(datetime=paste(Date,Time,sep=" "))

plot(x=data$datetime,
     y=data$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering"
)


lines(x=data$datetime,
      y=data$Sub_metering_2,
      type="l",
      col="red")


lines(x=data$datetime,
      y=data$Sub_metering_3,
      type="l",
      col="blue")

legend("topright",
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd=1,
       col=c("black", "red", "blue"))

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()
