### Getting full dataset
house_hold_power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?");
house_hold_power$Date <- as.Date(house_hold_power$Date, format = "%d/%m/%Y");

### Subsetting the data
power <- subset(house_hold_power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));
datetime <- paste(as.Date(power$Date), power$Time);
power$Datetime <- as.POSIXct(datetime);


### Create file
png(filename = "plot3.png");

### PLOT
with(power, {
            plot(Sub_metering_1~Datetime, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
            lines(Sub_metering_2~Datetime,col='Red')
            lines(Sub_metering_3~Datetime,col='Blue')
  });
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));

### Close connection
dev.off();