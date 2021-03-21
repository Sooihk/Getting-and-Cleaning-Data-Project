The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

## the original data was modified by
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Useing descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names.
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

## Identififiers
The first two columns - Subject and Activity - are Identifiers.
* Subject: the ID of the Subject
* Activity: the Name of the Activity performed by the subject when measurements were taken

Tidy dataset was build as a mean values of features grouped by ***activity*** and ***subject*** - for each subject and activity type determined mean values over all activities of that type.  
