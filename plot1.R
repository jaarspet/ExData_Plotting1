## Exploratory Data Analysis - Assignment 1 - Plot 1

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
df.power[, "Date"] <- as.Date(strptime(df.power[, "Date"], format='%d/%m/%Y'))
                         
## Step 4 will be to create the plot 

png(filename="plot1.png", width=480, height=480)

hist(df.power$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", col="red")

dev.off()
                         
                         