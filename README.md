# Human-Activity-Recognition-Using-Smartphones-Dataset
#Peer Graded Assignment-Getting and Cleaning Data(COURSERA)

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

The run_analysis.R performing a wide  range of tasks from merging to create an independent tidy data set.


#THE DESCRIPTIONS ABOUT THE R SCRIPT run_analysis.R are given below


1.merging the training and test set to create one
(a) Reading training set 
(b) Reading testing set
(c) Reading feature vector
(d) Reading activity labels
(e) Assigning column names to the reading training set and reading test set 
(f) Merging all data sets(a-b-c-d) into a single data set


2.Extracting only the measurements on the mean and standard deviation for each measurement
(a) Reading column names from the dataset obtained from merging all data set  
(b) Create a boolean  vector using regular expression  for defining ID, mean and standard deviation and this will be used to extrcat columns from the dataset obtained from merging all data sets 
(c) extract columns from merged data set using the vector defined in (b)


3.Uses descriptive activity names to name the activities in the data set


4.Appropriately labels the data set with descriptive variable names.


5.From the data set in step 4, createing  a second, independent tidy data set with the average of each variable for each activity and each subject.
(a) creating  second independent  tidy data set
(b)Writing the tidy data set into a  txt file
