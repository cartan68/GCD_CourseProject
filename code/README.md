# Project for 'Getting and Cleaning Data'

## Background
This project is based around the accelerometer data provided by the following authors:

>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The accelerometer data is spread across several files. The purpose of this exercise is to download the data, clean and merge the appropriate data files, select only the mean and standard deviation measures, and create both a tidy data file and a tidy summary of the data file.

## Data Used
Within the UCI HAR Dataset, teh following files are used:
- activity_labels.txt: provides labels for the associated activities identified in the files 'y_train.txt' and 'y_test.txt'
- features.txt: provides the variable names for each column in the data files 'x_train.txt' and 'x_test.txt'
- ./train/x_train.txt: provides the training portion of the data set
- ./train/y_train.txt: provides the activity identifiers associated with each observation of the x_train.txt data set
- ./train/subject_train.txt: provides the participant identifier associated with each observation of the x_train.txt data set
- ./test/x_test.txt: provides the testing portion of the data set
- ./test/y_test.txt: provides the activity identifiers associated with each observation of the 'x_test.txt' data set
- ./test/subject_test.txt: provides the participant identifier associated with each observation of the 'x_test.txt' data set

## Process
1. For the 'x_train' and 'x_test' data sets, the variable names are added using the 'features.txt' file contents. Further, the variable names are adjusted to make them a bit more tidy.
2. The data is filtered so that only the 'mean' and 'std' variables (columns) are kept.
3. Additional columns for the subject and activity are added to the data set.
4. The data set is saved as 'activityData.txt' for future processing.
5. A summary data set is created that calculates the mean for each variable for each activity and subject. This summary data set is saved as 'activitySummary.txt' for future processing.