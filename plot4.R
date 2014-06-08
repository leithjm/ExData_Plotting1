df<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
df_subset<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
date_time<-paste( df_subset$Date, df_subset$Time)
date_time<-strptime(date_time, format="%d/%m/%Y %H:%M:%S")
df_data<-data.frame( date=date_time, 
                     gap=df_subset$Global_active_power, 
                     grp=df_subset$Global_reactive_power,
                     voltage=df_subset$Voltage,
                     sm1=df_subset$Sub_metering_1, 
                     sm2=df_subset$Sub_metering_2, 
                     sm3=df_subset$Sub_metering_3)

par( mfcol=c(2,2))

plot(df_data$date, df_data$gap, type="l", xlab="", ylab="Global Active Power", cex.lab=0.7)

plot(df_data$date, df_data$sm1, type="l", ylab="Energy sub metering", xlab="", cex.lab=0.7)
lines(df_data$date, df_data$sm2, col="red")
lines(df_data$date, df_data$sm3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.6)

plot(df_data$date, df_data$voltage, type="l", xlab="datetime", ylab="Voltage", cex.lab=0.7)

plot(df_data$date, df_data$grp, type="l", xlab="datetime", ylab="Global_reactive_power", cex.lab=0.7)

dev.copy(png, filename="plot4.png", height=480, width=480, units="px")
dev.off()