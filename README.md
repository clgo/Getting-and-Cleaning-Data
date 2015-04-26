Getting and Cleaning Data Course Project
========================================
This file describes how run_analysis.R script.
* Step 1: download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, data is unzip into "UCI HAR Dataset" folder in R working directory.
* Step 2: Download the run_analysis.R file load it into RStudio
* Step 3: Use source("run_analysis.R") command in RStudio. 
* Step 4: An output file "tidy_data.txt" (180 x 83 dimension) will be created in the working directory after running the "run_analysis.R" script file.
* Step 5: Use data <- read.table("tidy_data.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 79 features. 