library(dplyr)

# Download the file

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./dataset.zip")
unzip("dataset.zip")

#Read the Data

dataTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
dataTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")

# Read activities and labels
labelTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
labelTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")

activityLabels<-rename(activityLabels, cod_label=V1, activity_label=V2)

#Merge the training and the test sets to create one data set.

mergedData<-merge(dataTest, dataTrain, all=TRUE)

#Extract only the measurements on the mean and standard deviation 
#for each measurement.
columns<-read.table("./UCI HAR Dataset/features.txt")
columns[,2]<-tolower(gsub("-","_",columns[,2]))

columns[,2]<-sub("\\(\\)","",columns[,2])

columns<-filter(columns,(grepl("_mean", V2) & !(grepl("meanfreq", V2))) | grepl("std", V2))
cols<-select(columns, as.integer(V1))

finalData<-select(mergedData, c(cols[,1]))

#Appropriately label the data set with descriptive variable names.

for (i in 1:length(finalData)){
  
  names(finalData)[names(finalData) == names(finalData[i])] <- toString(columns[i,2])
  
}
#Name the activities in the data set with descriptive activity names
mergedLabels<-rbind(labelTest, labelTrain)
mergedLabels<-rename(mergedLabels, cod_label=V1)

mergedLabels<-merge(mergedLabels, activityLabels, by.x="cod_label", by.y="cod_label", all=TRUE)

#Merge the subjects to the data

mergedSubject<-rbind(subjectTest, subjectTrain)
mergedSubject<-rename(mergedSubject, subject=V1)

finalData<-cbind(mergedLabels,finalData)

#Create a second, independent tidy data set with the average of each 
#variable for each activity and each subject.

finalData2<-cbind(mergedSubject,finalData)


finalData2<-select(finalData2, -cod_label)

