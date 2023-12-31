# Code Book for the "tidydata.txt" datatable

## Table of Contents

1. Variable Description 
- Variable description for original data set
- Variable description of "tidydata.txt" datatable

2. Steps taken to generate the "tidydata.txt" datatable
- R packages used
- Loading raw data into R
- Merging of raw data files
- Extraction of mean and standard deviation for each measurement
- Naming activities with descriptive activity names 
- Adding appropriate labels
- Generating a second, independent tidy dataset containing average of each variable for each activity performed by each subject 
- Writing data to text file 
 
3. About the raw data
- Description


## 1. Variable Description 
### Variable description for original data set

The zipfile can be downloaded here: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The following table summarises each variable of the feature vector for each pattern, whereby '-XYZ' is used to denot the 3-axail signals in the X, Y, and Z directions: 

| Variable	  | Description |
| ---------- | ----------- | 
| tBodyAcc-X | Acceleration of body in X direction | 
| tBodyAcc-Y | Acceleration of body in Y direction | 
| tBodyAcc-Z | Acceleration of body in Z direction | 
| tGravityAcc-X | Acceleration of gravity in X direction|
| tGravityAcc-Y | Acceleration of gravity in Y direction|
| tGravityAcc-Z | Acceleration of gravity in Z direction|
| tBodyAccJerk-X | Body acceleration jerk for X direction |
| tBodyAccJerk-Y | Body acceleration jerk for Y direction |
| tBodyAccJerk-Z | Body acceleration jerk for Z direction  |
| tBodyGyro-X | Body gyroscope measurement for X direction |
| tBodyGyro-Y | Body gyroscope measurement for Y direction |
| tBodyGyro-Z | Body gyroscope measurement for Z direction |
| tBodyGyroJerk-X | Jerk signal of body for X direction |
| tBodyGyroJerk-Y | Jerk signal of body for Y direction|
| tBodyGyroJerk-Z | Jerk signal of body for Z direction |
| tBodyAccMag | Magnitude of body acceleration |
| tGravityAccMag | Magnitutde of gravity acceleration |
| tBodyAccJerkMag |Magnitude of body acceleration jerk|
| tBodyGyroMag | Magnitude of body gyroscope measurement|
| tBodyGyroJerkMag | Magnitude of body gyroscope jerk measurement |
| fBodyAcc-X | Frequency of body acceleration for X direction |
| fBodyAcc-Y | Frequency of body acceleration for Y direction|
| fBodyAcc-Z | Frequency of body acceleration for Z direction|
| fBodyAccJerk-X | Frequency of body acceleration jerk for X direction |
| fBodyAccJerk-Y | Frequency of body acceleration jerk for Y direction |
| fBodyAccJerk-Z | Frequency of body acceleration jerk for Z direction |
| fBodyGyro-X | Frequency of body gyroscope measurement for X direction|
| fBodyGyro-Y | Frequency of body gyroscope measurement for Y direction|
| fBodyGyro-Z | Frequency of body gyroscope measurement for Z direction|
| fBodyAccMag | Frequency of body acceleration magnitude |
| fBodyAccJerkMag | Frequency of body acceleration jerk magnitude |
| fBodyGyroMag | Frequency of body magnitude gyroscope measurement |
| fBodyGyroJerkMag | Frequency of body magnitude gyroscope jerk measurement|

The following table lists the set of variables that were estimated from the signals: 

| Variable | Description |
| -------- | ------------ |
| mean() | Mean value |
| std()|  Standard deviation |
| mad() | Median absolute deviation | 
| max() | Largest value in array |
| min()|  Smallest value in array | 
| sma()|  Signal magnitude area |
| energy() | Energy measure. Sum of the squares divided by the number of values.| 
| iqr() | Interquartile range | 
| entropy() | Signal entropy |
| arCoeff()|  Autorregresion coefficients with Burg order equal to 4 |
| correlation() | correlation coefficient between two signals |
| maxInds() | index of the frequency component with largest magnitude |
| meanFreq() |  Weighted average of the frequency components to obtain a mean frequency |
| skewness() | skewness of the frequency domain signal |
| kurtosis() | kurtosis of the frequency domain signal |
| bandsEnergy() | Energy of a frequency interval within the 64 bins of the FFT of each window.|
| angle()|  Angle between to vectors.|

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

| Variable | 
| -------- | 
|gravityMean |
|tBodyAccMean |
|tBodyAccJerkMean |
|tBodyGyroMean |
|tBodyGyroJerkMean |

## Variable description for "tidydata.txt" datatable

The following table provides a description for each column heading present in the "tidydata.txt" datatable

