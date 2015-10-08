plot4 <- function() {

#	DATA = read.csv('./household_power_consumption.txt', head=TRUE, sep=",",
#	         	    colClasses=c(Date="date", Time="time", GlobalActivePower="numeric",
#		   	    GlobalReactivePower="numeric", Voltage="numeric", GlobalIntensity="numeric",
#	 		    SubMetering1="numeric", SubMetering2="numeric", SubMetering3="numeric") )

	DATA = read.csv('./household_power_consumption.txt', head=TRUE, sep=";", nrows=100000)

    DAY1 = as.POSIXct('2007-02-01 00:00:00', format = "%Y-%m-%d %H:%M:%S");
    DAY2 = as.POSIXct('2007-02-03 00:00:00', format = "%Y-%m-%d %H:%M:%S");
    
    dates = as.character(DATA[,1]);
    times = as.character(DATA[,2]);
    
    dtimes = as.POSIXct(paste(a,b), format = "%d/%m/%Y %H:%M:%S");
    
    idxs = which(dtimes >= DAY1 & dtimes < DAY2);
    
    GlobActPower = as.numeric(as.character(DATA$Global_active_power));
    Sub1 = as.numeric(as.character(DATA$Sub_metering_1));
    Sub2 = as.numeric(as.character(DATA$Sub_metering_2));
    Sub3 = as.numeric(as.character(DATA$Sub_metering_3));
    GlobReactPower = as.numeric(as.character(DATA$Global_reactive_power));
    Voltage = as.numeric(as.character(DATA$Voltage));
    
    Sys.setlocale("LC_ALL", "English"); # to make sure week days are marked appropriately
    
    # DBG
    #windows();
    #par(mfrow = c(2,2));
    #plot(GlobActPower[idxs]~dtimes[idxs], pch='.', ylab = "Global Active Power", xlab="");
    #lines(GlobActPower[idxs]~dtimes[idxs]);
    #plot(Voltage[idxs]~dtimes[idxs], pch='.', ylab = "Voltage", xlab="");
    #lines(Voltage[idxs]~dtimes[idxs]);
    #plot(Sub1[idxs]~dtimes[idxs], pch='.', ylab = "Energy sub metering", xlab="");
    #lines(Sub1[idxs]~dtimes[idxs]);
    #lines(Sub2[idxs]~dtimes[idxs], col = 'red');
    #lines(Sub3[idxs]~dtimes[idxs], col = 'blue');
    #legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1, 1, 1) );
    #plot(GlobReactPower[idxs]~dtimes[idxs], pch='.', ylab = "Global_reactive_power", xlab="");
    #lines(GlobReactPower[idxs]~dtimes[idxs]);
    
    png('plot4.png');
    par(mfrow = c(2,2));
    plot(GlobActPower[idxs]~dtimes[idxs], pch='.', ylab = "Global Active Power", xlab="");
    lines(GlobActPower[idxs]~dtimes[idxs]);
    plot(Voltage[idxs]~dtimes[idxs], pch='.', ylab = "Voltage", xlab="");
    lines(Voltage[idxs]~dtimes[idxs]);
    plot(Sub1[idxs]~dtimes[idxs], pch='.', ylab = "Energy sub metering", xlab="");
    lines(Sub1[idxs]~dtimes[idxs]);
    lines(Sub2[idxs]~dtimes[idxs], col = 'red');
    lines(Sub3[idxs]~dtimes[idxs], col = 'blue');
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1, 1, 1) );
    plot(GlobReactPower[idxs]~dtimes[idxs], pch='.', ylab = "Global_reactive_power", xlab="");
    lines(GlobReactPower[idxs]~dtimes[idxs]);
    dev.off();
}