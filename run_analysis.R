# This script assumes that the user has downloaded the data from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and has unzipped the data onto their local machine.
# This script should be run from the top level directory created by this process: UCI HAR Dataset
# It creates an output file: averages.txt in this directory.

# First load the data from the test subdirectory
data_test<-read.table("test/X_test.txt")
subjects_test<-read.table("test/subject_test.txt")
labels_test<-read.table("test/y_test.txt")

# Next load the data from the train subdirectory
data_train<-read.table("train/X_train.txt")
labels_train<-read.table("train/y_train.txt")
subjects_train<-read.table("train/subject_train.txt")

# Combine the two datasets into one
data<-rbind(data_test,data_train)
labels<-rbind(labels_test,labels_train)
subjects<-rbind(subjects_test,subjects_train)

#Tidy up
rm(data_train)
rm(data_test)
rm(labels_train)
rm(labels_test)
rm(subjects_train)
rm(subjects_test)

# Load feature info - these will be the names of the columns of the data dataframe
features<-read.table("features.txt")
# and tidy up to remove characters we don't like
features2<-gsub("[(),-]","",features[,2])

# Restrict data to those features relating to feature mean and std
# As described in the code book this reduces dataset to 66 features
data_rest<-data[,grepl("(mean|std)([^F]|$)",features2)]
# and add in the correct names 
names(data_rest)<-grep("(mean|std)([^F]|$)",features2, value=TRUE)

# We are now going to add in the subject for each record by
# first setting the column name
names(subjects)<-c("subject")
# and adding into data frame
data_rest$subject <- subjects$subject

# We now have to convert the number corresponding to  the activity stored in labels
# to its descriptive text. The look-ups for these are stored in activity_labels so
# read it in
label_decode <-read.table("activity_labels.txt")
# set the column names for both dataframes
names(label_decode)=c("id","activity")
names(labels)=c("id")
# and join together to get label for each record
joinlabels = join(labels,label_decode, by="id")
# Now add these into the data frame
data_rest$activity <- joinlabels$activity

# Tidy up some more
rm(data)
rm(features)
rm(label_decode)
rm(labels)
rm(joinlabels)
rm(subjects)
rm(features2)

# data_rest now consists of 68 variables: the 66 features, and identifiers for subject
# and activity. We need to average over the 66 features and group by subject and activity
agg<-aggregate(. ~ subject + activity, data = data_rest,mean)
# and reorder for user convenience
orderagg<-agg[order(agg$subject,agg$activity),]
rownames(orderagg)<-NULL

# tidy up data by rounding averages to sensible number of decimal places
tidyagg<-orderagg
tidyagg[,3:68]<-round(orderagg[,3:68], digits=4)

# Finally write to file
write.table(tidyagg,file="averages.txt",row.names=FALSE)
