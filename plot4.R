## Read and clean data
hpc <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?',
                stringsAsFactors = FALSE)
hpc_feb <- hpc[hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007', ]
hpc_dt <- cbind(strptime(paste(hpc_feb$Date, hpc_feb$Time),
                         format = '%d/%m/%Y %H:%M:%S'), hpc_feb)
names(hpc_dt)[1] <- 'datetime'

png('plot4.png', 480, 480)

par(mfrow = c(2, 2))

plot(hpc_dt$datetime, hpc_dt$Global_active_power, type = 'l',
     xlab = NA, ylab = 'Global Active Power')

plot(hpc_dt$datetime, hpc_dt$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')

plot(hpc_dt$datetime, hpc_dt$Sub_metering_1, type = 'l', xlab = NA,
     ylab = 'Energy sub metering')
lines(hpc_dt$datetime, hpc_dt$Sub_metering_2, col = 'red')
lines(hpc_dt$datetime, hpc_dt$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = c(1, 1, 1))

plot(hpc_dt$datetime, hpc_dt$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
