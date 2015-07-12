## Read and clean data
hpc <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?',
                stringsAsFactors = FALSE)
hpc_feb <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]
hpc_dt <- cbind(strptime(paste(hpc_feb$Date, hpc_feb$Time),
                         format = '%d/%m/%Y %H:%M:%S'), hpc_feb)
names(hpc_dt)[1] <- 'datetime'

png('plot3.png', 480, 480)

## Create line plot with legend
plot(hpc_dt$datetime, hpc_dt$Sub_metering_1, type = 'l', xlab = NA,
     ylab = 'Energy sub metering')
lines(hpc_dt$datetime, hpc_dt$Sub_metering_2, col = 'red')
lines(hpc_dt$datetime, hpc_dt$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = c(1, 1, 1))

dev.off()
