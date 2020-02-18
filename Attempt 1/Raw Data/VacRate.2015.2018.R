#
#
#
#
# 
# import raw child vaccine rate from 2015-2018
# send clean files to clean folder
R.version.string
#"R version 3.6.2 (2019-12-12)"
# lib
library(dplyr)


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



# import data set for vaccine rate from 2015-2018
Child.VacRate2015.2018 <- read.csv("Raw Data/Child.VacRate2015-2018.csv")
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


