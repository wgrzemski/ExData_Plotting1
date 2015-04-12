################################################################################
# plot2.R: code to reproduce plot 2 from Project 1 of Exploaratory Data Analysis
# Note the code assumes that it, and the unzipped data file resides in the same
# directory.

# Prepare data in hpc.dt ("household power consumption"):
hpc.dt <- read.csv(
       file="household_power_consumption.txt",
       header=TRUE,
       na.strings="?",
       sep=";",
       stringsAsFactors=FALSE
)

hpc.dt$Time <- strptime(
	 paste(hpc.dt$Date, hpc.dt$Time, sep=" "),
	 format="%d/%m/%Y %H:%M:%S"
)

hpc.dt$Date <- as.Date(hpc.dt$Date,format="%d/%m/%Y")

hpc.sub.dt <- hpc.dt[which(hpc.dt$Date == "2007-02-01" | hpc.dt$Date == "2007-02-02"),]


png(file="plot2.png",width=480,height=480,bg="transparent")
	plot(
	     x=hpc.sub.dt$Time,
	     y=hpc.sub.dt$Global_active_power,
	     type="l",
	     xlab="Time",
	     ylab="Global Active Power (kilowatts)"
	    )
dev.off()
