
#SETTING WORKING DIRECTORY ON CLEANING DATA FOLDER INSIDE DIR 
getwd()
list.dirs()
list.files()

#READ DATA 
x_train   <- read.table("./X_train.txt")
y_train   <- read.table("./Y_train.txt") 
subject_train <- read.table("./subject_train.txt")

x_test   <- read.table("./X_test.txt")
y_test   <- read.table("./Y_test.txt") 
sub_test <- read.table("./subject_test.txt")
activity_labels <- read.table("./activity_labels.txt") 

features <- read.table("./features.txt") 

# MERGING OF TRAINING AND TEST DATA
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
sub_total <- rbind(subject_train, sub_test) 


sel_features <- variable_names[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]

x_total      <- x_total[,sel_features[,1]]
colnames(x_total)   <- sel_features[,2]
colnames(y_total)   <- "activity"
colnames(sub_total) <- "subject"
