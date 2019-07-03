library(dplyr)
library(lubridate)

whole_df <- read.csv("household_power_consumption.txt",sep = ";", 
                     stringsAsFactors = FALSE)

ind1 <- which(whole_df$Date == "1/2/2007")
ind_b <- ind1[1] 
ind2 <- which(whole_df$Date == "2/2/2007")
ind_e <- ind2[length(ind2)]

df_org <- whole_df[ind_b:ind_e,]
df <- mutate(df_org, Date = as.Date(df_org$Date,format = "%d/%m/%y"), 
             Time = format(strptime(df_org$Time, format = "%H:%M:%S", tz=""), format="%H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)

plot(as.numeric(df$Global_active_power), type = "l",xaxt = "n", xlab = "", 
     ylab = "Global Active Power (kilowatts)", mar = c(5,4,4,2))
axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
