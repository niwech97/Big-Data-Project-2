# Cleaning Vaccine data
#
#
#
# 
# import raw child vaccine rate from 2015-2018
# send clean files to clean folder
R.version.string
#"R version 3.6.2 (2019-12-12)"
# Library-------
library(dplyr)

#Clean?-------

# import data set for vaccine rate from 2015-2018 
#from computer to correct repository
Child.VacRate2015.2018 <- read.csv("Raw Data/Child.VacRate2015-2018.csv")
#quick visualization
View(Child.VacRate2015.2018)

#send to raw data folder 
write.csv(Child.VacRate2015.2018, file = paste(path.rd, "Child.Vac_Raw_2015_2018", sep = "/"))


# clean data set 
# look at data!
# decide what needs to be kicked out
str(Child.VacRate2015.2018)
# we are only interested in location, time, and value (which is the rate of vaccination)
# so get rid of INDICATOR, SUBJECT, MEASURE, FREQUENCY, Flag.codes
child.clean.small <- select(Child.VacRate2015.2018, -c("INDICATOR", "SUBJECT", "MEASURE", "FREQUENCY", "Flag.Codes"))
str(child.clean.small)

# woo! send cleaned small file to the clean folder
write.csv(child.clean.small, file = paste(path.clean, "Child.Vac_Clean_2015_2018", sep = "/"))


