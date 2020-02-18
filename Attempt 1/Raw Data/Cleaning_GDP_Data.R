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
