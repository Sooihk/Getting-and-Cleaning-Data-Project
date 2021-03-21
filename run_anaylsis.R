library(dplyr)

filefolder <- "C:/Users/aduro/Desktop/Coding/Data Science Coursera/Coursera Getting and Cleaning Data/Week 4/UCI HAR Dataset"
setwd("C:/Users/aduro/Desktop/Coding/Data Science Coursera/Coursera Getting and Cleaning Data/Week 4/UCI HAR Dataset/")
# 1. read in features and activity data
features <- read.table("features.txt", col.names = c("n", "functions"))
activites <- read.table("activity_labels.txt", col.names = c("code", "activity"))

# test data
test <- read.table("test/X_test.txt", col.names = features$functions)
subject_test <- read.table("test/subject_test.txt")
test$subject <- factor(subject_test$V1)
y_test <- read.table("test/y_test.txt")
test$activity <- y_test$V1

# train data
train <- read.table("train/X_train.txt", col.names = features$functions)
subject_train <- read.table("train/subject_train.txt")
train$subject <- factor(subject_train$V1)
y_train <- read.table("train/y_train.txt")
train$activity <- y_train$V1

# merge test and train dataset
mergeData <- rbind(test, train)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
filteredData <- mergeData %>% select(subject, activity, contains("mean"), contains("std"))

# 3.Uses descriptive activity names to name the activities in the data set
filteredData$activity <- activites[filteredData$activity,2]

# 4.Appropriately labels the data set with descriptive variable names. 
names(filteredData)<-gsub("Acc", "Accelerometer", names(filteredData))
names(filteredData)<-gsub("Gyro", "Gyroscope", names(filteredData))
names(filteredData)<-gsub("BodyBody", "Body", names(filteredData))
names(filteredData)<-gsub("Mag", "Magnitude", names(filteredData))
names(filteredData)<-gsub("^t", "Time", names(filteredData))
names(filteredData)<-gsub("^f", "Frequency", names(filteredData))
names(filteredData)<-gsub("tBody", "TimeBody", names(filteredData))
names(filteredData)<-gsub("-mean()", "Mean", names(filteredData), ignore.case = TRUE)
names(filteredData)<-gsub("-std()", "STD", names(filteredData), ignore.case = TRUE)
names(filteredData)<-gsub("-freq()", "Frequency", names(filteredData), ignore.case = TRUE)
names(filteredData)<-gsub("angle", "Angle", names(filteredData))
names(filteredData)<-gsub("gravity", "Gravity", names(filteredData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
tidyData <- filteredData %>% group_by(subject, activity) %>% 
  summarise_all(mean)
write.table(tidyData, "tidyData.txt", row.name=FALSE)