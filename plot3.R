################################################################################
# plot3.R: code to reproduce plot 3 from Project 1 of Exploaratory Data Analysis
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


png(file="plot3.png",width=480,height=480,bg="transparent")
	 plot(
		x=hpc.sub.dt$Time,
		y=hpc.sub.dt$Sub_metering_1,type="l",
		xlab="Time",
		ylab="Energy sub metering"
	 )
	 lines(
		x=hpc.sub.dt$Time,
		y=hpc.sub.dt$Sub_metering_2,
		col="red"
	 )
	 lines(
		x=hpc.sub.dt$Time,
		y=hpc.sub.dt$Sub_metering_3,
		col="blue"
	)
	legend(
		x="topright",
		lty=1,
		lwd=1,
		col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		)
dev.off()
