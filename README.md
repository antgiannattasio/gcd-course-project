# gcd-course-project
Coursera - Getting And Cleaning Data - Course Project

This README.md in the repo with your scripts. This file explains how all of the scripts in this repo work and how they are connected.  

## About the Project:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Scripts and Files

1. README.md - this file  
2. CodeBook.md - a codebook (data dictionary) explaining the variables, data, and any transformations or work that I performed to clean up the data.  
3. run_analysis.R - data processing script that does the following:  
    1. Reads all the files into data.frames
    2. Names the columns of the data.frames appropriately (based on the 33 measures in features-info.txt)
    3. Extracts only the 33 mean() and 33 std() variables for each measurement.   
    4. Merges the training and the test sets to create one data set.    
    5. Uses descriptive activity names to name the activities in the data set  
    6. Appropriately labels the data set with descriptive variable names.   
    7. From this combined and labeled data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.  
4. output-tidy-dataset.txt (tidy dataset produced by step 3 above, and output from the run_analysis.R script)  
