Project: Getting and Cleaning Data CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data. Pleaes refer to Readme.md file for where the data was downloaded and used in this project.


* The run_analysis.R script performs the following steps to clean the data:   

Step 1: Read the test and train data (3 text data files from each folder) from 'UCI HAR Dataset/train/' and 'UCI HAR Dataset/test' directory. 6 variables are created (x_train, y_train, subject_train, x_test, y_test, subject_test). The train data was combined into a single dataframe as m.train, and the test data was combined into a dataframe as m.test.

Step 2: merge Train data frame (m.train) with the Test data frame (m.test), using the rbind command and m.combine variable is created.

Step 3: Create a list of column names ("subject", "activity") and the measurements names stored in features.txt files (variable l.colname), and apply the column names to the m.combine variable created in Step 2.

Step 4: Get those columns in m.combine data frame which contains the "mean" and "std" and stores in two variables all_mean and all_std. And filter out those columns in m.combine data frame that contains these names using %in% and a variable filter.combine is created.

Step 5: Using Read.table command to read in the activity labels found under 'UCI HAR Dataset/activity_labels.txt' into a variable activity_label.

Step 6: A for loop was used to apply the activity_label to the activity column of filter.combine data frame, which numeric number matches the that in the activity_label variable column 1. e.g. 1 = walking.

Step 7: Using the aggreate command to mean function onto each of the subject and activity group. And the final tidy_data variable is created, with 180 x 81 dimension.

Step 8: Write the tidy_data into a text file ("tidy_data.txt")