| Variable Name                 | Description       | 
| ----------------------------- | ----------------- | 
| Subject_ID                    | Subject ID Number, range 1- 30    | 
| Activity_Name                 | Activity Name; can take the terms: "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying" |
| Average_Measurement_Value     | Mean value measured for each activity name |
| Measurement_Type              | Can take any of the 46 terms listed in the "measurement variable" table below |

The following table provides a description for each measurement variable present in the "tidydata.txt" datatable

| Variable Name                                      | Description       |  
| -------------------------------------------------  | ----------------- |  
| Time_Domain_Body_Accelerometer_Mean_X              | Mean acceleration of body in X direction |
| Time_Domain_Body_Accelerometer_Mean_Y              | Mean acceleration of body in Y direction |
| Time_Domain_Body_Accelerometer_Mean_Z              | Mean acceleration of body in Z direction |
| Time_Domain_Gravity_Accelerometer_Mean_X           | Mean acceleration of gravity in X direction | 
| Time_Domain_Gravity_Accelerometer_Mean_Y           | Mean acceleration of gravity in Y direction |
| Time_Domain_Gravity_Accelerometer_Mean_Z           | Mean acceleration of gravity in Z direction |
| Time_Domain_Body_Accelerometer_Jerk_Mean_X         | Mean body acceleration jerk for X direction |
| Time_Domain_Body_Accelerometer_Jerk_Mean_Y         | Mean body acceleration jerk for Y direction |
| Time_Domain_Body_Accelerometer_Jerk_Mean_Z         | Mean body acceleration jerk for Z direction |
| Time_Domain_Body_Gyroscope_Mean_X                  | Mean body gyroscope measurement for X direction |
| Time_Domain_Body_Gyroscope_Mean_Y                  | Mean body gyroscope measurement for Y direction |
| Time_Domain_Body_Gyroscope_Mean_Z                  | Mean body gyroscope measurement for Z direction |
| Time_Domain_Body_Gyroscope_Jerk_Mean_X             | Mean jerk signal of body for X direction |
| Time_Domain_Body_Gyroscope_Jerk_Mean_Y             | Mean jerk signal of body for Y direction |
| Time_Domain_Body_Gyroscope_Jerk_Mean_Z             | Mean jerk signal of body for Z direction |
| Time_Domain_Body_Accelerometer_Magnitude_Mean      | Mean magnitude of body acceleration |
| Time_Domain_Gravity_Accelerometer_Magnitude_Mean   | Mean magnitutde of gravity acceleration |
| Time_Domain_Body_Accelerometer_Jerk_Magnitude_Mean | Mean magnitude of body gyroscope jerk measurement |
| Time_Domain_Body_Gyroscope_Magnitude_Mean          | Mean magnitude of body gyroscope measurement |
| Time_Domain_Body_Gyroscope_Jerk_Magnitude_Mean     | Mean magnitude of body gyroscope jerk measurement |
| Frequency_Domain_Body_Accelerometer_Mean_X         | Mean frequency body acceleration for X direction |
| Frequency_Domain_Body_Accelerometer_Mean_Y         | Mean frequency body acceleration for Y direction |
| Frequency_Domain_Body_Accelerometer_Mean_Z         | Mean frequency body acceleration for Z direction |
| Frequency_Domain_Body_Accelerometer_Mean_Frequency_X | Mean frequency of body acceleration for X direction frequency |
| Frequency_Domain_Body_Accelerometer_Mean_Frequency_Y | Mean frequency of body acceleration for Y direction frequency |
| Frequency_Domain_Body_Accelerometer_Mean_Frequency_Z | Mean frequency of body acceleration for Z direction frequency |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_X    | Mean frequency of body acceleration jerk for X direction |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_Y    | Mean frequency of body acceleration jerk for Y direction |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_Z    | Mean frequency of body acceleration jerk for Z direction |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_Frequency_X | Mean frequency of body acceleration jerk for X direction frequency |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_Frequency_Y | Mean frequency of body acceleration jerk for Y direction frequency |
| Frequency_Domain_Body_Accelerometer_Jerk_Mean_Frequency_Z | Mean frequency of body acceleration jerk for Z direction frequency |
| Frequency_Domain_Body_Gyroscope_Mean_X             | Mean frequency of body gyroscope measurement for X direction |
| Frequency_Domain_Body_Gyroscope_Mean_Y             | Mean frequency of body gyroscope measurement for X direction |
| Frequency_Domain_Body_Gyroscope_Mean_Z             | Mean frequency of body gyroscope measurement for X direction |
| Frequency_Domain_Body_Gyroscope_Mean_Frequency_X   | Mean frequency of body gyroscope measurement for X direction frequency |
| Frequency_Domain_Body_Gyroscope_Mean_Frequency_Y   | Mean frequency of body gyroscope measurement for Y direction frequency |
| Frequency_Domain_Body_Gyroscope_Mean_Frequency_Z   | Mean frequency of body gyroscope measurement for Z direction frequency |
| Frequency_Domain_Body_Accelerometer_Magnitude_Mean | Mean frequency of body acceleration magnitude |
| Frequency_Domain_Body_Accelerometer_Magnitude_Mean_Frequency | Mean frequency of body acceleration magnitude frequency |
| Frequency_Domain_Body_Accelerometer_Jerk_Magnitude_Mean | Mean frequency of body acceleration jerk magnitude |
| Frequency_Domain_Body_Accelerometer_Jerk_Magnitude_Mean_Frequency | Mean frequency of body acceleration jerk magnitude mean |
| Frequency_Domain_Body_Gyroscope_Magnitude_Mean     | Mean frequency of body gyoscope magnitude |
| Frequency_Domain_Body_Gyroscope_Magnitude_Mean_Frequency | Mean frequency of body gyoscope magnitude frequency |
| Frequency_Domain_Body_Gyroscope_Jerk_Magnitude_Mean | Mean frequency of body gyoscope jerk magnitude |
| Frequency_Domain_Body_Gyroscope_Jerk_Magnitude_Mean_Frequency | Mean frequency of body gyoscope jerk magnitude frequency |

