## Importing the dataset
Course_Project1_4 <- read.csv("C:/Users/D1/Desktop/Study Materials & References/Courseera/Explaratory Data Analysis/Week 1/Course Project 1/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Course_Project1_4$Date <- as.Date(Course_Project1_4$Date, format="%d/%m/%Y")

## Subsetting the data
Course_Project1_ImpData_4 <- subset(Course_Project1_4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Course_Project1_4)

## Converting dates
datetime <- paste(as.Date(Course_Project1_ImpData_4$Date), Course_Project1_ImpData_4$Time)
Course_Project1_ImpData_4$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Course_Project1_ImpData_4, 
     {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()