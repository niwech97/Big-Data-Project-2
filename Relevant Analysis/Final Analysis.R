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

#visualize m
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

plot(lm(m$TIME~m$Value))
#create a loop for this to be done on every country
# first make one for the entire dataset just like we did above
#
unique.country<-unique(m$LOCATION)


for(i in 1:length(m$LOCATION)){
for(ctr in 1:length(unique.country)){
 if(m$LOCATION[i] == unique.country[ctr]){
  graph.temp<-subset(m,subset = LOCATION ==unique.country[ctr])
  pdf(file=paste(path.fingraph,"/",m$LOCATION[i],".pdf",sep=""))
  plot(graph.temp$TIME,graph.temp$Value,
       main=unique.country[ctr],xlab="Year",ylab= "Vaccination Rate (%)")
dev.off()
}}}
?dev.list



# save for later to edit
   #for(i in 1:length(m$LOCATION)){
   ctr<-1
   i<-1
    if(dataset$TIME[i] == unique.years[ctr]){
     graph.temp<-subset(dataset,subset = TIME==unique.years[ctr])
     pdf(file=paste(path.fingraph,"/",dataset$TIME[i],".pdf",sep=""))
     plot(graph.temp$Value.y,graph.temp$Value.x,main=unique.years[ctr],
          xlab="Year",ylab= "Vaccination Rate")}
   dev.off()
      }}
