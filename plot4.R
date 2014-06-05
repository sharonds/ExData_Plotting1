

#loading the dataset into R
df <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")

#  convert the Date and Time variables to Date/Time classes in R
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# using data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dates)

#plot4

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(df$Time, df$Global_active_power,type="l",
     col="black",
     xlab="", ylab="Global Active Power")

plot(df$Time, df$Voltage,type="l",
     col="black",
     xlab="datetime", ylab="Voltage")

plot(df$Time, df$Sub_metering_1,type="l",
     col="black",
     xlab="", ylab="Energy sub metering")
lines(df$Time, df$Sub_metering_2,type="l",
      col="red")
lines(df$Time, df$Sub_metering_3,type="l",
      col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,bty = "n")

plot(df$Time, df$Global_reactive_power,type="l",
     col="black",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()




