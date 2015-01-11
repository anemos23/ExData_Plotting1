
##read the file in a data frame
df <- read.csv("~/R/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

##subsetting the data frame to the required dates
df_req <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")

##change to numeric
df_req$Global_active_power <- as.numeric(df_req$Global_active_power)

##produce histogram and store it in a .png file
png("plot1.png", 480, 480)
hist(df_req$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (in kilowatts)")
dev.off()