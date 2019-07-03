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

png(filename = "plot4.png", width = 480, height = 480)




dev.off()