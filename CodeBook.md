# Code Book run_analysis.R

### Introduction

This document describes the variables, the data, and the work that I performed to clean up the data.

### The Data

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 

###In this work I use the following files:
========================================

'./UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

'./UCI HAR Dataset/features.txt': List of all features.

'./UCI HAR Dataset/test/X_test.txt': Test set.

'./UCI HAR Dataset/train/X_train.txt': Training set.

'./UCI HAR Dataset/test/y_test.txt': Test labels

'./UCI HAR Dataset/train/y_train.txt': Training labels.

'./UCI HAR Dataset/test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample in the test set. Its range is from 1 to 30. 

'./UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample in the training set. Its range is from 1 to 30. 



### The Variables

###For each record in the tidy data set it is provided:
=====================================================

- The activity label (variable activity_label). 
- An identifier of the subject who carried out the experiment (variable subject).
- The average of each variable -the mean and standard deviation for each measurement- for each activity and each subject:

tbodyacc_mean_x
tbodyacc_mean_y  
tbodyacc_mean_z  
tbodyacc_std_x 
tbodyacc_std_y  
tbodyacc_std_z 
tgravityacc_mean_x  
tgravityacc_mean_y  
tgravityacc_mean_z  
tgravityacc_std_x 
tgravityacc_std_y  
tgravityacc_std_z  
tbodyaccjerk_mean_x  
tbodyaccjerk_mean_y
tbodyaccjerk_mean_z  
tbodyaccjerk_std_x 
tbodyaccjerk_std_y
tbodyaccjerk_std_z  
tbodygyro_mean_x  
tbodygyro_mean_y  
tbodygyro_mean_z  
tbodygyro_std_x 
tbodygyro_std_y  
tbodygyro_std_z  
tbodygyrojerk_mean_x  
tbodygyrojerk_mean_y  
tbodygyrojerk_mean_z  
tbodygyrojerk_std_x  
tbodygyrojerk_std_y 
tbodygyrojerk_std_z  
tbodyaccmag_mean  
tbodyaccmag_std  
tgravityaccmag_mean  
tgravityaccmag_std  
tbodyaccjerkmag_mean  
tbodyaccjerkmag_std  
tbodygyromag_mean  
tbodygyromag_std  
tbodygyrojerkmag_mean  
tbodygyrojerkmag_std  
fbodyacc_mean_x  
fbodyacc_mean_y  
fbodyacc_mean_z
fbodyacc_std_x  
fbodyacc_std_y  
fbodyacc_std_z  
fbodyaccjerk_mean_x  
fbodyaccjerk_mean_y  
fbodyaccjerk_mean_z 
fbodyaccjerk_std_x 
fbodyaccjerk_std_y  
fbodyaccjerk_std_z 
fbodygyro_mean_x  
fbodygyro_mean_y 
fbodygyro_mean_z 
fbodygyro_std_x  
fbodygyro_std_y  
fbodygyro_std_z  
fbodyaccmag_mean 
fbodyaccmag_std 
fbodybodyaccjerkmag_mean  
fbodybodyaccjerkmag_std  
fbodybodygyromag_mean  
fbodybodygyromag_std 
fbodybodygyrojerkmag_mean  
fbodybodygyrojerkmag_std


### The work: script run_analysis.R

The code does the following:

#### Downloads the file: 

Downloads the given url, and unzip the file


#### Reads the Data:

Reads the training set and the test set (X_train.txt and X_test.txt)


#### Reads activities, subjects and labels

- Activities: activity_labels.txt

- Labels: y_test.txt, y_train.txt

- Subjects: subject_test.txt, subject_train.txt


#### Merges the training and the test sets to create one data set


#### Extracts the measurements on the mean and standard deviation for each measurement.


#### Appropriately labels the data set with descriptive variable names

- Puts lowercase the variables names
- Removes the "()" from the variables names
- Replaces "-" by "_"


#### Names the activities in the data set with the activity names

#### Merges the subjects to the data

#### Creates a new tidy data set with the average of each variable for each activity and each subject

#### Creates a txt file with de tidy data: "tidy_data_set.txt"


The final data frame "result" looks like this:

head(result)
Source: local data frame [6 x 68]

  activity_label subject tbodyacc_mean_x tbodyacc_mean_y tbodyacc_mean_z
1         LAYING      25       0.3012721    -0.014986956      -0.1076233
2         LAYING      26       0.3087277    -0.017342186      -0.1159730
3         LAYING      27       0.3237472    -0.018435437      -0.1100379
4         LAYING      28       0.3419858    -0.018381791      -0.1112555
5         LAYING      29       0.3673475    -0.018120895      -0.1166456
6         LAYING      30       0.4298715    -0.004868005      -0.1239896
Variables not shown: tbodyacc_std_x (dbl), tbodyacc_std_y (dbl), tbodyacc_std_z (dbl),
  tgravityacc_mean_x (dbl), tgravityacc_mean_y (dbl), tgravityacc_mean_z (dbl),
  tgravityacc_std_x (dbl), tgravityacc_std_y (dbl), tgravityacc_std_z (dbl),
  tbodyaccjerk_mean_x (dbl), tbodyaccjerk_mean_y (dbl), tbodyaccjerk_mean_z (dbl),
  tbodyaccjerk_std_x (dbl), tbodyaccjerk_std_y (dbl), tbodyaccjerk_std_z (dbl),
  tbodygyro_mean_x (dbl), tbodygyro_mean_y (dbl), tbodygyro_mean_z (dbl),
  tbodygyro_std_x (dbl), tbodygyro_std_y (dbl), tbodygyro_std_z (dbl),
  tbodygyrojerk_mean_x (dbl), tbodygyrojerk_mean_y (dbl), tbodygyrojerk_mean_z (dbl),
  tbodygyrojerk_std_x (dbl), tbodygyrojerk_std_y (dbl), tbodygyrojerk_std_z (dbl),
  tbodyaccmag_mean (dbl), tbodyaccmag_std (dbl), tgravityaccmag_mean (dbl),
  tgravityaccmag_std (dbl), tbodyaccjerkmag_mean (dbl), tbodyaccjerkmag_std (dbl),
  tbodygyromag_mean (dbl), tbodygyromag_std (dbl), tbodygyrojerkmag_mean (dbl),
  tbodygyrojerkmag_std (dbl), fbodyacc_mean_x (dbl), fbodyacc_mean_y (dbl),
  fbodyacc_mean_z (dbl), fbodyacc_std_x (dbl), fbodyacc_std_y (dbl), fbodyacc_std_z
  (dbl), fbodyaccjerk_mean_x (dbl), fbodyaccjerk_mean_y (dbl), fbodyaccjerk_mean_z
  (dbl), fbodyaccjerk_std_x (dbl), fbodyaccjerk_std_y (dbl), fbodyaccjerk_std_z (dbl),
  fbodygyro_mean_x (dbl), fbodygyro_mean_y (dbl), fbodygyro_mean_z (dbl),
  fbodygyro_std_x (dbl), fbodygyro_std_y (dbl), fbodygyro_std_z (dbl),
  fbodyaccmag_mean (dbl), fbodyaccmag_std (dbl), fbodybodyaccjerkmag_mean (dbl),
  fbodybodyaccjerkmag_std (dbl), fbodybodygyromag_mean (dbl), fbodybodygyromag_std
  (dbl), fbodybodygyrojerkmag_mean (dbl), fbodybodygyrojerkmag_std (dbl)
