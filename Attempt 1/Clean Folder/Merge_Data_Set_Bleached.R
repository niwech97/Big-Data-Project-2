# we were worried it would be difficult to pull from two objects within a loop
# and we were also having issues with getting the objects to be the same length 
# to solve these issues we attempted a merge



test.total <- merge(GDP15, MCR15, by=c("LOCATION", "TIME"))
head(test.total)

# It worked! and additionally, it looks like we might be able to solve our length problem
# the data set looked great except it had a TON of NA data in it.

<- na.omit(test.total)
# we found this^^^function and it removed all of the rows with NA data
# now we had a functioning and cleaned dataset

# we saved this as a pdf in our clean data folder 
write.csv(test.total, file=paste(path.clean,"Final Dataset.csv",sep="/"))
