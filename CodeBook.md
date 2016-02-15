---
title: "Codebook.md"
author: "nrabazano"
date: "2016-14-02"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


###Collection of the raw data
Data was collected from the accelerometers from the Samsung Galaxy S smartphone and was obtained from The UCI Machine Learning Repository 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

###Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

##Creating the tidy datafile

###Guide to create the tidy data file

1. Dowload the data from source.
2. Merge the training and the test sets to create one data set.
3. Extract only the measurements on the mean and standard deviation for each measurement.
4. Use descriptive activity names to name the activities in the data set.
5. Appropriately label the data set with descriptive variable names.
6. From the previous data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.

###Cleaning of the data
The script `run_analysis.R` performs the 5 steps described in the course project's instruccions to get the tidy data.

1. Files having the same number of columns and referring to the same entities are merged to get only one data set.
2. Only those columns with the mean and standard deviation measures are taken from the whole dataset and they are given the correct names, taken from features.txt.
3. Activity id's with values 1:6 are substituted with the activity names and IDs from activity_labels.txt.
4. Columns names are corrected.
5. Generate a new dataset with all the average measures for each subject and activity type.


##Description of the variables in the tiny_data.txt file
General description of the file including:

### - Dimensions of the dataset: 
* 180 observations of 81 columns.

### - Summary of the data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
* Features are normalized and bounded within [-1,1].
* Mean: Mean value
* Std: Standard deviation
* Prefix 't' to denote time
* The 'f' to indicate frequency domain signals

### - Variables present in the dataset

*`subject `
*`activity `
*`tBodyAccMeanX `
*`tBodyAccMeanY `
*`tBodyAccMeanZ `
*`tBodyAccStdX `
*`tBodyAccStdY `
*`tBodyAccStdZ `
*`tGravityAccMeanX `
*`tGravityAccMeanY `
*`tGravityAccMeanZ `
*`tGravityAccStdX `
*`tGravityAccStdY `
*`tGravityAccStdZ `
*`tBodyAccJerkMeanX `
*`tBodyAccJerkMeanY `
*`tBodyAccJerkMeanZ `
*`tBodyAccJerkStdX `
*`tBodyAccJerkStdY `
*`tBodyAccJerkStdZ `
*`tBodyGyroMeanX `
*`tBodyGyroMeanY `
*`tBodyGyroMeanZ `
*`tBodyGyroStdX `
*`tBodyGyroStdY `
*`tBodyGyroStdZ `
*`tBodyGyroJerkMeanX `
*`tBodyGyroJerkMeanY `
*`tBodyGyroJerkMeanZ `
*`tBodyGyroJerkStdX `
*`tBodyGyroJerkStdY `
*`tBodyGyroJerkStdZ `
*`tBodyAccMagMean `
*`tBodyAccMagStd `
*`tGravityAccMagMean `
*`tGravityAccMagStd `
*`tBodyAccJerkMagMean `
*`tBodyAccJerkMagStd `
*`tBodyGyroMagMean `
*`tBodyGyroMagStd `
*`tBodyGyroJerkMagMean `
*`tBodyGyroJerkMagStd `
*`fBodyAccMeanX `
*`fBodyAccMeanY `
*`fBodyAccMeanZ `
*`fBodyAccStdX `
*`fBodyAccStdY `
*`fBodyAccStdZ `
*`fBodyAccMeanFreqX `
*`fBodyAccMeanFreqY `
*`fBodyAccMeanFreqZ `
*`fBodyAccJerkMeanX `
*`fBodyAccJerkMeanY `
*`fBodyAccJerkMeanZ `
*`fBodyAccJerkStdX `
*`fBodyAccJerkStdY `
*`fBodyAccJerkStdZ `
*`fBodyAccJerkMeanFreqX `
*`fBodyAccJerkMeanFreqY `
*`fBodyAccJerkMeanFreqZ `
*`fBodyGyroMeanX `
*`fBodyGyroMeanY `
*`fBodyGyroMeanZ `
*`fBodyGyroStdX `
*`fBodyGyroStdY `
*`fBodyGyroStdZ `
*`fBodyGyroMeanFreqX `
*`fBodyGyroMeanFreqY `
*`fBodyGyroMeanFreqZ `
*`fBodyAccMagMean `
*`fBodyAccMagStd `
*`fBodyAccMagMeanFreq `
*`fBodyBodyAccJerkMagMean `
*`fBodyBodyAccJerkMagStd `
*`fBodyBodyAccJerkMagMeanFreq `
*`fBodyBodyGyroMagMean `
*`fBodyBodyGyroMagStd `
*`fBodyBodyGyroMagMeanFreq `
*`fBodyBodyGyroJerkMagMean `
*`fBodyBodyGyroJerkMagStd `
*`fBodyBodyGyroJerkMagMeanFreq`

### Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

##Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

