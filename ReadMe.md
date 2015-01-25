This is a readme file for course project of the coursera course: Getting and cleaning data.

for the course project we had to upload three files to github: the r script to run the code: run_analysis.r, a code book describing the r script and how the data was manipulated:CodeBook.md and this readme file:ReadMe.md.

the course assignment states that the readme should include how the script works however in the codebook there should also be a passage on how the data was manipulated. these are both very similar things so these pasages are the same. (also all the steps in the script have an explanation as to what that function is doing)

The script accompanying this read me file (run_analysis.r) can be used to reproduce the tidy dataset uploaded to the coursera site. Here, I will describe how the script works and what all the steps do. firstly, the script loads the r packages that are used in the data manipulation such as: dplyr, tidyr, and data.table
next step is to check the working directory for a folder to save the dataset (course_project). if the folder does not exist, the script creates this folder
following step is to download the dataset. the link to the dataset is provided. the dataset is a zipped folder this folder is unzipped to the same folder.
next step is to load all the necessary txt files into r as data tables. these files contain a training and a test data set.

assignment step 1
next step of the assignment is to merge these tables into one table. first the training and test data sets are merged together.
the merged datatables do not contain variable names. next these column names are appended to the respective tables (the table containing the colum names was transposed and then the column names were made unique by passing the make.names function). after this these datatables are merged together resulting in the completed dataset.

assignment step 2
in this assignment we are interested in the measurements containing the mean and standard deviation. these variable are extracted by selecting columns containing mean.. or sd.. (the hypens that were present were turned into .. by the make.names function so mean() became mean..)

assignment step 3
the activities column is coded 1, 2, 3, 4, 5, 6 so next step was to change those codes into their descriptive activities using the factor function

assignment step 4
next step was to make the variable lables (column names) more descriptive. the column names were exported to a text document and using a text editor the names were expanded into more descriptive lables and save as a new file. this file was read into are as a table. the table was transposed and appended to the dataset as the new column names. during the editing in the texteditor, the variable names were checked if they were correct (that the selection had only selected the wanted variables and no false positives). also I checked that all the variables for the means also had the correspoding SD variable. there was one variable that was erroneoulsy included. this was variable was removed from the data set.

assignment step 5
next step is to create a new data set which summarizes the previous set by subjects and activity. first step is to group the data set using group_by after that a new data set is created that summarizes every other column with the summarise_each command. this dataset is then exported to a txt file as the final tidy dataset.



For your information, I have include the coursera assignment below:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.