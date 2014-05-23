##   !  !  Explain wy Inertial Signals folders are ignored (summarized in X_test)
 
## 1. Get names from features.txt file
 
features <- read.table("./features.txt")  #reads in 561 by 2 data.frame
names <- as.character(features[,2]) #saves 2nd column to be used as variable names
 
## 2. Read in X_train file
 
x_train <- read.table("./train/X_train.txt")
 
## 3. Rename x_train variables
 
names(x_train) <- names
 
## 4. Read in subject_train file and rename column as subject_train
 
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "subject_train"
 
## 5. Read in y_train file and rename column as y_train
 
y_train <- read.table("./train/y_train.txt")
names(y_train) <- "y_train"
 
## 6. Change numbers to activity labels
 
activity <- read.table("./activity_labels.txt")
levels <- activity[,2]
y_train<- as.character(levels)[y_train[,1]]
        
## 7. Combine x_train, subject_train, and y_train into one data frame
 
df1 <- data.frame(x_train,subject_train, y_train)
 
#rename last two columns
 
names(df1)[562:563] <- c("subject","activity")
 
##### Repeat 2 - 6 with test data
 
x_test <- read.table("./test/X_test.txt")
 
## 3. Rename x_test variables
 
names(x_test) <- names
 
## 4. Read in subject_test file and rename column as subject_test
 
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) <- "subject_test"
 
## 5. Read in y_test file and rename column as y_test
 
y_test <- read.table("./test/y_test.txt")
names(y_test) <- "y_test"
 
## 6. Change numbers in y_test to activity names
 
activity <- read.table("./activity_labels.txt")
levels <- activity[,2]
y_test<- as.character(levels)[y_test[,1]]
 
## 7. Combine x_train, subject_train, and y_train into one data frame
 
df2 <- data.frame(x_test, subject_test, y_test)
 
#rename last two columns
 
names(df2)[562:563] <- c("subject","activity")
 
## 8. Combine training data and test data
 
df <- rbind(df1,df2)

## 9. Extract mean and sd columns


mean.sd.col <- grep("mean|Mean|std|activity|subject",names(df))

mean.sd <- df[ , mean.sd.col]


#######summarising

tidy.data = aggregate(mean.sd[,1:86], by=list(activity =mean.sd$activity, subject = mean.sd$subject),mean)

write.csv("tidy.data.csv")

