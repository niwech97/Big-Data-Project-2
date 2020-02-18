# Cleaning GDP data

#Libraries-------
  library(dplyr)

#Clean?--------
# first we read in the csv as an object 
GDP <- read.csv("GDP_15-18.csv", na.strings = " ", stringsAsFactors = FALSE)
#do a quick visualization
head(GDP)

# and remove the columns we dont want
GDP <- select(GDP, -c("SUBJECT", "INDICATOR", "MEASURE", "Flag.Codes", 
                      "FREQUENCY"))
# another quick check
head(GDP)
#save as .csv in clean data folder 

write.csv(GDP, file=paste(path.clean, 
                          "GDP_Clean_Data_2015_2018.csv", sep ="/" ) )
