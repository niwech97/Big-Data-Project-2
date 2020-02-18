#analysis attempt 3
R.version.string
#R version 3.6.2 (2019-12-12)

#Libraries-------

library(dplyr)


#Final analysis-------------
#Starting with a new csv with just Vaccine rates
m<-read.csv(file=paste(path.rd,"/","Measles_ALL.csv",sep=""))

#Cleaning the data by removing the columns we don't care about
m<-select(m, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                           "FREQUENCY"))

#visualize m (initial)
plot(m$Value~m$TIME,xlab="Year",ylab="Vaccinated Children(%)",
     main="Global Child Vaccination Rate 1980-2018",
     las=1, pch=16,col="black")
#send to figures of interest
pdf(file=paste(path.maybefigs,"First Visualization.pdf",sep="/"))
plot(m$Value~m$TIME,xlab="Year",ylab="Vaccinated Children(%)",
     main="Global Child Vaccination Rate 1980-2018",
     las=1, pch=16,col="black")
dev.off()

#visualization complete
#we know there is a general increase in vaccination rates across time
#however we cannot come to any strong conclusions
#we decided to perform a linear regression model on this dataset to
#determine if there is a relationship between vaccination rates and time


#creating a results object to store our results
model.1.results <-rep(NA,length(m$LOCATION))

#this is the overall model we are looking at
model.1 <- lm(m$TIME~m$Value)
model.1.sum <- summary(model.1)

#save results and send to result folder if possible

#attempt to save model.1.sum as a CSV
write.csv(model.1.sum, paste(path.clean,"Total Linear Regression.csv",sep="/"))

#this is the plots of the linear regression
plot(lm(m$TIME~m$Value))
#create a loop for each country to have a plot of vaccination rates over time

#we created an object with only the names of the countries we are using
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

#we want to also do a regression analysis
#first we create an object that can house the results

result.storage<-rep(NA,length(unique.country))
is.list(c(result.storage)
length(unique.country)

list <- c(result.storage, unique.country)
table(list)

table(result.storage,unique.country)
table