## 2. Steps taken to generate the "tidydata" datatable

### R Packages used 

"tidyverse", "stringr", "plyr"

### Loading raw data into R
Using `download.file()`, the zipfile containing the raw data was downloaded and directly saved in the appropriate directory (working directory). The following link was used to download the zipfile:  
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Using `unzip()`, the zipfile was unzipped and its contents were directly saved in the appropriate directory (working directory)

### Merging of raw data files
1. Reading in the data

Using `read.table()`, the relevant files were read into R. 

| File name           | R Object Name   | No. Observations | No. Variables | Description | 
| ------------------- | --------------- | ---------------- | ------------- | --------------
| "features.txt"      | features        | 561              | 2             | List of all features |
| "subject_test.txt"  | subject_test    | 2947             | 1             | Each row identifies the subject who performed the activity for each window sample. Its range is from 2 to 24. |
| "X_test.txt"        | x_test          | 2947             | 561           | Test set |
| "y_test.txt"        | y_test          | 2947             | 1             | Test labels |
| "subject_train.txt" | subject_train   | 7352             | 1             | Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. |
| "X_train.txt"       | x_test          | 7352             | 561           | Training set |
| "y_train.txt"       | y_train         | 7352             | 1             | Training labels |

Using `rename()` and `rename_all()`, the columns of the six test and train files were appropriately renamed. 

2. Merging the data
The three "test" and the three "train" files were merged using `cbind()` to generate the dataframes "testmerged" and "trainmerged", respectively. These two dataframes were then merged together using `rbind()` to generate the dataframe "alldata". This table below lists these dataframes, as well as the number of observations and variables each contains. 

| R Object Name | No. Observations | No. Variables |
| ------------- | ---------------- | ------------- |
| testmerged    | 2947             | 563           | 
| trainmerged   | 7352             | 563           | 
| alldata       | 10299            | 563           |

 
### Extraction of mean and standard deviation for each measurement
Using `grepl()`, the dataframe "alldata" was subsetted to include only columns which had the terms "mean" and "std" in their name. A vector named "names_subset" containing the terms "mean" and "std" was created to faciliate this subsetting step. The resulting dataframe was called "alldata_subset". A second subsetted dataframe was generated from the first and second columns of the "alldata" dataframe called "ID_type_subset". These columns contain the "activity_ID" and the "activity_type". Using `cbind()`, "ID_type_subset" and "alldata_subset" were merged to generate "alldata_meanstd", the dataframe containing only the mean measurements and the standard deviation of each measurement. This table below lists these objects, as well as the number of observations and variables each contains. 

| R Object Name   | No. Observations | No. Variables |
| --------------- | ---------------- | ------------- |
| alldata_subset  | 10299            | 46            | 
| ID_type_subset  | 10299            | 2             | 
| alldata_meanstd | 10299            | 48            |

### Naming activities with descriptive activity names 

The data for the activity labels was read in using `read.table()` and the columns were appropriately renamed using `rename()` to "activity_ID" and "activity_name". The dataframe "alldata_meanstd" was merged with the "activitylabs" by the shared column "activity_ID" the using `merge()`. This resulted in the dataframe "alldata_meanstd_actnames". The columns of this dataframe were then rearranged so that the column "activity_name" was placed in second position. This table below lists these objects, as well as the number of observations and variables each contains. 

| R Object Name            | No. Observations | No. Variables |
| ------------------------ | ---------------- | ------------- |
| acivitylabs              | 6                | 2             | 
| alldata_meanstd_actnames | 10299            | 49            |

