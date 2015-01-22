==================================================================
README run_analysis.R script
Version 1.0
==================================================================
Author: Annette Bobrik, Germany (abobrik@hotmail.com)
==================================================================

This README gives an overview of the run_analysis.R script.

== OVERVIEW ======================================================

The R script run_analysis.R does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average 
	of each variable for each activity and each subject.
6.	The data set from step 5 is written to an .txt file

== PREREQUISITES ======================================================

Before running the script, you have to do some prerequesites:
1.	Make sure you have installed the following R libraries: dplyr, data.table
	If not, install these libraries with install.p ackages("...")
2.	Download a zip-file containing all data from the following link: 
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
3.	Unzip the file. All files will be included in the main folder "UCI HAR Dataset".
4.	Change the script run_analysis.R on line 7 to match the file structure on your computer:
	Change root_path<-"C:/Users/Annette Bobrik/Documents/R/UCI HAR Dataset"
	to root_path<-"<path-to-main-folder>/UCI HAR Dataset"
5.	You might need to change the separator sign depending on your operating system in the script in line 8. 
	The Default is sep=“/“ for Windows operating system.

== RUNNING THE SCRIPT =====================================================

Run the script in R or RStudio. As a result, the file „average_mean_std_values.txt“ will be written to the main folder "UCI HAR Dataset".
This file contains the average values of all subjects per activity type for the mean and standard deviation measurements of the train and 
test data sets provided in the "UCI HAR Dataset". The variables are described in the code book provided with the script and the resulting data.

Further information about the script is given by the comments in the script.

== NOTES ON THE DATA============================================================
The UCI HAR Dataset has been collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the 
site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Further details can be found in the README.txt in the main folder “UCI HAR Dataset”.

The script reads the following files from the UCI HAR Dataset, merges them into a single data set and further refines it:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

