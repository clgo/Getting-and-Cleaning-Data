# merge Train data,
# subject_train.txt as column 1, y_train as column 2, rest of X_Train data on column 3 onwards
x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
# m.train <- Reduce(function(...) merge(..., all=TRUE), list(subject_train, y_train, x_train))
m.train <- as.data.frame(append(subject_train,y_train),after=1)
m.train <- as.data.frame(append(m.train,x_train),after=1)

# merge Train data,
# subject_test.txt as column 1, y_test as column 2, rest of X_test data on column 3 onwards
x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
# m.test <- Reduce(function(...) merge(..., all=TRUE), list(subject_train, y_train, x_train))
m.test <- as.data.frame(append(subject_test,y_test),after=1)
m.test <- as.data.frame(append(m.test,x_test),after=1)

# combine m.train and m.test into a single variable, m.combine
# answer to Step 1
m.combine<-rbind(m.test,m.train)

# note that column 1 and 2 might not be neccessary
# read in the features.txt in 'UCI HAR Dataset' directory
features <- read.table('UCI HAR Dataset/features.txt')
# Create a list of column names, to be apply to m.combine data
l.colname <- c("subject","activity",as.vector(features$V2))
# add column names to m.combine data
colnames(m.combine) <- l.colname
# get all the column names with mean
all_mean <-grep("mean", l.colname, value=TRUE)
# get all the column names with std
all_std <- grep("std", l.colname, value=TRUE)

# get the index of column names in m.combine which has the 
# column name of all_mean and all_std
# Answer to Step 2 & Step 4 labelling the column name with activity.txt
filter.combine <- m.combine[,(names(m.combine) %in% c("subject","activity",all_mean,all_std))]

# read in the activity_labels.txt
activity_label <- read.table('UCI HAR Dataset/activity_labels.txt')


for(n in 1:nrow(activity_label))
{
    filter.combine$activity[filter.combine$activity == activity_label[n,1]] <- as.character(activity_label[n,2])        
}


# create a tidy data set with mean apply to each subject on each activity for each variables.
tidy_data <- aggregate(filter.combine[,3:81],list(filter.combine$subject,filter.combine$activity),mean)
names(tidy_data)[1] <- "subject"
names(tidy_data)[2] <- "activity"

# write the tidy_data into a text file.
write.table(tidy_data,"tidy_data.txt",row.names=FALSE)
