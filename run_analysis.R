## Getting and Cleaning Data Course (Coursera/John Hopkins)
## Making a tidy data frame
## 
#Substitute with your appropriate path
root <- file.path("C:","R","Coursera_GettingAndCleaningData","Project","Dataset")
## Reading data files
  #Test set (files)
    DataTest_file <- file.path(root, "test","X_test.txt")
    SubjTest_file <- file.path(root, "test","subject_test.txt")
    yTest_file <- file.path(root, "test","y_test.txt")
  #Test set (data frames)
    DataTest <- data.frame(read.table(DataTest_file))
    SubjTest <- data.frame(read.table(SubjTest_file))
    yTest <- data.frame(read.table(yTest_file))
  #Train set (files)
    DataTrain_file <- file.path(root, "train","X_train.txt")
    SubjTrain_file <- file.path(root, "train","subject_train.txt")
    yTrain_file <- file.path(root, "train","y_train.txt")
  #Train set (data frames)
    DataTrain <- data.frame(read.table(DataTrain_file))
    SubjTrain <- data.frame(read.table(SubjTrain_file))
    yTrain <- data.frame(read.table(yTrain_file))
  #reading features
    features_file <- file.path(root, "features.txt")
    features <- data.frame(read.table(features_file))
## Setting column names
    colnames(DataTest) <- c(as.character(features$V2))
    colnames(DataTrain) <- c(as.character(features$V2))
## Replace activity numbers (yTest and yTrain)
## 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
    ##yTest
    yTest$V1[as.character(yTest$V1) == "1"] <- "Walking"
    yTest$V1[as.character(yTest$V1) == "2"] <- "Walking_Upstairs"
    yTest$V1[as.character(yTest$V1) == "3"] <- "Walking_downstairs"
    yTest$V1[as.character(yTest$V1) == "4"] <- "Sitting"
    yTest$V1[as.character(yTest$V1) == "5"] <- "Standing"
    yTest$V1[as.character(yTest$V1) == "6"] <- "Laying"
    ##yTrain
    yTrain$V1[as.character(yTrain$V1) == "1"] <- "Walking"
    yTrain$V1[as.character(yTrain$V1) == "2"] <- "Walking_Upstairs"
    yTrain$V1[as.character(yTrain$V1) == "3"] <- "Walking_downstairs"
    yTrain$V1[as.character(yTrain$V1) == "4"] <- "Sitting"
    yTrain$V1[as.character(yTrain$V1) == "5"] <- "Standing"
    yTrain$V1[as.character(yTrain$V1) == "6"] <- "Laying"
## Adding columns
    #DataTest
    DataTest[,"Activity"]<-yTest
    DataTest[,"Subjet"]<-SubjTest
    #DataTrain
    DataTrain[,"Activity"]<-yTrain
    DataTrain[,"Subjet"]<-SubjTrain
## Merging data frames (Test and Train)
TidyFrame <- rbind(DataTest,DataTrain)
###END###
