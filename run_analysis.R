# run_analysis.R - script that does the following:  
# 1. Merges the training and the test sets to create one data set.    
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.   
# 3. Uses descriptive activity names to name the activities in the data set  
# 4. Appropriately labels the data set with descriptive variable names.   
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.  

if(!file.exists("wearable-dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "wearable-dataset.zip", method="curl")  
  unzip("wearable-dataset.zip") 
  # creates directory: /UCI HAR Dataset/ containing "raw" data files
}


update.data = T

if(update.data) {
  rm(list = ls())
  # read in general metadata
  activity.labels = read.table("UCI HAR Dataset/activity_labels.txt") # activity names
  features = read.table("UCI HAR Dataset/features.txt") # activity data row names 

  # read in test data
  subject.test = read.table("UCI HAR Dataset/test/subject_test.txt") # person
  x.test = read.table("UCI HAR Dataset/test/X_test.txt") # activity data
  y.test = read.table("UCI HAR Dataset/test/y_test.txt") # activity labels
    
  # read in training data
  subject.train = read.table("UCI HAR Dataset/train/subject_train.txt") # person
  x.train = read.table("UCI HAR Dataset/train/X_train.txt") # activity data
  y.train = read.table("UCI HAR Dataset/train/y_train.txt") # activity labels  

  # name columns
  names(activity.labels) = c("activity.id", "activity.label")
    
  names(subject.test) = "subject.id"
  names(subject.train) = "subject.id"
  
  names(y.test) = "activity.id"
  names(y.train) = "activity.id"
  
  names(x.test) = features[, 2]
  names(x.train) = features[, 2]
  
  # List only the mean() and standard deviation, std(), variables for each of 
  # the 33 measurements listed in features-info.txt.  I am assuming that the *Mean 
  # vectors within the angle() measures and the meanFreq() measures are out of scope
  vars.to.keep = as.character(features[c(grep("mean[[:punct:]]|std[[:punct:]]", 
                                              x = features[, 2])), 
                                       2])
  
  # select just the mean() and std() columns from the x.* datasets
  # Reduces ncol from 561 to 66 for each (which would be expected for 2 x 33 measures)
  x.test.lim = x.test[, vars.to.keep]
  x.train.lim = x.train[, vars.to.keep]
  
  # first combine the 3 test-related datasets and the 3 train-related datasets
  test.data = cbind(subject.test, y.test, x.test.lim)
  test.data$group = "test"
  train.data = cbind(subject.train, y.train, x.train.lim)
  train.data$group = "train"
  
  # then combine test and train into a single dataset
  if(all(as.character(names(test.data)) != as.character(names(train.data)))){
    stop("it would be unwise to rbind datasets with differently named columns")
  } else {
    comb.data = rbind(test.data, train.data)      
  }
  
  # then add on the appropriate activity label for each activity id
  comb.data = merge(x = comb.data, y = activity.labels, by = "activity.id")

  # finally, create a second, independent tidy data set with the 
  #    average of each variable for each activity and each subject.
  library(reshape2)
  comb.melt = melt(comb.data, id = c("subject.id", "activity.id", "activity.label"), measure.vars = names(comb.data)[3:68])
  tidy.data = dcast(comb.melt, subject.id + activity.id + activity.label ~ variable, mean)
  
  write.csv(x = tidy.data, file = "output-tidy-dataset.csv")
}
