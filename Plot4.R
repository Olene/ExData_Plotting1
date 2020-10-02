# Read data
dat <- read.table("./householdpc.txt", header = TRUE, sep = ";")
# Subset data from the dates "1/2/2007" and "2/2/2007"
ndat<- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
# Convert variables to numeric
actpow <- as.numeric(as.character(ndat$Global_active_power))
reapow <- as.numeric(as.character(ndat$Global_reactive_power))
vol <- as.numeric(as.character(ndat$Voltage))
date <- as.character(ndat$Date)
time <- as.character(ndat$Time)
dt <- strptime(paste(date, time), "%d/%m/%Y %H:%M:%S")
submeter1 <- as.numeric(as.character(ndat$Sub_metering_1))
submeter2 <- as.numeric(as.character(ndat$Sub_metering_2))
submeter3 <- as.numeric(as.character(ndat$Sub_metering_3))
# Create png file
png("Plot4.png", width = 480, height = 480)
# Create plot
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2, 1))
plot(x = dt, y = actpow, ylab = "Global Active Power (kilowatts)", xlab = " ", type = "l")
plot(x = dt, y = vol, ylab = "Voltage", xlab = "Datetime", type = "l")
plot(x = dt, y = submeter1, ylab = "Energy Sub Metering", xlab = " ", type = "l")
lines(x = dt, y = submeter2, col = "red")
lines(x = dt, y = submeter3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x = dt, y = reapow, ylab = "Global Reactive Power", xlab = "Datetime", ylim = range(0, 0.5), type = "l")
dev.off()