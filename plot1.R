## plot1 script

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")


png(filename = "plot1.png")
with(hpc, hist(as.numeric(as.character(Global_active_power)), col = "red", 
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency", main = "Global Active Power"))
dev.off()
