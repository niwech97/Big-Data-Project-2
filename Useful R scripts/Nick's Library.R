#Library/template
#
#if any libraries are needed, label them at the top like the line below
#

#------USEFUL LIBRARIES-------
library(lsr)       #gives binomial tests and more
library(ggplot2)   #gives an alternative to base plots
library(readr)     #helps get data into global environment
library(tidyverse)

#Searching within the packages screen has also been very useful






#-----additonal resources------
http://www.sthda.com/english/wiki/wiki.php?title=chi-square-goodness-of-fit-test-in-r

https://www.zoology.ubc.ca/~schluter/R/index.html



#--------------------(data types)---------------(good way to make different sections)----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#This is where you would list data types in this file
rk<-read.csv("RoadKill.csv")       #need to load library(readr) before
m<-read.csv("mammals.csv",stringsAsFactors = FALSE)

#string as factors false always, but I have had better luck
#using the files screen in R to "import dataset" from an xcel file
#within my working directory


#----example functions---------------------(collapsability as well)-----------------
#this is where you would list
d<-rnorm(50,90,3)
hist(d)
shift,control,c adds #to the beginning of the line
#------------------------------------------------------------
#TO ASK QUESTIONS
#?functionyouwanttoknow
?rnorm                    #example

[]square brackets let you manipulate within an object
?data.frame

#
# TYPES OF OBJECTS --------
# lists:house with rooms and wardrobes in different rooms
# data frames:wardrobe different drawers within the wardrobe can have different data types
# factor
# Data frames are two dimensional, columns and rows



#---------list of useful functions---------
#firstly, to remind on how to use the functions
#use ? in front of any fuction and the r help page will
#remind you how to use that function and the order of
#relevant arguements as well as a general overview

#data manipulation/visualize--------
          m<-read.csv("mammals.csv",stringsAsFactors = FALSE)

x<-c(5,43,-42,65,1,-9,95,-24,63,-77)
#assign x to be a list of numbers (d,f,g,y)
#to get the 5th element within the object:
x[5]
#to get the first second and third element within the object:
x[1:3]
#to get the 3rd and 6th element:
x[c(3,6)]
#this tests if x is less than 0
x<0
#this returns all values less than 0 that are x
x[x<0]
#this returns the length number of the elements within the object that meet the parameters x<0
which(x<0)
#To change the value of an element of a vector/object:
x[5]<-0
x[10]<-33
x[c(2,6,10)]<-c(2,6,10)    #changing multiple at the same time



summary(m) #gives descriptive stats of numeric var
#gives class, mode and length for non-numeric
list.(files)      # Show all files in working directory
getwd()           #tells you where your working directory is in your files
head()            #shows the first 6 lines of each column
nrow()            #number of rows
ncol()            #number of columns
length()          #number of elements in the object
[] #allow you to manipulate within a data frame (example below)
length(mydata$Species[mydata$Island=="Jamaica"])
#this above line asks the length of my data species column that contains jamaica in the island column
#in other words it counts the species found on jamaica


#examples/alternative
head(m)       #to verify below
m[,2]         #same
m$status      #same because status is the second column

m[1:10,2]     #m[rows,columns] 1:10=1,2,3,4,5,6,7,8,9,10

y<-20:1
d<-1:20


#data restructuring------------
t()             #transpose columns to rows and vice versa
table(m$continent,m$status)      #make a table with m$continent column, by status rows (run to visualize)
as.numeric(x)   #forces x into numeric class
            bd<-read.csv("BirdWindowCrash.csv", stringsAsFactors=FALSE)
la<-filter(bd,angleDuringBirdCrash=="40 degrees")
#makes a new object `la` that is all of the
#data points that had 40 degrees in the angle column
na.rm=TRUE      #add this to make your function ignore NA's
mammals$logbm<-log10(mammals$mass.grams)
#assign a value/values to an object within a data.frame

#analysis---------------
sum()
mean(x)
median(x)
mode(x)
var()
sd()
#transposing is often useful with those

binom.test(60,1000,0.5)

          pd<-read.csv("PrairieDogMultipleMating.csv")
fisher.test(table(pd))
t.test()
chisq.test()


#HINT tapply allows you to do a test to multiple things at once
tapply(mammals$logbm,mammals$status,median,na.rm =TRUE)

#for these, making tables and sometimes transposing them is useful


#graphing----------

        #base R
          rk<-read.csv("RoadKill.csv")
plot(rk) #gives basic bar/scatter plot depending on data
          mammals<-m
barplot(table(mammals$continent),col = "red",space=0.2,cex.names=1.2)

?plot    #gives good information on manipulating tha plot
methods(plot)  #gives even more information on different plots

hist()   #gives basic histogram


            b<-read.csv("BeerGlassShape.csv")
boxplot(drinkingMinutes~glassShape,b)
#simple boxplot (response~explanatory)
         #mammals$logbm<-log10(mammals$mass.grams) #if not already loaded
qqnorm(mammals$logbm)
qqline(mammals$logbm)

ggplot(mammals,aes(x=status,y=logbm))+geom_violin(fill="red")+stat_summary(fun.y=mean,geom="point",color="black")+ggtitle("Violin Plot")+theme_classic()
#violin plots (width=number of data points for that value)


ggplot(mammals,aes(logbm))+geom_histogram()+facet_wrap(~status,ncol=1,scales="free_y")
#multiple histograms by means of facet_wrap(~categoryiwantthemsplitby,numberofcolumnsiwant)



        #ggplot
            dm<-read.csv("WalkingInCircles.csv")
ggplot(dm, aes(x=angle)) + geom_histogram(binwidth=1)
#above is a histogram from gg plots
#gg plots makes it very easy to mess with bindwidth and more



#Trouble Shooting----------------
#copy and paste the error message into google, often brings you to useful stackoverflow forums


#Directory tutorial-----------------
#start with a directory file
#start file with version#

R.version.string
#"R version 3.6.2 (2019-12-12)"


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

#to send things to specific files first create the thing you want to make
#couple of options
pdf()
csv()
#add the file name/directory information
#uses paste command
pdf(file=paste(path.clean,"filename.pdf",sep=""))
#then create the object you want to make
#example
plot(x,2x)

#and end with this command to tell R to turn its viewing device off
#this is because the viewing device makes the pdf viewing device mess up
dev.off()
