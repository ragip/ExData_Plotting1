plot4 <- function() {
  household_power_consumption <- read.csv("household_power_consumption.txt", 
            colClasses = c("character", "character", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric", "numeric"), 
            sep=";", na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
  
  # select the date subset for power consumption data
  sel_power_consumption <- subset(household_power_consumption, 
      household_power_consumption$Date == as.Date("2007-02-01") 
      | household_power_consumption$Date == as.Date("2007-02-02"))
  
  # Add a column with full date information 
  sel_power_consumption$FullDate <- strptime(paste(sel_power_consumption$Date, 
                                                   sel_power_consumption$Time), "%Y-%m-%d %H:%M:%S")
  
  png(filename="plot4.png", width = 480, height = 480,antialias = "default")  
  
  par(mfrow = c(2,2))
  
  # plot power consumption data
  plot(sel_power_consumption$FullDate, sel_power_consumption$Global_active_power, 
       xlab="", ylab = "Global Active Power",type = "l")
  
  # plot voltage data
  plot (sel_power_consumption$FullDate, sel_power_consumption$Voltage, 
        xlab = "datetime", ylab = "Voltage", type = "l")
  
  # plot submetering data
  plot(sel_power_consumption$FullDate, sel_power_consumption$Sub_metering_1,  
       xlab="", ylab = "Energy sub metering",col="black", type = "l")
  lines(sel_power_consumption$FullDate, sel_power_consumption$Sub_metering_2,  
      col="red")
  lines(sel_power_consumption$FullDate, sel_power_consumption$Sub_metering_3,  
        col="blue")
  
  legend("topright",         
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=c(1,1,1), bty="n",        
         lwd=c(1,1,1),col=c("black", "red","blue")) 
  
  #plot global reactive power
  plot(sel_power_consumption$FullDate, sel_power_consumption$Global_reactive_power, 
       xlab="datetime", ylab="Global_reactive_power", type = "l")
  
  dev.off()
  
  sel_power_consumption
}