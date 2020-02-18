# Attempt 2 potential analysis GDP small clean child vacc



#Created mcr15 object through file screen in R, with our own factor list as countries
# doing the same for GDP data
table(GDP15$LOCATION)
table(MCR15$LOCATION)




length(MCR15$LOCATION) #these dont need to be the same as our defined factors are the same...?
length(GDP15$LOCATION) #therefore we can just remove our NA factors when making the linear model

#recleaning
GDP15<-select(GDP15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
#forcing into factor
GDP15.time<-as.factor(GDP15$TIME)

#attempt to use the na.omit function
GDP15.cleanedfinally<-na.omit(GDP15)
#It worked, sort of
GDP15.cleanedfinally


#recleaning and doing the same to the other dataset
MCR15<-select(MCR15, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag Codes",
                      "FREQUENCY"))
MCR15.time<-as.factor(MCR15$TIME)

MCR15.cleanedfinally<-na.omit(MCR15)

MCR15.cleanedfinally

factor(GDP15.cleanedfinally$LOCATION)
factor(MCR15.cleanedfinally$LOCATION)

#making our csv files
write.csv(MCR15.cleanedfinally,file=paste(path.clean,"Measles Child Vaccine Rates 15-18cleaned finally.csv",sep="/"))

write.csv(GDP15.cleanedfinally,file=paste(path.clean,"GDP by country 15-18cleanedfinally.csv",sep="/"))

#we made these before we used the omit function
write.csv(MCR15,file=paste(path.clean,"Measles Child Vaccine Rates 15-18.csv",sep="/"))

write.csv(GDP15,file=paste(path.clean,"GDP by country 15-18.csv",sep="/"))
#Now we have each data set cleaned and with the proper countries in a
#new .csv in our clean data folder


#-------------basic plot time------
# ---------GDP---------------------
# to make initial GDP

plot(GDP15.time,GDP15$Value, xlab= "Year", ylab="GDP in USD",
     main= "GDP of 57 Countries")
#got the graph we want
#time to make a file

pdf(file = paste(path.maybefigs, "GDP of 57 Countries.pdf", sep = "/"),
    width = 6, height = 4)
plot(GDP15.time,GDP15$Value, xlab= "Year", ylab="GDP in USD",
     main= "GDP of 57 Countries")
dev.off()



# -----vaccines-------------------
plot(MCR15.time, MCR15$Value, xlab = "Time",
     ylab = "Child Vaccination Rates",
     main = "Global Measles Child Vaccination Rates",
     pch = 16, las = 1)
#got the graph we want
#time to make a file


pdf(file=paste(path.maybefigs,"Child Measles Vax Rate of 57 Countries.pdf",sep="/"))
plot(MCR15.time, MCR15$Value, xlab = "Time",
ylab = "Child Vaccination Rates",
main = "Global Measles Child Vaccination Rates",
pch = 16, las = 1)
dev.off()




#------MORE CLEANING-------DEL
# SO, because we are looking at 2015-2018, there should be 4 values per COUNTRY
# in each data set
# however, this was not the case
# So, we removed all countries from further analysis that did not have a value for
# each Year
# this included: (sadly)
# AUS, CHN, IND, IDN, ZAF, COL, FRA, DEU, LUX, CHE, TUR, ISR




#-------- loop trials begin!-----
#Create a loop with goals of:
# run a linear model(regression) of global child vaccine rates and GDP15
#per year
#save results in relevant analysis folder
# save graph in maybe relevant graphics folder
# ----------test for ONE COUNTRY----------
# start with one Year
# explanatory variable = GDP, response = vaccine rate

# we need to create an amalgamate dataset with 3 columns
# First column will be a combo year and country EXAMPLE(AUT15)
# Second column will be child vax rates Example (89)
# Third column will be GDP Example (40000000)


#rs stands for results storage!
dataset<-read.csv(file=paste(path.clean,"Final Dataset.csv",sep="/"))
#dataset$value.x is GDP
#datset$value.y is Child Vax rates

#WHAT FOLLOWS WAS OUR INITIAL ATTEMPT AT BUILDING A LOOP
library(ggplot2)
rs<-rep(NA, length(dataset$X))
rs$results<-NA
i <- 8

model.t<-lm(dataset$Value.y[i]~dataset$Value.x[i],data=dataset)
rs[i]<-model.t$coefficients[1]




pdf(file=paste(path.fingraph,"/", dataset$TIME[i],".pdf",sep=""))
ggplot(dataset,aes(x=dataset$TIME,y=rs[i]))+
  geom_point()
dev.off()
?ggplot
#}
?lm
pdf(file=paste(path.fingraph,"/", dataset$LOCATION[i],dataset$TIME[i],".pdf",sep=""))
plot(dataset$Value.x~dataset$Value.y, main = "TEST", las = 1,
     pch = 16, xlab = "TIME", ylab = "Linear Regression Coeffecient")
dev.off()

######-----------------------EDIT THIS BITS------------------------------------
 # if statement. Returns TRUE or FALSE. If TRUE it will run the code between {}
 #need to create a new object that is the years of the datasets

 unique.years<- unique(dataset$TIME)

 # in case of A
#####------ALMOST FUNCTIONING LOOP--------#########

#we have decided we actually need two counters to be involved, one following along with the data set
#and the other following along with the unique years to create the correct graphs
 for(i in 1:length(dataset$X)){
 for(ctr in 1:length(unique.years)){
 if(dataset$TIME[i] == unique.years[ctr]){
  graph.temp<-subset(dataset,subset = TIME==unique.years[ctr])
  pdf(file=paste(path.fingraph,"/",dataset$TIME[i],".pdf",sep=""))
  plot(graph.temp$Value.y,graph.temp$Value.x,main=unique.years[ctr],xlab="%of Children Vaccinated",ylab= "GDP in USD")}
dev.off()
   }}

  output.file.names<- unique.years}
 if(file.exists(output.file.names[i]) == FALSE)
    write.csv(paste(path.clean,"/",output.file.names[ctr],".csv",sep=""))
  }
            #  }
 ?file.exists
 #----------------------Create Graph test--------------------------------
model.t <- lm(dataset[, Value.x] ~ dataset[, Value.y]
summary(model.t)

plot(dataset$Value.x, dataset$Value.y)


# new plan!
# subset data by year and send to clean folder
# run model off of cleaned sorted
sort(dataset$year)
write.csv(paste(path.clean,"/",output.file.names[ctr],".csv",sep=""))



 plot(dataset$Value.x, dataset$Value.y, group=dataset$TIME)


 #---------attempt to merge sets-----------
#(seen in bleached data document)