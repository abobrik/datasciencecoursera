## load library dplyr and data.table. You might need to install these libraries first.
library("dplyr")
library("data.table")

## Change root path and separator according to your operating system 
## and the path you stored the data files
root_path<-"C:/Users/Annette Bobrik/Documents/R/UCI HAR Dataset"
sep<-"/"

## STEP 1: Merges the training and the test sets to create one data set.
## load train data
train_path<-paste(root_path, "train", sep=sep)

y_train<-read.table(paste(train_path,"y_train.txt", sep=sep))
X_train<-read.table(paste(train_path,"X_train.txt", sep=sep))
subject_train<-read.table(paste(train_path,"subject_train.txt", sep=sep))

## load test data
test_path<-paste(root_path, "test", sep=sep)

y_test<-read.table(paste(test_path,"y_test.txt", sep=sep))
X_test<-read.table(paste(test_path,"X_test.txt", sep=sep))
subject_test<-read.table(paste(test_path,"subject_test.txt", sep=sep))

## load feature names of test and train data
features<-read.table(paste(root_path,"features.txt", sep=sep))

## add names to data sets
names(y_test)<-"activity"
names(subject_test)<-"subject"
names(X_test)<-features[,2]

names(y_train)<-"activity"
names(subject_train)<-"subject"
names(X_train)<-features[,2]

## combine test data column-wise with first row as header
test<-cbind(X_test,subject_test,y_test, deparse.level=1)
## combine train data column-wise with first row as header
train<-cbind(X_train,subject_train,y_train, deparse.level=1)

## combine train and test data in one dataset
data<-rbind(train,test, deparse.level=1)

## STEP 2: 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## remove duplicate columns
data<-data[, unique(colnames(data))]

## select only columns containing mean or standard deviation values
subdata<-select(data,contains("mean"),contains("std"),contains("activity"),contains("subject"))

## STEP 3: 3.Uses descriptive activity names to name the activities in the data set
## Load activity names into table
activities<-read.table(paste(root_path,"activity_labels.txt",sep=sep))

## merge dataset with activity names, rename column
subdata<-merge(subdata,activities, by.x="activity", by.y="V1")
colnames(subdata)[colnames(subdata)=="V2"] <- "activity name"
## activity should be last

## STEP 4: Appropriately labels the data set with descriptive variable names. 
## transform columns names, remove conflicting characters ("(",")"...)
colnames(subdata)<-make.names(colnames(subdata),unique=TRUE)

## refine names
colnames(subdata) <- sub("std", replacement="Std", fixed=TRUE,x=names(subdata))
colnames(subdata) <- sub("mean", replacement="Mean", fixed=TRUE,x=names(subdata))
colnames(subdata) <- sub("..", replacement="", fixed=TRUE,x=names(subdata))

## STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average.data<-aggregate(. ~ subject + activity.name, data=subdata, FUN=mean)
## rename variables?

## FINAL: write averaged data to .txt-file
write.table(average.data,file=paste(root_path,"average_mean_std_values.txt",sep=sep),row.name=FALSE) 