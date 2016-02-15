## Importing the dataset
Course_Project1_3 <- read.csv("C:/Users/D1/Desktop/Study Materials & References/Courseera/Explaratory Data Analysis/Week 1/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Course_Project1_3$Date <- as.Date(Course_Project1_3$Date, format="%d/%m/%Y")

## Subsetting the data
Course_Project1_ImpData_3 <- subset(Course_Project1_3, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Course_Project1_3)

## Converting dates
datetime <- paste(as.Date(Course_Project1_ImpData_3$Date), Course_Project1_ImpData_3$Time)
Course_Project1_ImpData_3$Datetime <- as.POSIXct(datetime)

## Plot 3
with(Course_Project1_ImpData_3, 
     {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
      }
    )
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()