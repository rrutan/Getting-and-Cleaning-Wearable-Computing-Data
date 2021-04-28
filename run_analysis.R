library(dplyr)
file <- "Getting_and_Cleaning_Wearable_Computing_Data.zip"

#checking for data files and downloading
if (!file.exists(file)&(!file.exists("UCI HAR Dataset"))) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url = fileURL, destfile = "./Getting_and_Cleaning_Wearable_Computing_Data.zip", method = "curl")
}
 if (!file.exists("UCI HAR Dataset")) {
   unzip(file)
 }

#Reading all data into data frames
setwd("./UCI HAR Dataset")
features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code","activity"))
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$functions)
x_train <- read.table("./train/X_train.txt", col.names = features$functions)
y_test <- read.table("./test/y_test.txt", col.names = "code")
y_train <- read.table("./train/y_train.txt", col.names = "code")

#Combine test and training data 
subject <- rbind(subject_train, subject_test)
y <- rbind(y_train,y_test)
x <- rbind(x_train, x_test)
combinedData <- cbind(subject, y,x)

#Extract only the measurements on the mean and standard deviation for each measurement
Data <- select(combinedData,subject,code,contains("mean"),contains("std"))

#Uses descriptive activity names to name the activities in the data set
Data$code <- activities[Data$code,2]

 
names(Data)[1:2] <- c("Subject","Activity")
names(Data) <- gsub("Acc","Accelerometer", names(Data))
names(Data) <- gsub("^t","Time",names(Data))
names(Data) <- gsub("^f","Frequency",names(Data))
names(Data) <- gsub("Gyro","Gyroscope",names(Data))
names(Data) <- gsub("Mag","Magnitude",names(Data))
names(Data) <- gsub("BodyBody","Body",names(Data))
names(Data) <- gsub("-Freq","Frequency",names(Data))
names(Data) <- gsub("tBody","TimeBody",names(Data))

#reates a second, independent tidy data set with the average of each variable 
#for each activity and each subject
TidyData <- Data %>% group_by(Subject, Activity) %>% summarize_all(mean)

write.table(TidyData, file="TidyData.txt", row.name=FALSE)
print ("The script 'run_analysis.R' was executed successfully. The file TidyData.txt has been saved in the working directory, in folder UCI HAR Dataset.")
