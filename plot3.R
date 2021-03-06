df<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
df_subset<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
date_time<-paste( df_subset$Date, df_subset$Time)
date_time<-strptime(date_time, format="%d/%m/%Y %H:%M:%S")
df_data<-data.frame( date=date_time, sm1=df_subset$Sub_metering_1, sm2=df_subset$Sub_metering_2, sm3=df_subset$Sub_metering_3)
plot(df_data$date, df_data$sm1, type="l", ylab="Energy sub metering", xlab="" )
lines(df_data$date, df_data$sm2, col="red")
lines(df_data$date, df_data$sm3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)
dev.copy(png, filename="plot3.png", height=480, width=480, units="px")
dev.off()
