library("dplyr")
# Name of the file to download
zipFile <- "getdata_projectfiles_UCI HAR datasets.zip"
# Download file if not exists
if(!file.exists(zipFile)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL,zipFile,method = "curl")
}

# unzip the file if not done
if(!file.exists("zipFile")){
        unzip(zipFile)
}
# Read all features
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
# Read all activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
# Read all subject test.
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
# Read x_test
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
# Read y_test
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
# read subject train
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
# read x_train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
# read y_train
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


# Merge Data
X_Data <- rbind(x_train,x_test)
Y_Data <- rbind(y_train,y_test)
Subject <- rbind(subject_train, subject_test)
Merge_Data <- cbind(Subject, Y_Data, X_Data)

TidyData <- Merge_Data %>% select(subject, code, contains("mean"), contains("std"))

# Uses descriptive activity names to name the activities in the data set.
TidyData$code <- activities[TidyData$code, 2]

# Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] <- "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable 
#for each activity and each subject.

FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)