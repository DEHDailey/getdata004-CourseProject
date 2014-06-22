# Coursera getdata-004 Course Project for DEHDailey: README file

This README file explains the process used in the run_analysis.R script to summarize data from the Univserity of California--Irvine Machine Learning Repository dataset titled "Human Activity Recognition Using Smartphones" (HARUS).

## Introduction

The HARUS dataset is fully described at the homepage for the project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  The specific data summarized for this project were retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on June 17, 2014.

The essential idea of the dataset is that it contains sets of values obtained from smartphone accelerometers and gyroscopes, worn by each of 30 people while the people engaged in different sorts of physical activity (such as sitting, walking, standing, and so forth).  Sensor values were read at specific time intervals, and a person's activity type was judged by viewing video taken while the sensor values were being read.  The sensor data were collected into one data file, the subject numbers into a second data file, and numbers corresponding to the judged activity into a third data file.  Each of these data files was then split into a training dataset (approxitely 70% of the observations) and a test dataset.

Our current project does not deal with the machine-learning aspect of this dataset (which would attempt to find combinations of sensor values that would effectively predict the person's physical activity).  Instead, we are interested in summarizing particular kinds of variables within the dataset, and providing summary values for each combination of subject and activity.

We have been given an outline of steps to be performed on the data set.  The remainder of this README document lists those steps and the actions taken within the code to accomplish those steps.

The zip file from which I downloaded the dataset contains a folder, which itself contains additional folders and files.  My code runs under the assumption that the unzipped folder "UCI HAR Dataset" resides in the same directory as the script run_analysis.R, and that the subfolders are retained in the folder structure that they followed in the zip file.

## Project Step 1: Merge the training and the test sets to create one data set

Project Step 1 involves reading data from disk and merging the data into a single dataset useful for our purposes.

To accomplish Project Step 1, I took the following actions:
 * Establish a variable to contain the name of the data folder.  This will later be used as an argument to file.path() commands toretrieve data.
 
 * Read data from a file mapping descriptive activity labels to their category numbers.  This file contained 6 observations of 2 variables.  This label mapping will be used in a later step.
 
 * Read data from a file containing labels for each of the features in the datafile read from the smartphone sensors.  This file contained 561 observations of 2 variables: a numeric sequence from 1 to 561, and individual variable labels that are fully described in the original dataset's file named "features_info.txt".
 
 * Transform the feature labels into syntactically valid column names by applying the make.names() function.
 
 * Create a set of column names for the full data by concatenating a column label for the subject number; a column label for the activity number; and the syntactically correct feature labels.
 
 * Separately for the test set and the training set:
  * Using read.table(), read in the three data files containing the subject number, activity number, and sensor values; each resulting data.frame became an element of a list;

  * Use do.call( cbind, ... ) on the list to column-bind the data.frames read in previous step;

  * Apply the constructed vector of column labels to the column-bound data.frame containing 563 variables.

  * Save the constructed data.frame to disk as an rdata object;

  * Wrap this read-and-construct process in an if statement that checks to see if the file is already on the disk (this saves the processing time to read and cbind() the large tables on subsequent runs of the code);

  * Load the rdata object into the workspace.

 * Lastly, use rbind() to stack the test and training data into a single data.frame containing 10299 observations of 563 variables.  In my code, I call this data.frame `fullSet`.
 
## Project Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

In Project Step 2, we are interested in selecting only the variables that represent means and standard deviations of other measurements amongst the sensor data.  A visual examination of the feature labels (in the `features.txt` data file), and a reading of the description of those labels (in `features_info.txt`) shows that we are interested in features that include "mean()" or "std()" in their names.

Previously, I have used the feature labels to construct column labels for `fullSet`.  However, when these labels were converted into syntactically correct column names, the parenthesis were converted to periods.  So instead of looking for "mean()" and "std()" in the column labels, I need to look for "mean.." and "std.." as part of the column lables.

Additionally, I want to retain information about subject number and activity number.

Specific actions taken to accomplish Step 2:

* Construct a vector of column numbers that I want to keep, in `keepCols`:
  * Establish `idCols` to hold values 1:2 (the first two columns)
  * Establish 'meanCols' to hold the indexes of the column labels containing "mean.." as found by using the grep() function.
  * Establish `stdCols` to hold the indexes of the column labels containing "std.." as found by using the grep() function.
  * Concatenate and sort these three vectors of column numbers into a single vector.
  
* Create a data.frame of working values, called `workingSet`, by using the `keepCols` vector as column indexes to subset `fullSet`.

I chose to keep only the variables containing `mean()`, and not those containing `meanFreq()`, because my reading of the `features_info.txt` file, the `meanFreq()` variables contain something very different from accelerometer readings.  Additionally, the `meanFreq` variables are not paired with variables containing a standard deviation.  If I were analyzing this dataset for a real-world customer, I would confer with the customer to verify whether or not the `meanFreq()` variables should be included in `workingSet`.


## Project Step 3: Use descriptive activity names to name the activities in the data set

In Project Step 3, we want to include the descriptive activity labels provided in `activity_labels.txt` in our data.frame().  This allows for labels such as WALKING, SITTING, STANDING instead of numeric labels such as 1, 4, 5.

Specific action taken to accomplish Step 3:

* Create a vector of activity labels that match up with the activity numbers in `workingSet`.  I used the with() function to more easily specify variables within the dataset, and the match() function to locate the position of each of the 10,299 activity numbers within the table that maps activity numbers onto activity labels.  This creates a vector, `workingLabels`, with 10,299 character elements.
* Insert the vector of labels into `workingSet` next to the column of activity numbers.
* Double-check that each activity number was mapped to one and only one activity label.

## Project Step 4: Appropriately label the data set with descriptive variable names.

In Project Step 4, we want to make sure that our data set uses descriptive variable names.

This goal has already been nearly accomplished by using the information from `features.txt` to create column names back in Step 1.  However, now I need to clean up those names to get rid of the dots.  (I needed to keep the dots for a little while so I could extract column names that included "mean..".)

Action taken:

* Use `gsub()` to search the column names for dots and replace them with empty strings.  Note that the first argument to `gsub()` is interpreted as a regular expression (in which the dot is a wildcard) unless I use the additional argument `fixed=TRUE`.


## Project Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.

For Project Step 5, we want to collapse the information in the 10,299 rows of `workingSet` into a single row for each combination of subject number and activity label.  There are 30 subject numbers and 6 activity labels, so the final data set will have 180 observations.

Actions taken:

* Use the `aggregate()` function to compute the mean of data subsets.  Subsets are identified by the combinations of values noted in the `by=` argument; in this case, `SubjectNum` and `ActivityLabel`.  The result, along with the grouping variables, is kept in an R object I have called `meanBySubjectActivity`.
* Create meaningful column names for the aggregated variables.  This is accomplished through the `sprintf()` function to prepend "Mean_" to the beginning of the variable names for which I computed means.
* Write the data to disk using the `write.table()` function.  The `row.names=FALSE` argument omits the row numbers.  The `sep=','` and `quote=TRUE` arguments allow this file to be easily read as a CSV file.

