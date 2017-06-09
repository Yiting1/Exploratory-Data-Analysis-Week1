
library(data.table)
library(dplyr)
data <- fread("household_power_consumption.txt")
data <- as.data.frame(data)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data %>% filter(Date=="2007-02-01" | Date=="2007-02-02")

hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global active power (kilowatts)",
     main="Global Active Power")
dev.copy(png, filename="plot1.png")
dev.off()
