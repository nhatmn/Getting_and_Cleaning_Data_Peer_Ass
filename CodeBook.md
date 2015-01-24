### Author: nhatmn
### Course: Getting and Cleaning Data

#Peer Assessments Code Book
========================

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The attached R script (run_analysis.R) performs the following to clean up the data:
* Merges the training and the test sets to create one data set.
    + X_train and X_test are the data which are read from "./UCI_HAR_Dataset/train/X_train.txt" and ./UCI_HAR_Dataset/test/X_test.txt". Both of them are merged into X_merge.
    + subject_train and subject_test are data which are read from "./UCI_HAR_Dataset/train/subject_train.txt" and "./UCI_HAR_Dataset/test/subject_test.txt". Both of them are merged into subject_merge.
    + y_train and y_test are the data which are read from "./UCI_HAR_Dataset/train/y_train.txt" and "./UCI_HAR_Dataset/test/y_test.txt". Both of them are merged into y_merge.

* Extracts only the measurements on the mean and standard deviation for each measurement. 
    + Read data from "./UCI_HAR_Dataset/features.txt" and save to features
    + Extracts (from features) only the measurements on the mean and standard deviation for each measurement.
    + The result is a 10299x66 data frame

* Uses descriptive activity names to name the activities in the data set
    + Read the data from "./UCI_HAR_Dataset/activity_labels.txt" and save to activities.
    + Applies descriptive activity names to name the activities in the data set:
    ```
    walking
    walkingupstairs
    walkingdownstairs
    sitting
    standing
    laying
    ```

* Appropriately labels the data set with descriptive variable names.
    + Combine subject_merge, y_merge and X_merge, then save the result to a text file name "Step04_merged_clean_data.txt"

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    + The result is saved as data_set_with_the_averages.txt, a 180x68 data frame.
