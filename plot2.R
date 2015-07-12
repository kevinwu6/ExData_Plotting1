## Read and clean data
hpc <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?',
                stringsAsFactors = FALSE)
hpc_feb <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]
hpc_dt <- cbind(strptime(paste(hpc_feb$Date, hpc_feb$Time),
                         format = '%d/%m/%Y %H:%M:%S'), hpc_feb)
names(hpc_dt)[1] <- 'datetime'

png('plot2.png', 480, 480)

## Create line plot
plot(hpc_dt$datetime, hpc_dt$Global_active_power, type = 'l',
     xlab = NA, ylab = 'Global Active Power (kilowatts)')

dev.off()
