## Coursera Project  - Exploratory Data Analysis
## plot2
## load the file

filePath = "R_projects/R_programming_assignment/Exploratory_data_Analysis_project/power_consumption_git"
setwd(filePath)
allData <- read.table("household_power_consumption.txt",
                      sep = ";", header = TRUE)
subData <- subset(allData, allData$Date == "1/2/2007" | allData$Date == "2/2/2007" )
n <- length(subData)

# Data processing prior to plotting the data
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$Time <- strptime(subData$Time, format="%H:%M:%S")
subData[1:1440, "Time"] <- format(subData[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subData[1441:2880, "Time"] <- format(subData[1441:2880, "Time"], 
                                     "2007-02-02 %H:%M:%S")
# plotting the graph
plot(subData$Time, as.numeric(subData$Global_active_power), type = "l", xlab = "",
     ylab ="Global Active Power(kilowatts)" )
title(main="Global Active Power Vs Time")


## saving to png file
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()

