test.total <- merge(GDP15, MCR15, by=c("LOCATION", "TIME"))
head(test.total)
<- na.omit(test.total)

write.csv(test.total, file=paste(path.clean,"Final Dataset.csv",sep="/"))
