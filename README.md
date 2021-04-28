READ ME 
=======
Getting-and-Cleaning-Wearable-Computing-Data
--------------------------------------------
The repository "Getting and Cleaning Wearable Computing Data" is my submission for the the final project of the Getting and Cleaning Data course, a part of John's Hopkins University Data Science Specialization.  

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

CONTENT
-------

The following can be found in this repo: 
My script, 'run_analysis.R' that does the following:
1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement. 
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names. 
5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

README.md, the file you are currently reading to explain how to script works and how the files are connected. 
'CodeBook.md' is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

'TidyData.txt' is a tidy data set, the output of run_analysis.R, that has the mean and standard deviation for each measurments with the subject ID and the activities performed.
