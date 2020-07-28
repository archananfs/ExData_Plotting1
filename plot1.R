## Coursera Project
## Exploratory data Analysis
## Plot1 

# load and read the data
filePath = "R_projects/R_programming_assignment/Exploratory_data_Analysis_project/power_consumption_git"
setwd(filePath)
allData <- read.table("household_power_consumption.txt",
                      sep = ";", header = TRUE)

subData <- subset(allData, allData$Date == "1/2/2007" | allData$Date == "2/2/2007" )

# histogram of Active Power
hist(as.numeric(subData$Global_active_power), col="red",main = "Global Active Power", 
     xlab= "Global Active Power(kilowatts)")

## to save the graph to png
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()