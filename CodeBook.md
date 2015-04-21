# About CodeBook.md 

This document (CodeBook.md) is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data for the Coursera - Getting and Cleaning Data Course Project. 

From the Course Project Description:
"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]  

Data read from url:  
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]  

## Data
More info can be found in the "UCI Dataset.zip" "README.txt" file.  

The output from the run_analysis.R script is:  
output-tidy-dataset.csv

## output-tidy-dataset.csv variables  
subject.id  : numeric identification code for a particular subject (person) (e.g., 1)  
activity.id : numeric identification code for a particular activity type (e.g., 1)  
activity.label : human readable text description of a particular activity type (e.g., WALKING)   
group : identifies which dataset the observation is from ("test" or "train")  
  
measurement variable names and descriptions can be found in the "UCI Dataset.zip" file "features_info.txt" and additional information can be found in its "README.txt"  
Note that each of the measurments in this file is the average (mean) for the given subject 
and activity, per the course instructions.

## Transformations
### Combining: 
Appended (horizontally) the following training files:  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels (activity.id).  
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (subject.id).  

Appended (horizontally) the following test files:  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels (activity.id).  
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (subject.id).  

Appended (vertically) the test and train data.

### Labeling:  
Labeled columns for the test and train X_*.txt files using the second column of:  
- 'features.txt': List of all features.  

Labeled columns for the test and train Y_*.txt files using the linkage in:
- 'activity_labels.txt': Links the class labels with their activity name.

### Subsetting:
Selected only variables from the features.txt file who had mean() or std() in their name.
See features_info.txt for the full list of all 33 measures available.  I assumed that the *Mean vectors within the angle() measures and the meanFreq() measures are out of scope

### Maths:
The only maths performed on this dataset was per the instructions:
- report the average of each variable for each activity and each subject (output-tidy-dataset.txt)


