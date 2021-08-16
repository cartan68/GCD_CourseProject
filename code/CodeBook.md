# Downloading and cleaning data

## Setup
- all data are downloaded from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and stored in the subdirectory 'data'. It is then unzipped.
- data are extracted from the following files:
-- activity_labels.txt
-- features.txt
-- ./train/x_train.txt
-- ./train/y_train.txt
-- ./train/subject_train.txt
-- ./test/x_test.txt
-- ./test/y_test.txt
-- ./test/subject_test.txt
- the primary data are contained in the 'x_train.txt' and 'x_test.txt' files. Variable names for these two files are found in the 'features.txt' file. These variable names are added to the data set.
- the data are filtered based on variable names to retain only variables for which the variable names contain either '-mean()' or '-std()'. These variable names identify variables that contain the mean and standard deviation calculations.
- variable names are cleaned up a bit to remove capital letters, the leading 't', and any non-alphanumeric characters.
- subject and activity identifiers are added to the data set based on the 'subject_train.txt', 'subject_test.txt', 'y_train.txt' and 'y_test.txt' files.
- the data set is saved in the 'output' directory as 'activityData.csv'.
- the data set is further summarized by calculating the mean for each variable across each activity and subject. This additional data set is saved in the 'output' directory as 'activitySummary.csv'.

## New Variable Names
The following is a list of the variable names in the original and new data sets.

### Subject Data
The subjects are identified in the first column of the output data sets with the variable name 'subject'. The subject id values are the same as found in the 'subject_train.txt' and 'subject_test.txt' files.

### Activity Data
The activity data is found in the second column of the output data sets with the variable name 'activity'. The activities are based on the data from the 'y_train.txt' and 'y_test.txt' files, and further use the activity names found in 'activity_labels.txt' rather than simply using the activity numbers.

### Other Variables
All other data is the same as the corresponding variables in the 'x_train.txt' and 'x_test.txt' files. The variable names are derived from the names found in 'features.txt'. The names are cleaned to do the following:
- remove the leading 't'
- change all letters to lower case
- remove all non-alphanumeric characters
Otherwise, the names remain essentially the same. Example variable name modifications can be found below.
| Before | After |
| tBodyAcc-mean()-X | bodyaccmeanx |
| tBodyAcc-std()-X | bodyaccstdx |
| tGravityAcc-mean()-Y | gravityaccmeany |
| tGravityAcc-std()-Y | gravityaccstdy |
| tBodyAccJerk-mean()-Z | bodyaccjerkmeanz |
| tBodyAccJerk-std()-Z | bodyaccjerkstdz |

## Summary Data
The data is further summarized and stored in the file 'activitySummary.csv' using the following steps:
- the data set is grouped by activity and subject.
- The mean function is then applied to all variables such that the summary retains the mean for each variable for each activity and each subject.