groupData<-group_by(finalData2, activity_label, subject)
result<-summarize(groupData, tbodyacc_mean_x = mean( tbodyacc_mean_x ,na.rm=TRUE),  
              tbodyacc_mean_y = mean( tbodyacc_mean_y ,na.rm=TRUE),  
              tbodyacc_mean_z = mean( tbodyacc_mean_z ,na.rm=TRUE),  
              tbodyacc_std_x = mean( tbodyacc_std_x ,na.rm=TRUE),  
              tbodyacc_std_y = mean( tbodyacc_std_y ,na.rm=TRUE),  
              tbodyacc_std_z = mean( tbodyacc_std_z ,na.rm=TRUE),  
              tgravityacc_mean_x = mean( tgravityacc_mean_x ,na.rm=TRUE),  
              tgravityacc_mean_y = mean( tgravityacc_mean_y ,na.rm=TRUE),  
              tgravityacc_mean_z = mean( tgravityacc_mean_z ,na.rm=TRUE),  
              tgravityacc_std_x = mean( tgravityacc_std_x ,na.rm=TRUE),  
              tgravityacc_std_y = mean( tgravityacc_std_y ,na.rm=TRUE),  
              tgravityacc_std_z = mean( tgravityacc_std_z ,na.rm=TRUE),  
              tbodyaccjerk_mean_x = mean( tbodyaccjerk_mean_x ,na.rm=TRUE),  
              tbodyaccjerk_mean_y = mean( tbodyaccjerk_mean_y ,na.rm=TRUE),  
              tbodyaccjerk_mean_z = mean( tbodyaccjerk_mean_z ,na.rm=TRUE),  
              tbodyaccjerk_std_x = mean( tbodyaccjerk_std_x ,na.rm=TRUE),  
              tbodyaccjerk_std_y = mean( tbodyaccjerk_std_y ,na.rm=TRUE),  
              tbodyaccjerk_std_z = mean( tbodyaccjerk_std_z ,na.rm=TRUE),  
              tbodygyro_mean_x = mean( tbodygyro_mean_x ,na.rm=TRUE),  
              tbodygyro_mean_y = mean( tbodygyro_mean_y ,na.rm=TRUE),  
              tbodygyro_mean_z = mean( tbodygyro_mean_z ,na.rm=TRUE),  
              tbodygyro_std_x = mean( tbodygyro_std_x ,na.rm=TRUE),  
              tbodygyro_std_y = mean( tbodygyro_std_y ,na.rm=TRUE),  
              tbodygyro_std_z = mean( tbodygyro_std_z ,na.rm=TRUE),  
              tbodygyrojerk_mean_x = mean( tbodygyrojerk_mean_x ,na.rm=TRUE),  
              tbodygyrojerk_mean_y = mean( tbodygyrojerk_mean_y ,na.rm=TRUE),  
              tbodygyrojerk_mean_z = mean( tbodygyrojerk_mean_z ,na.rm=TRUE),  
              tbodygyrojerk_std_x = mean( tbodygyrojerk_std_x ,na.rm=TRUE),  
              tbodygyrojerk_std_y = mean( tbodygyrojerk_std_y ,na.rm=TRUE),  
              tbodygyrojerk_std_z = mean( tbodygyrojerk_std_z ,na.rm=TRUE),  
              tbodyaccmag_mean = mean( tbodyaccmag_mean ,na.rm=TRUE),  
              tbodyaccmag_std = mean( tbodyaccmag_std ,na.rm=TRUE),  
              tgravityaccmag_mean = mean( tgravityaccmag_mean ,na.rm=TRUE),  
              tgravityaccmag_std = mean( tgravityaccmag_std ,na.rm=TRUE),  
              tbodyaccjerkmag_mean = mean( tbodyaccjerkmag_mean ,na.rm=TRUE),  
              tbodyaccjerkmag_std = mean( tbodyaccjerkmag_std ,na.rm=TRUE),  
              tbodygyromag_mean = mean( tbodygyromag_mean ,na.rm=TRUE),  
              tbodygyromag_std = mean( tbodygyromag_std ,na.rm=TRUE),  
              tbodygyrojerkmag_mean = mean( tbodygyrojerkmag_mean ,na.rm=TRUE),  
              tbodygyrojerkmag_std = mean( tbodygyrojerkmag_std ,na.rm=TRUE),  
              fbodyacc_mean_x = mean( fbodyacc_mean_x ,na.rm=TRUE),  
              fbodyacc_mean_y = mean( fbodyacc_mean_y ,na.rm=TRUE),  
              fbodyacc_mean_z = mean( fbodyacc_mean_z ,na.rm=TRUE),  
              fbodyacc_std_x = mean( fbodyacc_std_x ,na.rm=TRUE),  
              fbodyacc_std_y = mean( fbodyacc_std_y ,na.rm=TRUE),  
              fbodyacc_std_z = mean( fbodyacc_std_z ,na.rm=TRUE),  
              fbodyaccjerk_mean_x = mean( fbodyaccjerk_mean_x ,na.rm=TRUE),  
              fbodyaccjerk_mean_y = mean( fbodyaccjerk_mean_y ,na.rm=TRUE),  
              fbodyaccjerk_mean_z = mean( fbodyaccjerk_mean_z ,na.rm=TRUE),  
              fbodyaccjerk_std_x = mean( fbodyaccjerk_std_x ,na.rm=TRUE),  
              fbodyaccjerk_std_y = mean( fbodyaccjerk_std_y ,na.rm=TRUE),  
              fbodyaccjerk_std_z = mean( fbodyaccjerk_std_z ,na.rm=TRUE),  
              fbodygyro_mean_x = mean( fbodygyro_mean_x ,na.rm=TRUE),  
              fbodygyro_mean_y = mean( fbodygyro_mean_y ,na.rm=TRUE),  
              fbodygyro_mean_z = mean( fbodygyro_mean_z ,na.rm=TRUE),  
              fbodygyro_std_x = mean( fbodygyro_std_x ,na.rm=TRUE),  
              fbodygyro_std_y = mean( fbodygyro_std_y ,na.rm=TRUE),  
              fbodygyro_std_z = mean( fbodygyro_std_z ,na.rm=TRUE),  
              fbodyaccmag_mean = mean( fbodyaccmag_mean ,na.rm=TRUE),  
              fbodyaccmag_std = mean( fbodyaccmag_std ,na.rm=TRUE),  
              fbodybodyaccjerkmag_mean = mean( fbodybodyaccjerkmag_mean ,na.rm=TRUE),  
              fbodybodyaccjerkmag_std = mean( fbodybodyaccjerkmag_std ,na.rm=TRUE),  
              fbodybodygyromag_mean = mean( fbodybodygyromag_mean ,na.rm=TRUE),  
              fbodybodygyromag_std = mean( fbodybodygyromag_std ,na.rm=TRUE),  
              fbodybodygyrojerkmag_mean = mean( fbodybodygyrojerkmag_mean ,na.rm=TRUE),  
              fbodybodygyrojerkmag_std = mean( fbodybodygyrojerkmag_std ,na.rm=TRUE)) 

#Create a txt file with de tidy data               
              
write.table(result, file = "tidy_data_set.txt", row.name = FALSE)


