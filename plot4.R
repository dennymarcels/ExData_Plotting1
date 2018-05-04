# Load the data, subset and format the table with the desired information

setwd("./Data Science Specialization/Course 04 - Exploratory Data Analysis/Week1/ExData_Plotting1/")
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
Date_complete <- paste(subset$Date, subset$Time)
Date_complete <- strptime(Date_complete, format = "%d/%m/%Y %H:%M:%S")
subset <- cbind(Date_complete, subset)
subset <- subset[,-c(2,3)]

# Open graphic device

png("plot4.png", width = 480, height = 480, units = "px")

# Set global parameters for ploting

par(mfrow = c(2,2))

# Plot 1

with(subset, plot(Date_complete, Global_active_power, ylab = "Global Active Power", xlab = "", type = "n"))
with(subset, lines(Date_complete, Global_active_power))

# Plot 2

with(subset, plot(Date_complete, Voltage, ylab = "Voltage", xlab = "datetime", type = "n"))
with(subset, lines(Date_complete, Voltage))

# Plot 3

with(subset, plot(Date_complete, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(subset, lines(Date_complete, Sub_metering_1, col = "black"))
with(subset, lines(Date_complete, Sub_metering_2, col = "red"))
with(subset, lines(Date_complete, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4

with(subset, plot(Date_complete, Global_reactive_power, xlab = "datetime", type = "n"))
with(subset, lines(Date_complete, Global_reactive_power))

# Disconnect graphic device

dev.off()