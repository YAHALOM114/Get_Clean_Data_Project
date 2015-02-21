		Code Book for "Getting and Cleaning Data" Course Project
 
Input data

The input data for this project was taken from the data collected in a project named "Human Activity Recognition Using Smartphones Dataset" by University degli Studi di Genova in Italy.
The experiments in that project have been carried out with a group of 30 volunteers. Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). They captured 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data

I used the following files as an input data:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

Process

The retrieved data was merged into one big set ("test data" and "training data" together) of data. Then I extracted only the measurements on the "mean" and "standard deviation", filtering out all the rest. This partial data was organized and summarized into a tidy data set (the long version) which is the output of this project
Output data
The output data includes one table ("tidydataset.csv") that includes 4 variables (columns) and 180 rows. The following table is a description of the 4 variables.

"1" "subject"	numeric id [1 to 30] for each volunteer participated in original experiments
"2" "activity"	Textual description of the type of activity [1 of 6 types] the volunteer performed 			while the measurements were recorded.
"3" "measure"	Textual description of the specific physical entity [1 of 79] that was measured and 			recorded. (details in the flowing table)
"4" "mean"	A number which is the mean (average) of all the data recorded and normalized [between 			-1 and 1] for every unique combination of measurement, activity and volunteer.

"measure" variable description

The 79 types textual descriptions of the specific physical entity that are shown in the following table has a special template as follows:
t or f (1st letter) = 	't' stands for time recorded data, 'f' stands for data calculated using Fast 		      		Fourier Transform.
BodyAcc = 		body acceleration [physical entity]
BodyGyro = 		body angular velocity [physical entity]
mean or std = 		mean or standard deviation of the data recorded
jerk = 			derived Jerk Signals
X, Y, or Z (last letter) = the direction (axis) in which the data of the physical entity was recorded.

"1" "tBodyAccmeanX"
"2" "tBodyAccmeanY"
"3" "tBodyAccmeanZ"
"4" "tGravityAccmeanX"
"5" "tGravityAccmeanY"
"6" "tGravityAccmeanZ"
"7" "tBodyAccJerkmeanX"
"8" "tBodyAccJerkmeanY"
"9" "tBodyAccJerkmeanZ"
"10" "tBodyGyromeanX"
"11" "tBodyGyromeanY"
"12" "tBodyGyromeanZ"
"13" "tBodyGyroJerkmeanX"
"14" "tBodyGyroJerkmeanY"
"15" "tBodyGyroJerkmeanZ"
"16" "tBodyAccMagmean"
"17" "tGravityAccMagmean"
"18" "tBodyAccJerkMagmean"
"19" "tBodyGyroMagmean"
"20" "tBodyGyroJerkMagmean"
"21" "fBodyAccmeanX"
"22" "fBodyAccmeanY"
"23" "fBodyAccmeanZ"
"24" "fBodyAccmeanFreqX"
"25" "fBodyAccmeanFreqY"
"26" "fBodyAccmeanFreqZ"
"27" "fBodyAccJerkmeanX"
"28" "fBodyAccJerkmeanY"
"29" "fBodyAccJerkmeanZ"
"30" "fBodyAccJerkmeanFreqX"
"31" "fBodyAccJerkmeanFreqY"
"32" "fBodyAccJerkmeanFreqZ"
"33" "fBodyGyromeanX"
"34" "fBodyGyromeanY"
"35" "fBodyGyromeanZ"
"36" "fBodyGyromeanFreqX"
"37" "fBodyGyromeanFreqY"
"38" "fBodyGyromeanFreqZ"
"39" "fBodyAccMagmean"
"40" "fBodyAccMagmeanFreq"
"41" "fBodyBodyAccJerkMagmean"
"42" "fBodyBodyAccJerkMagmeanFreq"
"43" "fBodyBodyGyroMagmean"
"44" "fBodyBodyGyroMagmeanFreq"
"45" "fBodyBodyGyroJerkMagmean"
"46" "fBodyBodyGyroJerkMagmeanFreq"
"47" "tBodyAccstdX"
"48" "tBodyAccstdY"
"49" "tBodyAccstdZ"
"50" "tGravityAccstdX"
"51" "tGravityAccstdY"
"52" "tGravityAccstdZ"
"53" "tBodyAccJerkstdX"
"54" "tBodyAccJerkstdY"
"55" "tBodyAccJerkstdZ"
"56" "tBodyGyrostdX"
"57" "tBodyGyrostdY"
"58" "tBodyGyrostdZ"
"59" "tBodyGyroJerkstdX"
"60" "tBodyGyroJerkstdY"
"61" "tBodyGyroJerkstdZ"
"62" "tBodyAccMagstd"
"63" "tGravityAccMagstd"
"64" "tBodyAccJerkMagstd"
"65" "tBodyGyroMagstd"
"66" "tBodyGyroJerkMagstd"
"67" "fBodyAccstdX"
"68" "fBodyAccstdY"
"69" "fBodyAccstdZ"
"70" "fBodyAccJerkstdX"
"71" "fBodyAccJerkstdY"
"72" "fBodyAccJerkstdZ"
"73" "fBodyGyrostdX"
"74" "fBodyGyrostdY"
"75" "fBodyGyrostdZ"
"76" "fBodyAccMagstd"
"77" "fBodyBodyAccJerkMagstd"
"78" "fBodyBodyGyroMagstd"
"79" "fBodyBodyGyroJerkMagstd"

End oF File


