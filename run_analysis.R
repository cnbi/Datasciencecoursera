#Packages
library(plyr)

# Load data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./project/Dataset.zip")
features <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\features.txt")
x_train <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\train\\X_train.txt")
x_test <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\test\\X_test.txt")
subject_train <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\test\\subject_test.txt")
y_train <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\test\\y_test.txt")
labels_act <- read.table("C:\\Users\\ASUS\\Documents\\Data Science Especialization\\UCI HAR Dataset\\activity_labels.txt")

#Merge databases
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subjects <- rbind(subject_train, subject_test)

colnames(x) <- features$V2
colnames(y) <- "Activity"
colnames(subjects) <- "Subject"

db <- cbind(subjects, y, x)

#Extract means and standard deviations
means_desv_db <- db[ , grep("mean\\(\\)|std\\(\\)", colnames(db))]
means_desv_db <- cbind(means_desv_db, subjects, y)

#Activity names
means_desv_db$Activity <- factor(means_desv_db$Activity, levels = labels_act[, 1], labels = labels_act[ ,2])

#Rename variables
colnames(means_desv_db) <- gsub("^t", "Time", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("^f", "Frequency", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("Acc", "Accelerometer", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("Gyro", "Gyroscope", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("Mag", "Magnitude", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("BodyBody", "Body", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("[-()]", "", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("mean", "Mean", colnames(means_desv_db))
colnames(means_desv_db) <- gsub("std", "Std", colnames(means_desv_db))

#Avarage of each variable by activity and subject
db2 <- aggregate(.~Activity + Subject, means_desv_db, mean)
write.table(db2, file = "second_db.txt")

colnames(db2)
