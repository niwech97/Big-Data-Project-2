#potential analysis 
#first attempt at a for loop to create:
#1 csv files of the data we compare (each country)
#2 graphs of the data we compare (each country)


#potential analysis
#first attempt at a for loop to create:
#1 csv files of the data we compare (each country)
#2 graphs of the data we compare (each country)


#Visualizing data!

GDP$value2<-(as.factor(GDP$value))

-# Cleaning GDP data
  library(dplyr)
GDP <- read.csv("GDP_15-18.csv", na.strings = " ", stringsAsFactors = FALSE)
head(GDP)
GDP <- select(GDP, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes",
                      "FREQUENCY"))

head(GDP)
#save as .csv in clean data folder

write.csv(GDP, file=paste(path.clean,
                          "GDP_Clean_Data_2015_2018.csv", sep ="/" ) )
#things are not going well
plot(GDP, mpg, main="Scatterplot Example",
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
head(GDP)


#take 2
ggplot(data = GDP , aes(x = "Time", y = Value, group = "LOCATION")) +
  theme_minimal() +
  geom_line()
#take 3
plot(GDP$TIME, GDP$Value)

#now try to make time a categroical variable because this plotting is going bad
GDPtime2<-(as.factor(GDP$TIME))

#try 3
plot(GDPtime2, GDP$Value, xlab="Time", ylab="GDP in USD", main="GDP of
     57 Countries Overtime")

pdf(file = paste(path.maybefigs, "Box_Plot_GDP_2015_2018.pdf", sep = "/"),
    width = 4, height = 4)
plot(GDPtime2, GDP$Value, xlab="Time", ylab="GDP in USD", main="GDP of
     57 Countries Overtime")
dev.off()

#now trying to compare data sets w sam 
unique(GDP$LOCATION)

