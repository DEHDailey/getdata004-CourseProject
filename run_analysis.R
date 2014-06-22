## Getting and Cleaning Data
## Coursera getdata-004, June 2014
## Course Project: Human Activity Recognition Using Smartphones (HARUS)

## Project Step 1:
## Merges the training and the test sets to create one data set

datasetDir <- 'UCI HAR DataSet'

## Reading in data...

activityLabels <- read.table( file.path( datasetDir, 'activity_labels.txt' ),
                              col.names = c( 'ActivityNum', 'ActivityLabel' ) )

featureLabels <- read.table( file.path( datasetDir, 'features.txt' ),
                             col.names = c( 'FeatureNum', 'FeatureLabel' ),
                             ## Don't want these as factors b/c as characters, it
                             ## will be easier to locate the variables that are just
                             ## mean and sd
                             stringsAsFactors = FALSE )

## Construct the column names we want to use for the full data set
## From the inside out:
## a) create a character vector including the feature labels
## b) make names from those labels-- replaces nonsyntactic characters like parentheses with dots

columnNames <- make.names( 
                 c( 'SubjectNum', 'ActivityNum', featureLabels$FeatureLabel )
               )


## Search for rdata file with test data set; create it if it does not exist
if( !( 'testSet.rdata' %in% dir() ) ) {
  message( 'Test set not in working directory; creating data object.' )
  testSet <- do.call( cbind, list( read.table( file.path( datasetDir, 'test', 'subject_test.txt' ) ),
                                   read.table( file.path( datasetDir, 'test', 'y_test.txt' ) ), 
                                   read.table( file.path( datasetDir, 'test', 'X_test.txt' )  ) ) )
  colnames( testSet ) <- columnNames
  save( testSet, file='testSet.rdata' )
} else {
  message( 'Retrieving testset.rdata from disk' )
}
load( 'testSet.rdata' )

## Search for rdata file with training data set; create it if it does not exist
if( !( 'trainSet.rdata' %in% dir() ) ) {
  message( 'Training set not in working directory; creating data object.' )
  trainSet <- do.call( cbind, list( read.table( file.path( datasetDir, 'train', 'subject_train.txt' ) ),
                                    read.table( file.path( datasetDir, 'train', 'y_train.txt' ) ), 
                                    read.table( file.path( datasetDir, 'train', 'X_train.txt' )  ) ) )
  colnames( trainSet ) <- columnNames
  save( trainSet, file='trainSet.rdata' )
} else {
  message( 'Retrieving trainSet.rdata from disk' )
}
load( 'trainSet.rdata' )

fullSet <- rbind( testSet, trainSet )

## Project Step 2: 
## Extracts only the measurements on the mean and standard deviation for each measurement. 

## Choose which columns to keep from the full data set
idCols   <- c( 1, 2 )  # Columns for subject number and activity number
meanCols <- grep( 'mean..', columnNames, fixed=TRUE )  # Columns with "mean()" in original variable name
stdCols  <- grep( 'std..' , columnNames, fixed=TRUE )  # Columns with "std()" in original variable name

## Connect all the kept column numbers together; sort them to keep in original column order
keepCols <- sort( c(idCols, meanCols, stdCols ) )  

## Extract a working data set from the full data set
workingSet <- fullSet[, keepCols ]

## Project Step 3:
## Uses descriptive activity names to name the activities in the data set

## Apply activity labels
workingLabels <- with( activityLabels, 
                       ActivityLabel[ match( workingSet$ActivityNum, ActivityNum ) ] )

## Insert activity labels into the working data set (remember they are a factor!)
workingSet <- data.frame( workingSet[, c( 1:2 ) ],
                          ActivityLabel = workingLabels,
                          workingSet[, -c( 1:2 ) ] )

## Check your work!  Each number should map to one and only one label
## So each row and column of a table of numbers to labels should have one and only
## one nonzero entries.  Script will stop running if this is not the case.
aaTable <- with( workingSet, table( ActivityNum, ActivityLabel ) )
bbTable <- ( aaTable > 0 )
stopifnot( all( rowSums( bbTable ) == 1 ) & all( colSums( bbTable ) == 1 ) )

## Project Step 4:
## Appropriately labels the data set with descriptive variable names. 

## Already mostly done; feature labels from the features.txt file were assigned to
## testSet and trainSet as they were read in from the data directory.

## Tidy up the column names a bit by removing dots (left over from make.names()
## above)

colnames( workingSet ) <- gsub( '.', '', colnames( workingSet ), fixed=TRUE )


## Project Step 5:
## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject.

## Get the mean of each of the retained variables (which are themselves means and
## standard deviations) for each combination of SubjectNum and ActivityLabel
meanBySubjectActivity <- 
  aggregate( ## Don't take means of SubjectNum, ActivityNum, ActivityLabel
             workingSet[, -c(1:3) ],   
             
             ## Giving names to the list elements of by= will put those names into
             ## the data.frame that results from aggregate()
             by=list( SubjectNum    = workingSet$SubjectNum,       
                      ActivityLabel = workingSet$ActivityLabel ),
             FUN = mean )

## Produce meaningful column names for the variables with aggregated means
colnames( meanBySubjectActivity )[ -c( 1:2 ) ] <- 
  sprintf( 'Mean_%s', colnames( meanBySubjectActivity)[-c(1:2)])


## Write the aggregated data.frame out to disk
## Write to a text file, but in a comma-separated-value file format for easy portability
## Omit the default row.names (1, 2, etc).  Enclose strings in quotes.
write.table( meanBySubjectActivity, file= 'Tidy_Aggregate_HARUS.txt',
             row.names=FALSE, quote=TRUE, sep=',' )

