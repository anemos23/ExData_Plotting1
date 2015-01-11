
##read the file in a data frame
df <- read.csv("~/R/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

##subsetting the data frame to the required dates
df_req <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

##create and add a timeline variable that can be used for plotting 
timeline <- 1:2880
df_time <- cbind(timeline, df_req)

##produce the plot and store it in a .png file
png("plot3.png", 480, 480)
plot(df_time$timeline, df_time$Sub_metering_1, type = "l", ylab = "Global active power (in kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), tick = TRUE)
lines(df_time$timeline, df_time$Sub_metering_2, type = "l", col = "red")
lines(df_time$timeline, df_time$Sub_metering_3, type = "l", col = "blue")
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c('black', 'red', 'blue'), bty='o', cex=.75)
dev.off()


