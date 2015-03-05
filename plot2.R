
source("load_data.R") # include load_data.R in this file
plot2<- function() 
	{
		 
		data <- load_data() # loads data
		png("plot2.png", width=400, height=400) # opens device 
		plot(data$Time, data$Global_active_power,
		type="l",xlab="",ylab="Global Active Power (kilowatts)")
		dev.off()
	}

	plot2()  # calls above function so as to plot graph