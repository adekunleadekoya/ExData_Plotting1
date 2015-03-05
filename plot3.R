 
	plot3 <- function()
		 {			 
		  data <- load_data() # loads data
		  png("plot3.png", width=400, height=400)
		  plot(data$Time, data$Sub_metering_1, type="l", col="black",
				xlab="", ylab="Energy sub metering")
		  lines(data$Time, data$Sub_metering_2, col="red")
		  lines(data$Time, data$Sub_metering_3, col="blue")
		  legend("topright",col=c("black", "red", "blue"),
		  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
		  dev.off()
		}

	load_data <- function()
	 {
		file.name = "household_power_consumption.txt" # sets filename

		df <- read.table(file.name,header=TRUE,sep=";",
				colClasses=c("character", "character",
				 rep("numeric",7)),na="?") # populates data frame

		# convert date and time variables to Date/Time class
		df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

		#coerce df$Time to Date class
		df$Date <- as.Date(df$Date, "%d/%m/%Y")

		# only use data from the dates 2007-02-01 and 2007-02-02
		dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

		df <- subset(df, Date %in% dates) # subsets df
		return(df)
	}

	plot3() # calls function plot3