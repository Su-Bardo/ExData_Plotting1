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
## plotting scatterplot on screen device
with (powerdata, {
        plot(Sub_metering_1 ~ DateTime, xlab="",
                      ylab = "Energy sub metering",type="l")
        lines(Sub_metering_2 ~ DateTime, col="red")
        lines(Sub_metering_3 ~ DateTime, col="blue")
})        
legend("topright", lwd=.5,lty = 1, col=c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
        x.intersp = .75, y.intersp = .75)
## copying content from screen to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
