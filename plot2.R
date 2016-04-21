## plot2 script

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc$dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$dt, format = "%d/%m/%Y %H:%M:%S")

# build and save plots
png(filename = "plot2.png")
with(hpc, plot(x = DateTime, y = as.numeric(as.character(Global_active_power)), 
  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()