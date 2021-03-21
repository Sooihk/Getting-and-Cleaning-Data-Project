# Getting-and-Cleaning-Data-Project

# Dataset
[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Sooihk Ro submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

# Files

* `Codebook.md` a code book that describes the problems to solve, variables of the dataset and transformations on the data.
* `run_analysis.R` R file which performs preparation on the dataset to solve the questions for the project. 
    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement.
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive variable names. 
    * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity         and each subject.
* `tidyData.txt` exported final data after following above steps.
