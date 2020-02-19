# Main R script
# Big Data Challenge: Measles Vaccination rates and GDP
# created by Nick, Anna, Sam
# Feb 2020


# --------------Overview of workflow:-------------------------
# 1) create directory
# 2)read in the raw data from csv files
# 3) clean them into new objects
# 4) show our loop function (#out so that you only see it but it does not run
#            because it has already run and the results are in the correct folders)
# 5) perform the relevant analysis on our dataset 

R.version.string
#"R version 3.6.2 (2019-12-12)"
#-----------------------------------------------------
#---------- Index-------------------------------------
#------------------------------------------------------
# libraries needed
# create working directory 
# main script
# clean data 
# visualized global vaccination rates
# relevant analysis
    # part a)
    # part b)

#--------------------------------------------------
#-----------Libraries needed---------------------------
#----------------------------------------------
library(dplyr)
library(ggplot2)


#---------------------------------------------------------
#------------Created working directory-----------------
#-------------------------------------------------------
list.files()

#setup working directory pathway
working.dir <- getwd()

#store future file names in an object... These are base folder names
output.folder.names <- c("Clean Folder", "Figures of interest",
                         "Raw Data","Final R scripts","Potential Analysis",
                         "Relevant Analysis","Relevant Graphics","Useful R scripts")

# and make the folders if they don't exit yet.
for(i in 1:length(output.folder.names))
  if(file.exists(output.folder.names[i]) == FALSE)
    dir.create(output.folder.names[i])
#these are the pathways which are necessary to send graphs to the folders.
path.clean <- paste(working.dir, "/", output.folder.names[1], "/", sep = "")
path.maybefigs<- paste(working.dir, "/", output.folder.names[2], "/", sep = "")
path.rd<- paste(working.dir, "/", output.folder.names[3], "/", sep = "")
path.finalR<- paste(working.dir, "/", output.folder.names[4], "/", sep = "")
path.potan<- paste(working.dir, "/", output.folder.names[5], "/", sep = "")
path.finan<- paste(working.dir, "/", output.folder.names[6], "/", sep = "")
path.fingraph<- paste(working.dir, "/", output.folder.names[7], "/", sep = "")
path.extr<- paste(working.dir, "/", output.folder.names[8], "/", sep = "")


#--------------------------------------------------------------
#----------Main script------------------------------------
#-----------------------------------------------------------
#Reading in raw data measels vaccination rate file
# call this file m and make an object
m<-read.csv(file=paste(path.rd,"/","Measles_ALL.csv",sep=""))


#-----------------------------------------------------------
#-----------Cleaning data------------------------------
#-----------------------------------------------
# remove all columns in the data set that contain variables NOT of interest
m<-select(m, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                "FREQUENCY"))


#---------------------------------------------------
#--------------Visualize data----------------------
#------------------------------------------------
# create a plot of the global vaccination rate over time from 
# 1980-2018

plot(m$Value~m$TIME,xlab="Year",ylab="Vaccinated Children(%)",
     main="Global Child Vaccination Rate 1980-2018",
     las=1, pch=16,col="black")
# save as pdf and send to figures of interest folder!
pdf(file=paste(path.maybefigs,"First Visualization.pdf",sep="/"))
plot(m$Value~m$TIME,xlab="Year",ylab="Vaccinated Children(%)",
     main="Global Child Vaccination Rate 1980-2018",
     las=1, pch=16,col="black")
dev.off()

#------------Relenvant Analysis part A---------------------
# now, we want to create a for loop 
# this fucntion will sereperate our data set by country
# then it will plot the vaccination rate over time per country
# all at once!!!


# first, create an object that has one row for each country
# that will be used in our loop
# use the unique function to select for each country only once
# this will allow for us to create different plots for each country
unique.country<-unique(m$LOCATION)  


# create a nested loop structure to make plots of vaccine rate/time in 
# every country at once!

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
# YAY! now we have graphs of child vaccination rates from 1980-2018 per country


# next, we want to perform a linear regression 
# to determine if there is a relationship between vaccine rate and time 
# in each country

#--------------------------------------------------------------------
#----------------------------------------------------------------------
#-------Relevant Analysis Part B)--------------------------------------------
#----------------------------------------------------------------------
# now we want to perform a linear regression to determine if there is a 
# between vaccination rates and time in each country (unique.country)
for(i in 1:length(unique.country)){  
  #creating smaller datasets organized by countries
  data.temp<-subset(m,subset = LOCATION ==unique.country[i])
  model.t<-lm(data.temp$Value~data.temp$TIME)
  t[i]<- model.t$coefficients[1]
}#closing loop

# in order to store the coefficients of each of the 44 linear regressions
# create a dataframe in which the loop can store the output of each country
d.all <- cbind.data.frame(countries = unique.country, corr.coef = t)
# AMAZING!
# now create a table and save all of the results in the clean data
# folder
write.csv(d.all,paste(path.clean,"Corr.Coef by Country.csv",sep="/"))

#-----------------------------------------------------------------------
#---------File sources------------------------------------------
#--------------------------------------------------------
# all folder names so everything can be run directly from this script

source("Raw Data")
source("Clean Folder")
source("Relevant Graphics")
source("Relevant Analysis")