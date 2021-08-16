## **********************************************
##
## Script: run_analysis.R
## Author: Brian Crilly
## Date:   15 August 2021
##
## Description:
##   This script downloads accelerometer data from the web, cleans the data,
##   and prepares it it a tidy format for later processing.
##
## **********************************************

library(dplyr)

# Establish a data repository and output directory
if (!file.exists("data")) {
  dir.create("data")
}

if (!file.exists("output")) {
  dir.create("output")
}

# Download the data to the data repository
fileUrl <- paste0("https://d396qusza40orc.cloudfront.net/",
                  "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
download.file(fileUrl, destfile = "./data/accelData.zip", method = "curl")
dateDownloaded <- date()
write(dateDownloaded, file = "./output/dateDownloaded.txt")

# Unzip the data files
unzip("./data/accelData.zip", exdir = "./data/")

## Read in the activity data

# Get the variable names and activity labels"
varNames <- read.table("./data/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

readActivityData <- function(dataSubset) {
  dataFile <- paste0("./data/UCI HAR Dataset/", dataSubset,
                     "/X_", dataSubset, ".txt")
  x_data <- read.table(dataFile)

  # Label the variables
  names(x_data) <- varNames[ , 2]

  # Filter out only the mean and standard deviation data.
  x_data <- x_data[ , grep("-(mean|std)\\(\\)", names(x_data))]

  # Clean up the variable names
  names(x_data) <- tolower(gsub("^t|-|\\(\\)", "", names(x_data)))

  # Read in and append the subject and activity data lists
  dataFile <- paste0("./data/UCI HAR Dataset/", dataSubset,
                     "/subject_", dataSubset, ".txt")
  subject <- read.table(dataFile)
  names(subject) <- "subject"

  dataFile <- paste0("./data/UCI HAR Dataset/", dataSubset,
                     "/Y_", dataSubset, ".txt")
  y_data <- read.table(dataFile)
  activity <- cut(y_data[ , 1], nrow(activityLabels),
                  labels = activityLabels[ , 2])

  return(cbind(subject, activity, x_data))
}

train_data <- readActivityData("train")
test_data <- readActivityData("test")

activity_data <- rbind(train_data, test_data)

activity_groups <- group_by(activity_data, activity, subject)
activity_summary <- summarize_all(activity_groups, mean, na.rm = TRUE)

# Save the data to a file for later use
write.csv(activity_data, "./output/activityData.csv")
write.csv(activity_summary, "./output/activitySummary.csv")

# Clean up workspace
rm(list = ls())
