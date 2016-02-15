## Getting and Cleaning Data Coursera Project
## Run_analysis script

## Download and unzip file in the working directory
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"
download.file(file_url, filename, method="curl")
unzip(filename) 

## set wd to work for project
setwd("./UCI HAR Dataset")

#########################################################################################
## 1.Merge training and test sets.
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
x_data <- rbind(x_train, x_test)
## Test Dataset
y_data <- rbind(y_train, y_test)
## Subject Dataser
subject_data <- rbind(subject_train, subject_test)


#########################################################################################
## 2.Extract only the measurements on the mean and standard deviation for each measurement. 
#########################################################################################

## Get column names from "features.txt"
features_names <- read.table("features.txt")
features_names[,2] <- as.character(features_names[,2])

##Get columns for mean and standard deviation measuments
features_req <- grep(".*mean.*|.*std.*", features_names[,2])

## Subset desired columns from data
UCI_HDC_data_req <- x_data[, features_req]

## Assign correct names
names(UCI_HDC_data_req) <- features_names[features_req, 2]

#########################################################################################
## 3.Uses descriptive activity names to name the activities in the data set
#########################################################################################
## Get activity labels
activities <- read.table("activity_labels.txt")
names(activities) <- c("activity_id","activity_name")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Assing correct column name
names(y_data) <- "activity"


#########################################################################################
## 4.Appropriately labels the data set with descriptive variable names. 
#########################################################################################

# Assing correct column name
names(subject_data) <- "subject"

## Cleaning up variables names
colnames(UCI_HDC_data_req) <- gsub('-mean', 'Mean', colnames(UCI_HDC_data_req))
colnames(UCI_HDC_data_req) <- gsub('-std', 'Std', colnames(UCI_HDC_data_req))
colnames(UCI_HDC_data_req) <- gsub('[-()]', '', colnames(UCI_HDC_data_req))

# bind all the data in a single data set
UCI_HDC_data_req_bind <- cbind(UCI_HDC_data_req, y_data, subject_data)

#########################################################################################
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
#########################################################################################


## Use plry library to aplly ddply to calculate the average of each variable for each activity and each subject
library(plyr)
tidy_data <- ddply(UCI_HDC_data_req_bind, .(subject, activity), function(x) colMeans(x[, 1:79]))

## Export tidy data
write.table(tidy_data, "tidy_data.txt", row.name=FALSE, quote = FALSE)