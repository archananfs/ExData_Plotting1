
## plot3
filePath = "R_projects/R_programming_assignment/Exploratory_data_Analysis_project/power_consumption_git"
setwd(filePath)
allData <- read.table("household_power_consumption.txt",
                      sep = ";", header = TRUE)
subData <- subset(allData, allData$Date == "1/2/2007" | allData$Date == "2/2/2007" )
n <- length(subData)

# processing data for the plotting graph
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$Time <- strptime(subData$Time, format="%H:%M:%S")
subData[1:1440, "Time"] <- format(subData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subData[1441:2880, "Time"] <- format(subData[1441:2880, "Time"], 
                                     "2007-02-02 %H:%M:%S")

# plotting the graph
plot(subData$Time, subData$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
with(subData, lines(Time, as.numeric(Sub_metering_1)))
with(subData, lines(Time, as.numeric(Sub_metering_2), col="red"))
with(subData, lines(Time, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty = 1, col= c("black", "red", "blue"), 
       legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.75)
title(main="Energy sub-metering")

# saving
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()
