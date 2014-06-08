df<-read.delim("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
df$Date<-as.Date(df$Date, "%d/%m/%Y")
df_subset<-subset(df, Date==as.Date("1/2/2007","%d/%m/%Y") | Date==as.Date("2/2/2007","%d/%m/%Y")
))
hist(df_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, filename="plot1.png", height=480, width=480, units="px")
dev.off()


