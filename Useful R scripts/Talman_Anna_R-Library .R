#R-Library Table of Contents 
#Getting started, lines 12-18
#How to deal with missing data, lines 21-24
#Data Frame, lines 27-38
#Graphics, lines 40-69
#Data Types, lines 73-88
#Descriptive Statistics, lines 90-122
#Making a Function (see ex. descrp.stat-mode, line 110-122)
#Statistical Test, lines 125-162


#To get started you may need to begin by installing a package and place it in 
#library, example below 
library(crayon)

#additionally you may need to load a data set in. This is denoted by read.csv, 
#example below 
prariedogs <- read.csv (("PrairieDogMultipleMating.csv"))


#Missing data poinnts is a pain in the neck and can give us false desriptive 
#statsics. To deal with this we can take care of this when loading the info
#we can use the code below in conjunction with read.csv  
na.strings = " ",stringsAsFactors = FALSE)


#Data Frames 
#let's practice data frames. First we will load data in 
prariedogs <- read.csv(("PrairieDogMultipleMating.csv") 
                       , na.strings = " ", stringsAsFactors = FALSE)
head(prariedogs)
str(prariedogs)
#to get a sense of the number of rows and collums we will use this code..
nrow(prariedogs)
ncol(prariedogs)
#to see if the row or column is first we can use this code 
prariedogs[1, 2]
# from this we can see the row is listed first and the column second 

#Graphics 

#R has the ability to make very nice figures. Listed are some of the types of 
#graphics than can be made in R, and how to manipulate the figrues. 

#code for a box plot we can use this code or the variations 
boxplot(varibale 1 (y-axis)~varibale 2 (x-axis), data = dataframe name)
boxplot(object)

#to change the width of a box in a boxplot you can use boxex 
boxplot(varibale 1 (y-axis)~varibale 2 (x-axis), data = dataframe name, 
        boxwex= numerical value)

#Frequency distributions are shown with the code below 
hist(dataset$variable)

#Colour of the figures can be changes. 
#To make a wes anderson colour themed graph, the code below can be used 
link{https://www.youtube.com/watch?v=caMgokYWboU}

wes_palette(color name, ie "FantasticFox1")
wes_palette( color name, color number, type = c("discrete" or continuous))
#Example...
hist(prariedogs$matingFrequency, col = wes_palette("FantasticFox1", 
                                                   3, type = "discrete"))

#to denote a point on graph use the argument use 
pch 


#the code las can change axis orientation, set equal to a numerical value



#Within R there are different types of data. 
#first there are vector, than can be denoted by the c() that is used when they 
#are being created. See the example below. There can be numerical, character 
#and logical vecotrs. Below is a numerical vector. 

vector <- c(3,1,4,1,5,9,2,6,5,3,5,8,9,7,9)


#another type of data that exsists within R is a vector. They are also denoted 
#by the c() argument. Factors distingush nomial data. Shown below 
gender <- c(rep("male",20), rep("female", 30)) 
gender <- factor(gender) 

#Dataframes are another great way to store data.Data frames can handle matricies 
#and in different data types, categroical, numerical, factor. The prariedogs.
#csv is an example of a data frame being stored. 

#Descriptive statistics can easily be solved within in r. 

#the example below will show one variable of a data frame having it's mean 
#calculated. 

mean(prariedogs$matingFrequency)

#the example below will show one variable of a data frame having it's standard 
# deviation is calculated. 

sd(prariedogs$matingFrequency)

#the example below will show one variable of a data frame having it's median 
#calculated.

median(prariedogs$matingFrequency)

#in order to find the mode, will we will continute to use the same dataframe 
#and variable. There is no mode function into r, but we can create our own...

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

v <- table(prariedogs$matingFrequency)

result <- getmode(v)
#the function above has our data set and the actions that it needs to preform. 
mode <- findmode(table(prariedogs$matingFrequency))

#print(mode) will revel the 
print(mode) 

#Statistical Tests within r 

#In order to explain this section, other data sets used in this class will need 
#to be loaded in order to not violate any assumptions of each test. 

#We will start with the Chi-Square, goodness-of-fit test and loading the 
#"BirdWindowCrash.csv" data set. 

birdwindow <- read.csv(("BirdWindowCrash.csv") , 
                       na.strings = " ", stringsAsFactors = FALSE)

#to do the chi-squared test the data must be table form.

X <- chisq.test(table(birdwindow)) 
#to see the results of the Chi-Squared test we can print X
print(X)

#moving on to the T-Test! The code for each type of t.test is very similiar, but 
#slightly different. 

#For a single t-test the code t.test and then the data frame.
salmon <- read.csv(("SalmonColor.csv") , 
                   na.strings = " ", stringsAsFactors = FALSE)
#we must now transform the variables.. 
log.salmon <- log10(salmon$skinColor)
#and are now able to perform the t-test. 
t.test(log.salmon)

#If the varience of the salmon data was not equal, we would be able to perform 
#a Welche's T-test, by seting the varience to be FALSE. 

t.test(log.salmon,variance=FALSE)

#Finally, if we were conducting a paired t-test, we would denote this by adding
#a paired=TRUE code to our t.test. While there isn't a data set to show this 
#it can be denoted by the code below. 

#t.test(dataframe, paired=TRUE)



