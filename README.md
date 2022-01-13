# data-cleaning-project
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# Coursera assessment "Getting and Cleaning Data"

Author: Chetan Kumar 
Runnable source script: run_analysis.R 
Task desrciption 
(repeated in the source script "run_analysis.R" alongside the actual execution code): 

Merges the training and the test sets to create one data set. 
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set 
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE 
Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works and the code book describing the variables. 
Results 
FinalData.txt -- contains the final tidied output data. 

The description how the result has been achieved is contained within the source file "run_analysis.R".


Otherwise the instructions from the R script can be executed and checked step by step for review.

The data source is not included in the git repository. The R script downloads it into subdir named "data" during runtime.

Analyzed source data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

(see below for licensing conditions of the data itself) 

Notes about data structure: 
"X_train.txt" has 7352 lines with sample values -> 561 columns, described by name in "features.txt" and with more info in "features_info.txt" 
"subject_train.txt" has 7352 lines with coded values for the person (subject) 
"y_train.txt" has 7352 lines with coded values for the activity 
The same structure is repeated for test (replace "train" with "test" in file names, 2947 lines with measurement values which are added to the 7352 lines from the training set). 
