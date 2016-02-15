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
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of 
 descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

