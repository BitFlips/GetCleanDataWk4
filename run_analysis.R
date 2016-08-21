#---------------------------------------------------
# Name: run_analysis.R script
#
#   Performs the analysis for the week #4 assignment
#   in Getting and Cleaning Data class.
#
# Function:

#   This script will download and unzip the input 
#   files in the current working directory.
#
#   It then performs the analysis necessary to 
#   meet the Week 4 Assignment requirements.
#
#   Finally, a tidy_data.txt file is output to the
#   current working directory.
#
# Note:
#   See comments in code below for analysis details.
#
#---------------------------------------------------


#----------------------------------------------
# Download data from source and unzip files
#----------------------------------------------
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,"zipped.data") 
unzip("zipped.data")

#----------------------------------------------
# Read the required files into R tables
#----------------------------------------------
setwd("./UCI HAR Dataset")
act_labels <- read.table("activity_labels.txt")
feat       <- read.table("features.txt")
setwd("./train")
train_data <- read.table("X_train.txt")
train_act  <- read.table("y_train.txt")  
train_id   <- read.table("subject_train.txt")
setwd("../test")
test_data <- read.table("X_test.txt")
test_act  <- read.table("y_test.txt")  
test_id   <- read.table("subject_test.txt")
setwd("../");setwd("../")

#--------------------------------------------------------------------
# Req 4 part 1:  Assign descriptive Variable Names to tables 
#                Meaningful names assigned for activity and subject
#                variable names assigned: "activity" and "id" 
#                (makes downstream processing easier to understand)
#-------------------------------------------------------------------
names(train_act)   <- c("activity")
names(train_id)    <- c("id")
names(train_data)  <- feat$V2
names(test_act)    <- c("activity")
names(test_id)     <- c("id")
names(test_data)   <- feat$V2

#-------------------------------------------
# Column bind train files into single table
# Column bind test  files into single table
#-------------------------------------------
trainTable <- cbind(train_id,train_act,train_data)
testTable  <- cbind(test_id,test_act,test_data)

#-----------------------------------------------------------
# Req 1: Merge the train and test datasets into one dataset
#-----------------------------------------------------------
comboTable <- rbind(trainTable,testTable)

#-----------------------------------------------------------------
# Req 2: Extract only the mean and std measurements from dataset
#-----------------------------------------------------------------
idx_mean   <- grep("-mean\\(\\)",names(comboTable))
idx_std    <- grep("-std\\(\\)",names(comboTable))
mean_only  <- comboTable[,idx_mean]
std_only   <- comboTable[,idx_std]

mean_std   <- cbind(id=comboTable$id,activity=comboTable$activity,
                    mean_only,std_only)

#------------------------------------------------------------
# Req 3: Use Descriptive Activity Names to name activities 
#------------------------------------------------------------
mean_std$activity <- act_labels$V2[mean_std$activity]

#------------------------------------------------------------
# Req 4 part 2: Assign descriptive variable names to table
#               Address the measurement variable names here.
#               (Remove "()" ... not useful)
#               Also converted variable names to lower case
#               (ref. H. Wickam tidy data paperg)
#               Note: id and activity variable names 
#                     assigned in Req 4 part 1 above
#------------------------------------------------------------
names(mean_std) <- sub("\\(\\)","",names(mean_std))
names(mean_std) <- tolower(names(mean_std))

#-------------------------------------------------------------
# Req 5: Create an independent tidy dataset with variable
#        average measurements for each subject id and activity
#        So we have two level grouping on "id" and "activity"
#        This will yield 30*6 or 180 summary mean rows
#        (30 ids, 6 activities per id). 
#-------------------------------------------------------------
tidy_data <- aggregate(mean_std[,-c(1,2)],
                       list(mean_std$id,mean_std$activity),mean)
#-------------------------------------------------------------------
# Some cosmetic updates:
#   1) restore var names for excluded columns in aggregate command
#   2) make activities in table lower case
#   3) order by id then by activity (looks better per subject id)
#   4) remove original row names ... not needed here
#-------------------------------------------------------------------
names(tidy_data)[1] <- "id"
names(tidy_data)[2] <- "activity"
tidy_data$activity  <- tolower(tidy_data$activity)
tidy_data <- tidy_data[order(tidy_data$id,tidy_data$activity),]
rownames(tidy_data) <- NULL

#------------------------------------------------------------
# Write tidy_data to tidy_data.txt file in working directory
#------------------------------------------------------------
write.table(tidy_data,"tidy_data.txt")