### Getting full dataset
house_hold_power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?");

### Subsetting the data
power <- subset(house_hold_power, Date == "1/2/2007" | Date == "2/2/2007");
power[, "Date"] <- as.Date(strptime(power[, "Date"], format='%d/%m/%Y'));

### Create file
png(filename="plot1.png");

### PLOT
hist(power[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" );

### Close connection
dev.off();