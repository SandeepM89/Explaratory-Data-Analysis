## Importing the dataset
Course_Project1 <- read.csv("C:/Users/D1/Desktop/Study Materials & References/Courseera/Explaratory Data Analysis/Week 1/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Course_Project1$Date <- as.Date(Course_Project1$Date, format="%d/%m/%Y")

## Subsetting the data to get the relevant conditions based on date
Course_Project1_ImpData <- subset(Course_Project1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Course_Project1)

## Converting dates
datetime <- paste(as.Date(Course_Project1_ImpData$Date), Course_Project1_ImpData$Time)
Course_Project1_ImpData$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(Course_Project1_ImpData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()