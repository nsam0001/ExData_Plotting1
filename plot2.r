##############################################################################################
# LOAD BLOCK (universal)
##############################################################################################

# collect raw consumption dataset

setwd("C:\\Users\\NS186041.TD\\Documents\\GitHub\\ExData_Plotting1\\")
cons = read.csv("C:\\Users\\NS186041.TD\\Documents\\EDA01\\household_power_consumption.txt", 
header=TRUE, sep = ";", na = "?")

head(cons)
dim(cons)

# dates needed are: 2007-02-01 and 2007-02-02. Format is: 1/2/2007 and 2/2/2007

cons_sub = cons[cons$Date %in% c("1/2/2007","2/2/2007") ,]

# this update block might be useless but it follows the recommendation of stripping time

dt_temp <- paste(cons_sub$Date, cons_sub$Time)
cons_sub$DateTime <- strptime(dt_temp, "%d/%m/%Y %H:%M:%S")
rownames(cons_sub) <- 1:nrow(cons_sub)

head(cons_sub)
dim(cons_sub)

##############################################################################################
# plotting the graph
##############################################################################################

png("plot2.png", width=480, height=480)
with(cons_sub, 
	plot(
			DateTime, 
			as.numeric(Global_active_power),
			type="l", 
			ylab="Global Active Power (kilowatts)",
			xlab=""
		)
	)
dev.off()