## Introduction

This repo contains a script called "run_analysis.R" that does the following:

* Downloads the data.
* Merges the training and the test sets to create one data set.
* Extracts the measurements on the mean and standard deviation for each measurement. 
* Renames the activities in the data set with descriptive variable names.
* Labels the data set with descriptive variable names. 
* Creates a tidy data set, with the average of each variable for each activity and each subject.
* Writes the output data to a txt file.

For more detail see "CodeBook.md"


## Run the script in RStudio

* Clone this repo
* In RStudio load the script:

       source("run_analysis.R")

* Look for the file "tidy_data_set.txt" in your working directory

	   