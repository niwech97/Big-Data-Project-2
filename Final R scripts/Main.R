# Main R script


# this script will:
# 1) read in the raw data from csv files
# 2) clean them into new objects
# 3) show our loop function (#out so that you only see it but it does not run
#            because it has already run and the results are in the correct folders)
# 4) perform the relevant analysis on our dataset 


R.version.string
#"R version 3.6.2 (2019-12-12)"


#Libraries--------
library(dplyr)
library(ggplot2)


#Main script-------------
#Reading in raw data-----
m<-read.csv(file=paste(path.rd,"/","Measles_ALL.csv",sep=""))


#Cleaning data-----------
m<-select(m, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                "FREQUENCY"))

#Creating the loop-------
#we created an object with only the names of the relevant 
#countries to be used in our loop
unique.country<-unique(m$LOCATION)  


#we used a nested loop structure to accomplish our loop.
#first we started a counter to do something in every row of our dataset
for(i in 1:length(m$LOCATION)){               
  #then we used a second counter to utilize our unique country list
  for(ctr in 1:length(unique.country)){
    #within that counter we created an if statement to extract only 
    #the data from one country at a time 
    if(m$LOCATION[i] == unique.country[ctr]){
      #we stored the subset of one country at a time in a temporary object
      graph.temp<-subset(m,subset = LOCATION ==unique.country[ctr])
      #then we opened a PDF file to save it as the name of the country in our Relevant Figures folder
      pdf(file=paste(path.fingraph,"/",m$LOCATION[i],".pdf",sep=""))
      #Finally we plotted the graph of each countries vaccination rate over time
      plot(graph.temp$TIME,graph.temp$Value,
           main=unique.country[ctr],xlab="Year",ylab= "Vaccination Rate (%)",
           pch=16, las=1, col="blue")
      #and turned off the device
      dev.off()
    }}}


#Performing relevant analysis--------------------------------------------
