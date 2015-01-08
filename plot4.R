### Getting full dataset
house_hold_power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?");
house_hold_power$Date <- as.Date(house_hold_power$Date, format = "%d/%m/%Y");

### Subsetting the data
power <- subset(house_hold_power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"));
datetime <- paste(as.Date(power$Date), power$Time);
power$Datetime <- as.POSIXct(datetime);

### PLOT
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0));
with(power, {
              plot(Global_active_power~Datetime, type="l", 
                    ylab="Global Active Power (kilowatts)", xlab="")
              plot(Voltage~Datetime, type="l", 
                    ylab="Voltage (volt)", xlab="")
              plot(Sub_metering_1~Datetime, type="l", 
                    ylab="Global Active Power (kilowatts)", xlab="")
                      lines(Sub_metering_2~Datetime,col='Red')
                      lines(Sub_metering_3~Datetime,col='Blue')
                    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
                    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
              plot(Global_reactive_power~Datetime, type="l", 
                    ylab="Global Rective Power (kilowatts)",xlab="")
});

### Saving to file
dev.copy(png, file="plot4.png");
dev.off();