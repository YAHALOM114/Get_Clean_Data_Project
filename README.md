The script includes 31 lines. The functionality of the script and each line is detailed in the following text: Each line of script follows with explanation that starts with the hash sign (#).
Note: This script starts with the assumption that the Samsung data files are available in the same working directory where the script is stored. (NOT  in an unzipped UCI HAR Dataset folder).

1.	library(plyr); library(dplyr); library(tidyr) 	#loading reqired R packages
2.	testdata <-read.table("X_test.txt")            	#reading 'test' data set (part 1)
3.	traindata <-read.table("X_train.txt") 	        #reading 'training' data set (part 2)
4.	finaldata<-tbl_df(rbind(testdata,traindata)) 	  # merging the two data sets ('training' data following 'test'                                                         data).
5.	rm(testdata); rm(traindata)#; rm(alldata)	      # Cleaning work space by removing large old data sets 
6.	features <-read.table("features.txt")	          #reading entire features list
7.	meanfeature<-setdiff(grep("mean", features[,2]), grep("freq", features[,2]))	  #extracting list of features                                                                                          relevant to data "mean"
8.	stdfeature<-setdiff(grep("std", features[,2]), grep("freq", features[,2]))	    #extracting list of features                                                                                          relevant to data "standard                                                                                            deviation" (std)
9.	ms<-c(meanfeature,stdfeature) 	                #combining the 2 extracted features lists into single list
10.	finaldata<- select(finaldata,ms) 	              #selecting out of the merged data set only relevant data columns                                                      ('mean' and 'std' columns)
11.	labels<- features[ms,2] 	                      # creating vector of relevant labels
12.	colnames(finaldata)<- labels 	                  #assigning labels to columns in data set
13.	ytrain <-read.table("y_train.txt")	            #reading the 'training' part labels
14.	ytest <-read.table("y_test.txt")	              #reading the 'test' part labels
15.	subjtest <-read.table("subject_test.txt")	      #reading list of 'test' volunteers 
16.	subjtrain <-read.table("subject_train.txt")	    #reading list of 'training' volunteers
17.	subject <- rbind(subjtest, subjtrain) 	        #creating full volunteers vector
18.	activtype<- read.table("activity_labels.txt")	  #reading list of activity names
19.	colnames(activtype) <- c("V1","activity") 	    #modify column names
20.	train_activity<- join(activtype, ytrain,type="right")[2]	    #creating list of named 'training' activities
21.	test_activity<- join(activtype, ytest,type="right")[2]	      #creating list of named 'test' activities
22.	activity<- rbind(test_activity, train_activity)               # creating full activity vector	Creating one combined list of named activities ('training' follows 'test')
23.	finaldata<- cbind(activity, finaldata)	        #adding the 'activity' column to the right side
24.	finaldata <- cbind(subject,finaldata)	          #adding 'subjects' (volunteers) column to the right side
25.	colnames(finaldata)[1] <- "subject"	            #updating added column name
26.	colnames(finaldata)<- c(make.names(names(finaldata))) 	                  #fixing the labels - 1st phase (removing                                                                               unacceptable characters)
27.	colnames(finaldata)<- c(gsub('\\.', '', names(finaldata))) 	              #fixing labels - 2nd phase (removing                                                                                  dots)
28.	tdwide <- ddply(finaldata, c('subject','activity'), numcolwise(mean)) 	  #creating the 'wide version' of the tidy                                                                               data set (180X81)
29.	tdlong <-gather(tdwide, subject, activity) 	                    #creating the 'long version' of the tidy data set                                                                     (4X14220)
30.	colnames(tdlong) <- c("subject","activity", "measure", "mean") 	#modifying the labels of the 'long' tidy data set
31.	write.table(tdlong,file="tidydataset.txt", row.name=FALSE)	    #saving the 'long' tidy data set in a text file
