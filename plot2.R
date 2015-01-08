### Getting full dataset
house_hold_power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?");
house_hold_power$Date <- as.Date(house_hold_power$Date, format = "%d/%m/%Y");

### Subsetting the data
power <- subset(house_hold_power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));
datetime <- paste(as.Date(power$Date), power$Time);
power$Datetime <- as.POSIXct(datetime);

### Create file
png(filename = "plot2.png");

### PLOT
plot(power$Global_active_power~power$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="");

### Close connection
dev.off();