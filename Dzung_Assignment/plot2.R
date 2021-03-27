########## Data Science 4: Exploratory Data Analysis ##########################
###### This script is for Peer-graded Assignment Week 1 ########################

###Introduction
##This assignment uses data from the UC Irvine Machine Learning Repository, 
#a popular repository for machine learning datasets. 
#In particular, we will be using the "Individual household electric power consumption Data Set" 
#which I have made available on the course web site:
#Dataset: Electric power consumption [20Mb]
#Description: Measurements of electric power consumption in one household with 
#a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.


###Loading the data

##When loading the dataset into R, please consider the following:
#The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate 
#of how much memory the dataset will require in memory before reading into R. 
#Make sure your computer has enough memory (most modern computers should be fine).

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than 
#reading in the entire dataset and subsetting to those dates.

#You may find it useful to convert the Date and Time variables to Date/Time classes 
#in R using the strptime() and as.Date() functions.

#Note that in this dataset missing values are coded as ?.

setwd("D:/OneDrive/MOOCs/MOOC Data Sciences_JHU/Course 4 Exploratory Data Analysis/Week 1/Peer graded assignments/ExData_Plotting1")
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = './ds4_assign1_data.zip', method = 'curl', quiet = T)
unzip(zipfile = 'ds4_assign1_data.zip')
rawData <- read.table('household_power_consumption.txt', header = TRUE, na.strings = '?', 
                      sep = ';', skip = 66636, nrows = 2880, stringsAsFactors = F, quote = "")
tail(rawData,10)
colnames(rawData) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power',
                       'Voltage', 'Global_intensity', 'Sub_metering_1', 
                       'Sub_metering_2', 'Sub_metering_3')
head(rawData, 5)
?strptime
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format ='%d/%m/%Y %H:%M:%S')


### Making Plots

#Our overall goal here is simply to examine how household energy usage
#varies over a 2-day period in February, 2007. Your task is to
#reconstruct the plots that can be found [here](https://github.com/rdpeng/ExData_Plotting1), all of which were constructed using the base plotting system.

#For each plot you should

#- Construct the plot and save it to a PNG file with a width of 480
#pixels and a height of 480 pixels.
#- Name each of the plot files as `plot1.png`, `plot2.png`, etc.
#- Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
#constructs the corresponding plot, i.e. code in `plot1.R` constructs
#the `plot1.png` plot. Your code file **should include code for reading
#the data** so that the plot can be fully reproduced. You should also
#include the code that creates the PNG file.
#- Add the PNG file and R code file to your git repository



### Plot 2 
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(rawData$DateTime, rawData$Global_active_power, type = 'l', col = 'cadetblue3',
     ylab = 'Global Active Power (kilowatts)',
     xlab = NA)
dev.off()