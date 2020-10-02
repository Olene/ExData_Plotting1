# Read data
dat <- read.table("./householdpc.txt", header = TRUE, sep = ";")
# Subset data from the dates "1/2/2007" and "2/2/2007"
ndat<- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
# Convert variable "Global_active_power" from factor to numeric
actpow <- as.numeric(as.character(ndat$Global_active_power))
# Create png file
png("Plot1.png", width = 480, height = 480)
# Create histogram
hist(actpow, xlab = "Global Active Power(kilowatts)", ylab = "Frequency",main = "Global Active Power", col = "red")
dev.off()