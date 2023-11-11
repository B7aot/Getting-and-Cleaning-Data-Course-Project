# Bhavika Saini

# load required packages 
library(tidyverse)
library(stringr)
library(plyr)

# setting the working directory and creating a new directory for the file
setwd("C:/Users/gartens1/Downloads")
if(!file.exists("./coursera_getcleandata_assignment")) {
  dir.create("./coursera_getcleandata_assignment")
}

# downloading the file (url)
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./coursera_getcleandata_assignment/dataset.zip")

# unzipping the zip file
unzip(zipfile = "./coursera_getcleandata_assignment/dataset.zip", 
      exdir = "./coursera_getcleandata_assignment")

# Part 1: merge the training and test set to create one data set

features <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/features.txt")
features_names <- as.character(features$V2)

subject_test <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/test/subject_test.txt") %>%
  rename(c("V1" = "subject_ID"))

x_test <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/test/X_test.txt") %>%
  rename_all(~features_names)

y_test <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/test/y_test.txt") %>%
  rename(c("V1" = "activity_ID"))

subject_train <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/train/subject_train.txt") %>%
  rename(c("V1" = "subject_ID"))

x_train <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/train/X_train.txt") %>%
  rename_all(~features_names)

y_train <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/train/y_train.txt") %>%
  rename(c("V1" = "activity_ID"))

# Merging
testmerged <- cbind(y_test, subject_test, x_test)
 
trainmerged <- cbind(y_train, subject_train, x_train)

alldata <- rbind(testmerged, trainmerged)

# Part 2: extract measurements on the mean and standard deviation 

names_subset <- c("mean", "std")
alldata_subset <- alldata[,grepl(names_subset, names(alldata))]
ID_type_subset <- alldata[,1:2]

alldata_meanstd <- cbind(ID_type_subset, alldata_subset)

# Part 3: use descriptive activity names to name the activities in the data set

activitylabs <- read.table("./coursera_getcleandata_assignment/UCI HAR Dataset/activity_labels.txt") %>%
  rename(c("V1" = "activity_ID",
           "V2" = "activity_name"))
alldata_meanstd_actnames <- merge(x = alldata_meanstd, 
                                  y = activitylabs, 
                                  by = "activity_ID", 
                                  all.x = TRUE)

alldata_meanstd_actnames <- alldata_meanstd_actnames[, c(1, 49, 2:48)]

# Part 4: label the data set with descriptive variable names

columnnames <- colnames(alldata_meanstd_actnames)
columnnames2 <- columnnames %>%
  str_replace_all(c("Acc" = "Accelerometer_", 
                    "Gyro" = "Gyroscope_", 
                    "Mag" =  "Magnitude_",
                    "Freq" = "Frequency", 
                    "mean()" = "Mean",
                    "std" = "Standard_Deviation",
                    "BodyBody" = "Body_",
                    "Body" = "Body_",
                    "Jerk" = "Jerk_",
                    "Gravity" = "Gravity_",
                    "X" = "_X",
                    "Y" = "_Y",
                    "Z" = "_Z",
                    "MeanFrequency" = "Mean_Frequency", 
                    "Body__" = "Body_",
                    "activity_ID" = "Activity_ID",
                    "activity_name" = "Activity_Name",
                    "subject_ID" = "Subject_ID"))
columnnames2 <- columnnames2 %>%
  str_replace_all(c("^t" = "Time_Domain_", 
                    "^f" = "Frequency_Domain_",
                    "[\\(\\)-]" = ""))

View(columnnames2)

colnames(alldata_meanstd_actnames) <- columnnames2
# Part 5: create a second, independent tidy dataset 
alldata_tidy <- alldata_meanstd_actnames %>%
  group_by(Subject_ID, Activity_Name) %>%
  summarise_all(.funs=mean) %>%
  ungroup() %>%
  arrange(Subject_ID, Activity_ID)

subID <- rep(c(1:30), each = 276)

actID <- rep(rep(c("Walking", 
                   "Walking Upstairs", 
                   "Walking Downstairs", 
                   "Sitting", 
                   "Standing", 
                   "Laying"), each = 46), times = 30)

measurements <- colnames(alldata_meanstd_actnames [4:49])
measurements <- rep(measurements, times = 180)

measurements <- as.data.frame(measurements)

tidy1 <- cbind(subID, actID, measurements) %>%
  rename(c("subID" = "Subject_ID", 
           "actID" = "Activity_ID",
           "measurements" = "Measurement_Type"))

alldata_tidy2 <- as.data.frame(t(alldata_tidy))
alldata_tidy2 <- alldata_tidy2[-(1:3),]
alldata_tidy2 <- data.frame(Average_Measurement_Value = unlist(alldata_tidy2))

finaldata_tidy <- cbind(tidy1, alldata_tidy2$Average_Measurement_Value) 

finaldata_tidy <- finaldata_tidy %>%
  rename(c("alldata_tidy2$Average_Measurement_Value" = "Average_Measurement_Value",
           "Activity_ID" = "Activity_Name"))
write.table(finaldata_tidy, 
            "./coursera_getcleandata_assignment/tidydata.txt", 
            row.names = FALSE,
            col.names = TRUE,
            quote = FALSE)