library(plyr); library(dplyr); library(tidyr) #loading reqired R packages
testdata <-read.table("X_test.txt") #reading 'test' data set
traindata <-read.table("X_train.txt") #reading 'training' data set
finaldata<-tbl_df(rbind(testdata,traindata)) # Merging two data sets
rm(testdata); rm(traindata)#; rm(alldata) # removing large old data sets

features <-read.table("features.txt")
meanfeature<-setdiff(grep("mean", features[,2]), grep("freq", features[,2]))
stdfeature<-setdiff(grep("std", features[,2]), grep("freq", features[,2]))
ms<-c(meanfeature,stdfeature) ## creating vector of all relevant ('mean' & 'std') indices
finaldata<- select(finaldata,ms) #selecting only relevant data columns
labels<- features[ms,2] # creating vector of relevant labels
colnames(finaldata)<- labels #assining labels to columns in data set

ytrain <-read.table("y_train.txt")
ytest <-read.table("y_test.txt")
subjtest <-read.table("subject_test.txt")
subjtrain <-read.table("subject_train.txt")
subject <- rbind(subjtest, subjtrain) # creating full subjects vector

activtype<- read.table("activity_labels.txt")
colnames(activtype) <- c("V1","activity") ##modify column names
train_activity<- join(activtype, ytrain,type="right")[2]
test_activity<- join(activtype, ytest,type="right")[2]
activity<- rbind(test_activity, train_activity) # creating full activity vector
finaldata<- cbind(activity, finaldata)#adding activity column to the right side
finaldata <- cbind(subject,finaldata)#adding subjects column to the right side
colnames(finaldata)[1] <- "subject"
colnames(finaldata)<- c(make.names(names(finaldata))) #fixing labels 1st phase
colnames(finaldata)<- c(gsub('\\.', '', names(finaldata))) #fixing labels 2nd phase
tdwide <- ddply(finaldata, c('subject','activity'), numcolwise(mean)) #wide tidy data set
tdlong <-gather(tdwide, subject, activity) #long tidy data set
colnames(tdlong) <- c("subject","activity", "measure", "mean") #modifying lables in long set
write.table(tdlong,file="tidydataset.txt", row.name=FALSE) #saving long tidy data file