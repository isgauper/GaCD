First, names are read in from the features.txt file. Then the training data (x_train), subjects (subject_train) and activity codes (y_train) are read in.  Activity labels are read in and assigned to the y_train activity codes. Then x_train, subject_train and y_train are combined into one data frame called "df1". 
The same procedure is repeated with the test data. The test data and training data are combined using rbind.
NoteSince the "Inertial Signals" data are summarized in the other data, they are ignored.

Mean and Standard deviation variables are extracted using grep

The data is then summarised using the "aggregate" function to take the mean across each variable for each activity and each subject.