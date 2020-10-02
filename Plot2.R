# Read data
dat <- read.table("./householdpc.txt", header = TRUE, sep = ";")
# Subset data from the dates "1/2/2007" and "2/2/2007"
ndat<- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
# Convert variable "Global_active_power" from factor to numeric
actpow <- as.numeric(as.character(ndat$Global_active_power))
# Convert Data and Time variables to numeric
date <- as.character(ndat$Date)
time <- as.character(ndat$Time)
dt <- strptime(paste(date, time), "%d/%m/%Y %H:%M:%S")
# Create png file
png("Plot2.png", width = 480, height = 480)
# Create plot
plot(x = dt, y = actpow, ylab = "Global Active Power (kilowatts)", xlab = " ", type = "l")
dev.off()