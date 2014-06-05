

loading the dataset into R
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


#plot1
png("plot1.png", width=480, height=480)
hist(df$Global_reactive_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",col="red")
dev.off()
