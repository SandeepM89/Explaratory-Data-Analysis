## Importing the dataset
Course_Project1_2 <- read.csv("C:/Users/D1/Desktop/Study Materials & References/Courseera/Explaratory Data Analysis/Week 1/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Course_Project1_2$Date <- as.Date(Course_Project1_2$Date, format="%d/%m/%Y")

## Subsetting the data
Course_Project1_ImpData_2 <- subset(Course_Project1_2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Course_Project1_2)

## Converting dates
datetime <- paste(as.Date(Course_Project1_ImpData_2$Date), Course_Project1_ImpData_2$Time)
Course_Project1_ImpData_2$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(Course_Project1_ImpData_2$Global_active_power~Course_Project1_ImpData_2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()