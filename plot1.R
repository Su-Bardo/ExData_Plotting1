library(data.table)
setwd("C:/Users/Sumbat/ExData_Plotting1")

##reading data in
powerdata<- fread("household_power_consumption.txt", na.strings = "?")
## converting Date column to Date format
powerdata[,Date:=as.Date(Date, "%d/%m/%Y")]
## subset data which fall between dates pointed out
powerdata<-powerdata[Date >= "2007-02-01" & Date <= "2007-02-02"]
## creating new column (variable) DateTime from Date and Time columns
powerdata[, DateTime:= as.POSIXct(paste(Date,Time), "%Y-%m-%d %H:%M:%S", tz="GMT")]
## plotting histogram on screen device
with (powerdata, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                ylab="Frequency", main = "Global Active Power", col="red"))
## copying content from screen to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
