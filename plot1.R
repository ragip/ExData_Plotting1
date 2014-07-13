plot1 <- function() {
  household_power_consumption <- read.csv("household_power_consumption.txt", 
            colClasses = c("character", "character", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric", "numeric"), 
            sep=";", na.strings = "?")
  household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
  
  # select the date subset for power consumption data
  sel_power_consumption <- subset(household_power_consumption, 
      household_power_consumption$Date == as.Date("2007-02-01") 
      | household_power_consumption$Date == as.Date("2007-02-02"))
  
  # plot the histogram
  png(filename="Plot1.png", width = 480, height = 480)
  hist(sel_power_consumption$Global_active_power, main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)",col="red", ylim = c(0,1200))
  dev.off()
  sel_power_consumption
}