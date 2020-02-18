#potential analysis
#first attempt at a for loop to create:
#1 csv files of the data we compare (each country)
#2 graphs of the data we compare (each country)


#Visualizing data!

GDP$value2<-(as.factor(GDP$value))

# Cleaning GDP data
  library(dplyr)
getwd()
GDP <- read.csv("Raw Data/GDP_15-18.csv", na.strings = " ", stringsAsFactors = FALSE)
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
unique(GDP$LOCATION)



#Same for Vaccine Data


# woo! send cleaned small file to the clean folder
write.csv(child.clean.small, file = paste(path.clean, "Child.Vac_Clean_2015_2018", sep = "/"))

# make a test plot to visualize this cleaned up data
# plot time and vaccination percent
plot(child.clean.small$TIME, child.clean.small$Value, pch =16, las = 1,
     xlab = "Year", ylab = "Child Vaccination Rate",
     main = "Child Vaccination Rates in 2015-2018", ylim = c(0,100))
# save and send to the maybe figs folder

pdf(paste(path.maybefigs,"Child Vaccines global 2015-18.pdf",sep="/"))
plot(child.clean.small$TIME, child.clean.small$Value, pch =16, las = 1,
     xlab = "Year", ylab = "Child Vaccination Rate",
     main = "Child Vaccination Rates in 2015-2018", ylim = c(0,100))


dev.off()





#First attempt at FOR LOOP!!!
# build basic function for one country
# want to create a linear regression of GDP and vaccination rates over time for
# one country to START
# graph these results and save coefficients

for(i in nrow())
# lol no we can't
# try again tomorrow!