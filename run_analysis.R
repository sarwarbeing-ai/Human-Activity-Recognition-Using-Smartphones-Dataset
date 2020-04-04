#Creating a r script will perform a wide range of tasks
#from merging datasets into a single data set
#Making an independent tidy data set from the merged
#dataset and writting the dataset into a text file


#first download the data and unzip it

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "./DataScienceRProgramming/data/smart.zip")

#unzipping the file
unzip(zipfile ="./DataScienceRProgramming/data/smart.zip",exdir = "./DataScienceRProgramming/data" )

###Merges the training and the test sets to create one data set.

#training set 

x_train <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/train/subject_train.txt")



#testing set 
x_test <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/test/subject_test.txt")


#feature vector 
features <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/features.txt")


#activity labels 

activity_labels <- read.table("./DataScienceRProgramming/data/UCI HAR Dataset/activity_labels.txt")


#Assigning column names to the training set, test set,y_train,y_test,subject_train,activity_labels and  subject_test

colnames(x_train) <- features[,2] #choosing second column as the first one is useless

colnames(y_train) <-"activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activity_labels) <- c('activityID','activityTYPE')


##Merging all the above  data sets into a single data set

merge_train <- cbind(y_train, subject_train, x_train) # here we are providing y and subject
#first and then training set because we want activityid and subjectid to be the frist two 
#columns
merge_test <- cbind(y_test, subject_test, x_test)

ONE<- rbind(merge_train, merge_test) # row merging will lead to the combination of train
# and test set


###Extracts only the measurements on the mean and standard deviation for each measurement

#Colnames of ONE
names<-colnames(ONE)

#Creating boolean vector to extract the only mean and std measurements from ONE
act<-grepl("activityID",names)
sub<-grepl("subjectID",names)
mn<-grepl("mean..",names)
sd<-grepl("std..",names)
# creating common vector by combining all the above vectors 
#By which we will get only the columns related to sct,sub,mean and sd 

common<-(act|sub|mn|sd)

#Extracting relevant columns

datasetExtracted<-ONE[,common]

###Uses descriptive activity names to name the activities in the data set
#Here we are going to merge datasetExtracted and activity_labels by 
#activityID
mergeExtractedlabels<-merge(datasetExtracted,activity_labels,by="activityID")

###Appropriately labels the data set with descriptive variable names
# for this section we have already done in previous steps by merging->
#extracting meaningful columns->associating activity labels


###creating a second, independent tidy data set with the 
###average of each variable for each activity and each subject.

#Here we will use aggregate function to find mean of each variable for each 
#subject and each activity
#For this we have used dot notation to segregate all variables except activity
#and subject Id
#It will group the data corresponding to each variable and then the mean will
#be returned for each subset corresponding to each variable

tidydata<-aggregate(.~subjectID+activityID,data=mergeExtractedlabels,mean)

write.table(tidydata,"sarwar.txt",row.name=FALSE  )


