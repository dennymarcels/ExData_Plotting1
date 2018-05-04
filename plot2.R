# Load the data, subset and format the table with the desired information

setwd("./Data Science Specialization/Course 04 - Exploratory Data Analysis/Week1/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
Date_complete <- paste(subset$Date, subset$Time)
Date_complete <- strptime(Date_complete, format = "%d/%m/%Y %H:%M:%S")
subset <- cbind(Date_complete, subset)
subset <- subset[,-c(2,3)]

# Open graphic device

png("plot2.png", width = 480, height = 480, units = "px")

# Plot

with(subset, plot(Date_complete, Global_active_power, type = "n", ylab = "Global active power (kilowatts)", xlab = ""))
with(subset, lines(Date_complete, Global_active_power))

# Disconnect graphic device

dev.off()
