## The CodeBook

this is the codebook for the coursera course getting and cleaning data: the course project. and contains information on study design, background of the dataset, how the data was manipulated (by the accompanying r script), and a list of variables used.

## study design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## background
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time_domain_signals_Accelerometer-XYZ and time_domain_signal_Gyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time_domain_signal_BodyAccelerometer-XYZ and time_domain_signal_GravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time_domain_signal_BodyAccelerometer_Jerk-XYZ and time_domain_signal_BodyGyroscope_Jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). -> these variables have been removed as part of the course project assignment 

Finally a Fast Fourier Transform was applied to some of these signals producing fast_fourier_transformed_Bodyaccelerometer-XYZ, fast_fourier_transformed_Bodyaccelerometer_Jerk-XYZ, fast_fourier_transformed_Bodygyroscope-XYZ, fast_fourier_transformed_BodyBodyaccelerometer_Jerk_magnitude, fast_fourier_transformed_BodyBodygyroscope_magnitude, fast_fourier_transformed_BodyBodygyroscope_Jerk_magnitude. (## Note: the data displayed indicates frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

from all the available data, only the data pertaining to the mean and sd were extracted from the dataset (see section data manipulation). ## note1: these measurements have all been normalized (by the providers of the dataset) and thus do not have specific units. Note2: a full list of all variables in the tidy dataset is listed at the bottom of this document

## Data manipulation
The script accompanying this code book (run_analysis.r) can be used to reproduce the tidy dataset uploaded to the coursera site. Here, I will describe how the script works and what all the steps do. firstly, the script loads the r packages that are used in the data manipulation such as: dplyr, tidyr, and data.table
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

## variables used
below are the variable names used in the data sets after the selection of mean and sd data.
subject_id is the numeral identifier assigned to each of the 20 subjects
activity denotes the activity the were performing for which data was collected
the rest of the variables are explained in the background passage in combination with their descriptive names


variables used in the tidy dataset:
"1"	"subject_id"
"2"	"activity"
"3"	"time_domain_signal_Bodyaccelerometer_mean_X"
"4"	"time_domain_signal_Bodyaccelerometer_mean_Y"
"5"	"time_domain_signal_Bodyaccelerometer_mean_Z"
"6"	"time_domain_signal_Gravityaccelerometer_mean_X"
"7"	"time_domain_signal_Gravityaccelerometer_mean_Y"
"8"	"time_domain_signal_Gravityaccelerometer_mean_Z"
"9"	"time_domain_signal_Bodyaccelerometer_Jerk_mean_X"
"10"	"time_domain_signal_Bodyaccelerometer_Jerk_mean_Y"
"11"	"time_domain_signal_Bodyaccelerometer_Jerk_mean_Z"
"12"	"time_domain_signal_Bodygyroscope_mean_X"
"13"	"time_domain_signal_Bodygyroscope_mean_Y"
"14"	"time_domain_signal_Bodygyroscope_mean_Z"
"15"	"time_domain_signal_Bodygyroscope_Jerk_mean_X"
"16"	"time_domain_signal_Bodygyroscope_Jerk_mean_Y"
"17"	"time_domain_signal_Bodygyroscope_Jerk_mean_Z"
"18"	"time_domain_signal_Bodyaccelerometer_magnitude_mean"
"19"	"time_domain_signal_Gravityaccelerometer_magnitude_mean"
"20"	"time_domain_signal_Bodyaccelerometer_Jerk_magnitude_mean"
"21"	"time_domain_signal_Bodygyroscope_magnitude_mean"
"22"	"time_domain_signal_Bodygyroscope_Jerk_magnitude_mean"
"23"	"fast_fourier_transformed_Bodyaccelerometer_mean_X”
"24"	"fast_fourier_transformed_Bodyaccelerometer_mean_Y"
"25"	"fast_fourier_transformed_Bodyaccelerometer_mean_Z"
"26"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_mean_X"
"27"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_mean_Y"
"28"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_mean_Z"
"29"	"fast_fourier_transformed_Bodygyroscope_mean_X"
"30"	"fast_fourier_transformed_Bodygyroscope_mean_Y"
"31"	"fast_fourier_transformed_Bodygyroscope_mean_Z"
"32"	"fast_fourier_transformed_Bodyaccelerometer_magnitude_mean"
"33"	"fast_fourier_transformed_BodyBodyaccelerometer_Jerk_magnitude_mean"
"34"	"fast_fourier_transformed_BodyBodygyroscope_magnitude_mean"
"35"	"fast_fourier_transformed_BodyBodygyroscope_Jerk_magnitude_mean"
"36"	"time_domain_signal_Bodyaccelerometer_std_X"
"37"	"time_domain_signal_Bodyaccelerometer_std_Y"
"38"	"time_domain_signal_Bodyaccelerometer_std_Z"
"39"	"time_domain_signal_Gravityaccelerometer_std_X"
"40"	"time_domain_signal_Gravityaccelerometer_std_Y"
"41"	"time_domain_signal_Gravityaccelerometer_std_Z"
"42"	"time_domain_signal_Bodyaccelerometer_Jerk_std_X"
"43"	"time_domain_signal_Bodyaccelerometer_Jerk_std_Y"
"44"	"time_domain_signal_Bodyaccelerometer_Jerk_std_Z"
"45"	"time_domain_signal_Bodygyroscope_std_X"
"46"	"time_domain_signal_Bodygyroscope_std_Y"
"47"	"time_domain_signal_Bodygyroscope_std_Z"
"48"	"time_domain_signal_Bodygyroscope_Jerk_std_X"
"49"	"time_domain_signal_Bodygyroscope_Jerk_std_Y"
"50"	"time_domain_signal_Bodygyroscope_Jerk_std_Z"
"51"	"time_domain_signal_Bodyaccelerometer_magnitude_std"
"52"	"time_domain_signal_Gravityaccelerometer_magnitude_std"
"53"	"time_domain_signal_Bodyaccelerometer_Jerk_magnitude_std"
"54"	"time_domain_signal_Bodygyroscope_magnitude_std"
"55"	"time_domain_signal_Bodygyroscope_Jerk_magnitude_std"
"56"	"fast_fourier_transformed_Bodyaccelerometer_std_X"
"57"	"fast_fourier_transformed_Bodyaccelerometer_std_Y"
"58"	"fast_fourier_transformed_Bodyaccelerometer_std_Z"
"59"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_std_X"
"60"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_std_Y"
"61"	"fast_fourier_transformed_Bodyaccelerometer_Jerk_std_Z"
"62"	"fast_fourier_transformed_Bodygyroscope_std_X"
"63"	"fast_fourier_transformed_Bodygyroscope_std_Y"
"64"	"fast_fourier_transformed_Bodygyroscope_std_Z"
"65"	"fast_fourier_transformed_Bodyaccelerometer_magnitude_std"
"66"	"fast_fourier_transformed_BodyBodyaccelerometer_Jerk_magnitude_std"
"67"	"fast_fourier_transformed_BodyBodygyroscope_magnitude_std"
"68"	"fast_fourier_transformed_BodyBodygyroscope_Jerk_magnitude_std"