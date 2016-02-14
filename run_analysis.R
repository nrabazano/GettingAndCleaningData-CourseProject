# run_analysis script

## Download and unzip file in the working directory
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"
download.file(file_url, filename, method="curl")
unzip(filename) 

## set wd to work for project
setwd("./UCI HAR Dataset")

#########################################################################################
## 1.Merge training and test sets to create one data set
#########################################################################################

## Training Set
x_train <- read.table("./train/X_train.txt")
## Training Labels
y_train <- read.table("./train/y_train.txt")
## Training Subject
subject_train <- read.table("./train/subject_train.txt")

## Test Set
x_test <- read.table("./test/X_test.txt")
## Test Labels
y_test <- read.table("./test/y_test.txt")
## Test Subject
subject_test <- read.table("./test/subject_test.txt")

## Training Dataset
x_data <- cbind(subject_train, y_train, x_train)
## Test Dataset
y_data <- cbind(subject_test, y_test, x_test)

## Join Training and Test data in one dataset
UCI_HDC_data <- rbind(x_data, y_data)

#########################################################################################
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#########################################################################################

## Get column names for mean and standard deviation measuments from "features.txt"
features_names <- read.table("features.txt")
features_names[,2] <- as.character(features[,2])

features_req <- grep(".*mean.*|.*std.*", features_names[,2])
features_req_names <- features_names[features_req,2]

## Subset desired columns from data
UCI_HDC_data_req <- UCI_HDC_data[, features_req] 
names(UCI_HDC_data_req[3:563]) <- features_req_names

#########################################################################################
## 3.Uses descriptive activity names to name the activities in the data set
#########################################################################################
## Get activity labels
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"
names(UCI_HDC_data_req) <- features_req_names

#########################################################################################
## 4.Appropriately labels the data set with descriptive variable names. 
#########################################################################################

#########################################################################################
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
#########################################################################################