### Adding appropriate labels

The vector "columnnames" was created using `colnames()` on the dataframe "alldata_meanstd_actnames" in order to extract all all column names. Using `str_replace_all()`, a new vector called "columnnames2" was created based off of the contents of the vector "columnnames". The following table summarises the changes performed by `str_replace_all()`: 
 
| Pattern     | Replacement           |
| ----------- | --------------------- |
| "Acc"       | "Accelerometer_"      |
| "Gyro"      | "Gyroscope_"          | 
| "Mag"       | "Magnitude_"          |
| "Freq"      | "Frequency"           | 
| "mean()"    | "Mean"                |
| "std"       | "Standard_Deviation"  |
| "BodyBody"  | "Body_"               |
| "Body"      | "Body_"               |
| "Jerk"      | "Jerk_"               |
| "Gravity"   | "Gravity_"            |
| "X"         | "_X"                  |
| "Y"         | "_Y"                  |
| "Z"          | "_Z"                  |
| "MeanFrequency" | "Mean_Frequency"  |                  
| "Body__"       | "Body_"            |
| "activity_ID" | "Activity_ID"|
| "activity_name" | "Activity_Name"|
| "subject_ID" | "Subject_ID" |
| "^t" | "Time_Domain_"| 
| "^f" | "Frequency_Domain_" |
| "[\\(\\)-]" | "" |

The vector "columnnames2" was then used to replace the original column names in the dataframe "alldata_meanstd_actnames". 

### Generating a second, independent tidy dataset containing average of each variable for each activity performed by each subject 

Using `group_by()`, the "alldata_meanstd_actnames" dataframe was grouped first by the variable "Subject_ID" and then by the variable "Activity_Name". Using `summarise_all()`, the mean of each variable for each activity performed by each subject was calculated. After ungrouping the dataframe using `ungroup()`, the rows were arranged by the variable "Subject_ID" and then by the variable "Activity_ID" using `arrange()`. The resulting dataframe was named "alldata_tidy", and the table below lists the number of observations and variables it contains. 

| R Object Name            | No. Observations | No. Variables |
| ------------------------ | ---------------- | ------------- |
| alldata_tidy             | 180              | 49            |

The definition of tidy data as stated on the cran.r-project.org website is as follows: 
1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

To this end, the datatable "alldata_tidy" was reorganised into the tidy format.

A vector "subID" containing the numbers 1 to 30, each repeated 276 times was created using `rep()` (there are 30 "Subject_ID"s, each of which performs 6 activities, and for each activity 46 measurements are taken; this means, there are 6x46 = 276 measurements for each "Subject_ID". Similarly, a vector "actID" containing the 6 "activity_name" terms from the "activitylabs" table, where each individual term was repeated 46 times, and the whole series was repeated 30 times, was created using `rep()` (there are 46 measurements for each of the 6 terms "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", and "Laying" for each of the 30 subjects). The table below summaries the dimensions of these two vectors.

| R Object Name  | Dimensions |
| -------------- | ---------- | 
| subID          | [1:8280]   |
| actID          | [1:8280]   |

A vector "measurements" was created containing the names of the columns 4:49 from the "alldata_meanstd_actnames" dataframe using `colnames()`. This vector was repeated 180 times using `rep()` and converted to a dataframe using `as.data.frame()`. Subsequently, the vectors "subID" and "actID" and the dataframe "measurements" were merged together using `cbind()` to create the dataframe "tidy1", the columns of which were renamed using `rename()`; "subID", "actID" and "measurements" were renamed to "Subject_ID", "Activity_ID", and "Measurement_Type", respectively. The dataframe "alldata_tidy2" was created by transposing the dataframe "alldata_tidy" using `t()`. The first three rows of "alldata_tidy2" were then removed, before the entire dataframe was unlisted using `unlist()` to rearrange all measurement values into a single column. The table below summaries the dimensions of the dataframes.

| R Object Name  | No. Observations | No. Variables |
| -------------- | ---------------- | ------------- |
| measurements   | 8280             |1              |
| tidy1          | 8280             |3              |
| alldata_tidy2  | 8280             |1              | 

The final dataframe "finaldata_tidy" was created by merging the columns from the dataframes "tidy1" with "alldata_tidy2" together using `cbind()`. The table below summaries the dimensions of this final, tidy, dataframe.

| R Object Name  | No. Observations | No. Variables |
| -------------- | ---------------- | ------------- |
| finaldata_tidy | 8280             | 4             |

### Writing data to text file  

Using the command `write.table()`, the final tidy datatable "finaldata_tidy" was saved in the appropriate directory as a "txt" file. 

## 3. About the raw data 

### Description
A description of the "Human Activity Recognition Using Smartphones Data Set" can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data can be downloaded via this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
