# Load dataset into R
 
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