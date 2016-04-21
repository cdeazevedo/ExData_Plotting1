## plot4 script

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc$dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")



png(filename = "plot4.png")

#multiplot
par(mfrow = c(2, 2))
with(hpc, {
  plot(x = DateTime, y = as.numeric(as.character(Global_active_power)), 
    type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = DateTime, y = as.numeric(as.character(Voltage)), ylab = "Voltage",
    xlab = "datetime", type = "l")
  plot(x = DateTime, y = as.numeric(as.character(Sub_metering_1)), 
  type = "n", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, as.numeric(as.character(Sub_metering_1)), 
      col = "black")
     lines(DateTime, as.numeric(as.character(Sub_metering_2)), 
      col = "red")
     lines(DateTime, as.numeric(as.character(Sub_metering_3)), 
      col = "blue")
     legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1",
        "Sub_metering_2", "Sub_metering_3"), lwd = 1)
   plot(x = DateTime, y = as.numeric(as.character(Global_reactive_power)), 
     type = "l")    
})

dev.off()