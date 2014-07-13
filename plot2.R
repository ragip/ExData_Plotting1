plot2 <- function() {
  household_power_consumption <- read.csv("household_power_consumption.txt", 
            colClasses = c("character", "character", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric", "numeric"), 
            sep=";", na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
  sel_power_consumption <- subset(household_power_consumption, 
      household_power_consumption$Date == as.Date("2007-02-01") 
      | household_power_consumption$Date == as.Date("2007-02-02"))
  
  # Add a column with full date information 
  sel_power_consumption$FullDate <- strptime(paste(sel_power_consumption$Date, 
                                                   sel_power_consumption$Time), "%Y-%m-%d %H:%M:%S")

  # create plot
  png(filename="plot2.png", width = 480, height = 480)  
  plot(sel_power_consumption$FullDate, sel_power_consumption$Global_active_power, 
       xlab="", ylab = "Global Active Power (kilowatts)",type = "l")
  dev.off()
  sel_power_consumption
}