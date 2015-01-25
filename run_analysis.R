## load necessary packages
library(dplyr)
library(tidyr)
library(data.table)

## check if directory exists, if not create the directory
if (!file.exists("course_project")) {
        dir.create("course_project")
}

## download and unzip the file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileurl, destfile = "./course_project/dataset.zip", method = "curl")
unzip("./course_project/dataset.zip", exdir = "./course_project/")
list.files("./course_project")

## load file into r
subject_tr <- read.table("./course_project/UCI HAR Dataset/train/subject_train.txt")
x_tr <- read.table("./course_project/UCI HAR Dataset/train/X_train.txt")
y_tr <- read.table("./course_project/UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./course_project/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./course_project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./course_project/UCI HAR Dataset/test/y_test.txt")
features <- read.table("./course_project/UCI HAR Dataset/features.txt")

## merge training and test datasets
subject_all <- rbind(subject_tr, subject_test)
x_all <- rbind(x_tr, x_test)
y_all <- rbind(y_tr, y_test)

## add column names to the datasets subjec_all and y_all
colnames(subject_all) <- 'subject_id'
colnames(y_all) <- 'activity'

## remove unnecessary first column from features
## transpose features to get a character vector
## remove hyphens and make names unique
## use that vector as column names for x_all dataset
features <- features[-1]
features <- t(features)
features <- make.names(features, unique=TRUE)
colnames(x_all) <- features

## merge all sets into one dataset
data_all <- cbind(subject_all, y_all, x_all)

## Extracts only the measurements on the mean and standard deviation for each measurement
data_mean_sd <- select(data_all, subject_id, activity, contains('mean..'), contains('std..'))

## Uses descriptive activity names to name the activities in the data set
data_mean_sd$activity <- factor(data_mean_sd$activity,
                                levels = c(1,2,3,4,5,6),
                                labels = c('walking', 'walking_upstairs', 'walking_downstairs', 'sitting', 'standing', 'laying'))

## Appropriately labels the data set with descriptive variable names:
## export variable (column) names to a txt file and make them more descriptive using a texteditor
## check variables for mistakes or erroneously include columns
## save new txt file as: colnames_tidy
## change column names and remove erroneously inculde columns if present
write.table(colnames(data_mean_sd), "./course_project/colnames_raw.txt", sep="\t")
descriptive_names <- read.table("./course_project/colnames_tidy.txt")
descriptive_names <- t(descriptive_names)
colnames(data_mean_sd) <- descriptive_names
data_mean_sd <- data_mean_sd[-36]

## From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject:
## group the dataset by subject_id and activity
## use summarise_each to calculate means of rest of the columns
## save tidy data set as txt file
data_grouped <- group_by(data_mean_sd, subject_id, activity)
sum_data <- summarise_each(data_grouped, funs(mean))
write.table(sum_data, "./course_project/tidy_data.txt", row.name=FALSE)

