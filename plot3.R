## plot3 script

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc$dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
with(hpc, plot(x = DateTime, y = as.numeric(as.character(Sub_metering_1)), 
  type = "n", xlab = "", ylab = "Energy sub metering"))
with(hpc, lines(DateTime, as.numeric(as.character(Sub_metering_1)), 
  col = "black"))
with(hpc, lines(DateTime, as.numeric(as.character(Sub_metering_2)), 
  col = "red"))
with(hpc, lines(DateTime, as.numeric(as.character(Sub_metering_3)), 
  col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1",
  "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()