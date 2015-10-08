plot1 <- function() {

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
 
    Sys.setlocale("LC_ALL", "English"); # to make sure week days are marked appropriately
 
    # DBG ...
    #windows()
    #hist(GlobActPower[idxs], col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
    png('plot1.png');
    hist(GlobActPower[idxs], col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off();
}