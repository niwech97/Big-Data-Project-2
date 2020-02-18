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

plot(lm(m$TIME~m$Value, xlab="Year",ylab="Vaccinated Children(%)",
     main="Linear Regression of Global Child Vaccination Rate 1980-2018",
     las=1, pch=16,col="black"))
