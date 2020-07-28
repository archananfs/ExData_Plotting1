## coursera Project - Exploratory data Analysis
## Power consumption Data
## plot4

# load and read the file
filePath = "R_projects/R_programming_assignment/Exploratory_data_Analysis_project"
setwd(filePath)
allData <- read.table("household_power_consumption.txt",
                      sep = ";", header = TRUE)
subData <- subset(allData, allData$Date == "1/2/2007" | allData$Date == "2/2/2007" )
n <- length(subData)

# processing the data for the plotting graph
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$Time <- strptime(subData$Time, format="%H:%M:%S")
subData[1:1440, "Time"] <- format(subData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subData[1441:2880, "Time"] <- format(subData[1441:2880, "Time"], 
                                     "2007-02-02 %H:%M:%S")

# plotting graph4

par(mfrow = c(2,2))
par(mar=c(4,4,2,2))
with(subData, {
  #1
  plot(subData$Time, as.numeric(subData$Global_active_power), type = "l", xlab = "",
       ylab ="Global Active Power(kilowatts)" )
  
  #2
  plot(subData$Time, as.numeric(subData$Voltage), type = "l", xlab = "datetime",
       ylab ="Voltage" )
  #3
  plot(subData$Time, subData$Sub_metering_1, type = "n", 
       xlab = "", ylab = "Energy sub metering")
  with(subData, lines(Time, as.numeric(Sub_metering_1)))
  with(subData, lines(Time, as.numeric(Sub_metering_2), col="red"))
  with(subData, lines(Time, as.numeric(Sub_metering_3), col="blue"))
  legend("topright", lty = 1, col= c("black", "red", "blue"), 
         legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.60, bty = "n")
  
  #4
  
  plot(subData$Time, as.numeric(subData$Global_reactive_power), type = "l", xlab = "datetime",
       ylab ="Global_reactive_power" )
})

dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()

