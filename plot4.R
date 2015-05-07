## Exploratory Data Analysis - Assignment 1 - Plot 4

## Step 1 will be to check if the data is available, if not, download the file and store in WD

filename = "exdata_data_household_power_consumption.zip"  
if (!file.exists(filename)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
                         destfile = filename, 
                         method = "curl")
}
                         
## Step 2 will be to read the data from the zip file
                         
df.power = read.csv(unz(filename, "household_power_consumption.txt"), header=T, 
                         sep=";", stringsAsFactors=F, na.strings="?",
                         colClasses=c("character", "character", "numeric",
                         "numeric", "numeric", "numeric",
                         "numeric", "numeric", "numeric"))
                         
## Step 3 will be to format the date and subset the data (only 2007-02-01 and 2007-02-02 used)
                         
df.power <- subset(df.power, Date == "1/2/2007" | Date == "2/2/2007")
                         
dt <- strptime(paste(df.power$Date, df.power$Time), format="%d/%m/%Y %H:%M:%S")
                         
## Step 4 will be to create the plots
                         
png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

# Plot 1 - global active power: upper left

plot(x=dt, y=df.power[,"Global_active_power"], type="l",ylab="Global Active Power", main="", xlab="")

# Plot 2 - voltage: upper right

plot(x=dt, y=df.power[,"Voltage"], type="l",ylab="Voltage", main="", xlab="datetime")

# Plot 3 - sub metering: lower left

plot(x=dt, y=df.power[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=dt, y=df.power[,"Sub_metering_2"], col="red")
lines(x=dt, y=df.power[,"Sub_metering_3"], col="blue")

legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4 - global reactive power: lower right

plot(x=dt, y=df.power[,"Global_reactive_power"], type="l",ylab="Global_reactive_power", main="", xlab="datetime")

dev.off()