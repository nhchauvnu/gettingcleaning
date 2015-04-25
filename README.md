# Getting and cleaning data course
The run_analysis.R performs the following steps:
## Step 1: Merge the training and test data sets
Training data set
test data set
merge training and test data sets
## Step 2
Extracts only the measurements on the mean and standard deviation for each measurement
## Step 3
Uses descriptive activity names to name the activities in the data set
## Step 4
Appropriately labels the data set with descriptive variable names
## Step 5
From the data set in step 4, creates a second,
independent tidy data set with the average of each
variable for each activity and each subject
## How to run the script:
Start R and type the following command from R prompt:
```
source('run_analysis.R', echo=TRUE)
```

## Others
To run the script successfully, the script must be located in
the same directory with the data directory named "UCI HAR Dataset/".

On completion, the R script will create a data file named 'tidy.txt' in
the same directory.
