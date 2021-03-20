#Packages
library(plyr)

#Load
if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/Dataset.zip")
unzip(zipfile = "./data/Dataset.zip",exdir = "./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files <- list.files(path_rf, recursive = TRUE)

y_test  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
y_train <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
subject_train <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
subject_test  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
x_test  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
x_train <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
features <- read.table(file.path(path_rf, "features.txt"),header = FALSE)
labels_act <- read.table(file.path(path_rf, "X_train.txt"),header = FALSE)

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
write.table(db2, file = "second_db.txt", row.names = FALSE)
