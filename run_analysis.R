## Author: nhatmn
## Course: Getting and Cleaning Data
## Peer Assessments

## Here are the data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Below is the code steps-by-steps:

## 1. Merges the training and the test sets to create one data set.
X_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
X_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
X_merge <- rbind(X_train, X_test)

subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
subject_merge <- rbind(subject_train, subject_test)

y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
y_merge <- rbind(y_train, y_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./UCI_HAR_Dataset/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_merge <- X_merge[, indices_of_good_features]
names(X_merge) <- features[indices_of_good_features, 2]
names(X_merge) <- gsub("\\(|\\)", "", names(X_merge))
names(X_merge) <- tolower(names(X_merge))

## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y_merge[,1] = activities[y_merge[,1], 2]
names(y_merge) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names.
names(subject_merge) <- "subject"
cleaned <- cbind(subject_merge, y_merge, X_merge)
write.table(cleaned, "Step04_merged_clean_data.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(subject_merge)[,1]
numSubjects = length(unique(subject_merge)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "Step05_data_set_with_means.txt")
