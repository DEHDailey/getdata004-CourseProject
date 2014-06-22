# Coursera getdata-004 Course Project for DEHDailey: Codebook

This codebook describe the variables included in the data file `Tidy_Aggregate_HARUS.txt` as created by my script `run_analysis.R`.  See the associated README file for a decription of the processes used to create this data file.

`Tidy_Aggregate_HARUS.txt` contains a single observation for each of the 180 combinations of subject and activity.  Each of the 180 observations contains the mean of the mean measurement and the mean of the standard deviation of the measurements from gyroscope and accelerometer sensors inside a smartphone worn during various sorts of physical activity.

Variable names are chosen to be quickly related to the variable names of the original dataset.  The original variable names contained characters, such as a hyphen and parentheses, that can be problematic for analysis; those characters have been removed here.

According to the documentation for the original dataset, all gyroscope and accelerometer measurements were normalized and bounded within the interval from -1.000 to +1.000.


Variable Name                 | Variable Label
-------------                 | --------------
SubjectNum                    | Subject Number.  An integer ranging from 1 to 30 inclusive.
ActivityLabel                 | Activity Label.  A character string identifying the subject's action.  Possible values:
                              |   LAYING
                              |   SITTING
                              |   STANDING
                              |   WALKING
                              |   WALKING_DOWNSTAIRS
                              |   WALKING_UPSTAIRS
Mean_tBodyAccmeanX            | Mean of the mean X-axis observation of the time-domain body acceleration signal.
Mean_tBodyAccmeanY            | Mean of the mean Y-axis observation of the time-domain body acceleration signal.
Mean_tBodyAccmeanZ            | Mean of the mean Z-axis observation of the time-domain body acceleration signal.
Mean_tBodyAccstdX             | Mean of the standard deviation of X-axis observations of the time-domain body acceleration signal.
Mean_tBodyAccstdY             | Mean of the standard deviation of Y-axis observations of the time-domain body acceleration signal.
Mean_tBodyAccstdZ             | Mean of the standard deviation of Z-axis observations of the time-domain body acceleration signal.
Mean_tGravityAccmeanX         | Mean of the mean X-axis observation of the time-domain gravity accelaration signal.
Mean_tGravityAccmeanY         | Mean of the mean Y-axis observation of the time-domain gravity accelaration signal.
Mean_tGravityAccmeanZ         | Mean of the mean Z-axis observation of the time-domain gravity accelaration signal.
Mean_tGravityAccstdX          | Mean of the standard deviation of X-axis observations of the time-domain gravity accelaration signal.
Mean_tGravityAccstdY          | Mean of the standard deviation of Y-axis observations of the time-domain gravity accelaration signal.
Mean_tGravityAccstdZ          | Mean of the standard deviation of Z-axis observations of the time-domain gravity accelaration signal.
Mean_tBodyAccJerkmeanX        | Mean of the mean X-axis observation of the time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkmeanY        | Mean of the mean Y-axis observation of the time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkmeanZ        | Mean of the mean Z-axis observation of the time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkstdX         | Mean of the standard deviation of X-axis observations of the time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkstdY         | Mean of the standard deviation of Y-axis observations of the time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkstdZ         | Mean of the standard deviation of Z-axis observations of the time-domain body linear acceleration jerk signal.
Mean_tBodyGyromeanX           | Mean of the mean X-axis observation of the time-domain body angular velocity signal.
Mean_tBodyGyromeanY           | Mean of the mean Y-axis observation of the time-domain body angular velocity signal.
Mean_tBodyGyromeanZ           | Mean of the mean Z-axis observation of the time-domain body angular velocity signal.
Mean_tBodyGyrostdX            | Mean of the standard deviation of X-axis observations of the time-domain body angular velocity signal.
Mean_tBodyGyrostdY            | Mean of the standard deviation of Y-axis observations of the time-domain body angular velocity signal.
Mean_tBodyGyrostdZ            | Mean of the standard deviation of Z-axis observations of the time-domain body angular velocity signal.
Mean_tBodyGyroJerkmeanX       | Mean of the mean X-axis observation of the time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkmeanY       | Mean of the mean Y-axis observation of the time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkmeanZ       | Mean of the mean Z-axis observation of the time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkstdX        | Mean of the standard deviation of X-axis observations of the time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkstdY        | Mean of the standard deviation of Y-axis observations of the time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkstdZ        | Mean of the standard deviation of Z-axis observations of the time-domain body angular velocity jerk signal.
Mean_tBodyAccMagmean          | Mean of the mean magnitudes of the 3-dimensional time-domain body acceleration signal.
Mean_tBodyAccMagstd           | Mean of the standard deviation of the magnitudes of the 3-dimensional time-domain body acceleration signal.
Mean_tGravityAccMagmean       | Mean of the mean magnitudes of the 3-dimensional time-domain gravity acceleration signal.
Mean_tGravityAccMagstd        | Mean of the standard deviation of the magnitudes of the 3-dimensional time-domain gravity acceleration signal.
Mean_tBodyAccJerkMagmean      | Mean of the mean magnitudes of the 3-dimensional time-domain body linear acceleration jerk signal.
Mean_tBodyAccJerkMagstd       | Mean of the standard deviaton of the magnitudes of the 3-dimensional time-domain body linear acceleration jerk signal.
Mean_tBodyGyroMagmean         | Mean of the mean magnitudes of the 3-dimensional time-domain body angular velocity signal.
Mean_tBodyGyroMagstd          | Mean of the standard deviation of the magnitudes of the 3-dimensional time-domain body angular velocity signal.
Mean_tBodyGyroJerkMagmean     | Mean of the mean magnitudes of the 3-dimensional time-domain body angular velocity jerk signal.
Mean_tBodyGyroJerkMagstd      | Mean of the standard deviation of the magnitudes of the 3-dimensional time-domain body angular velocity jerk signal.
Mean_fBodyAccmeanX            | Mean of the mean Fast Fourier Transformed (FFT) X-axis observation of the time-domain body acceleration signal.
Mean_fBodyAccmeanY            | Mean of the mean FFT Y-axis observation of the time-domain body acceleration signal.
Mean_fBodyAccmeanZ            | Mean of the mean FFT Z-axis observation of the time-domain body acceleration signal.
Mean_fBodyAccstdX             | Mean of the standard deviations of FFT X-axis observations of the time-domain body acceleration signal.
Mean_fBodyAccstdY             | Mean of the standard deviations of FFT Y-axis observations of the time-domain body acceleration signal.
Mean_fBodyAccstdZ             | Mean of the standard deviations of FFT Z-axis observations of the time-domain body acceleration signal.
Mean_fBodyAccJerkmeanX        | Mean of the mean FFT X-axis observation of the time-domain body linear acceleration jerk signal.
Mean_fBodyAccJerkmeanY        | Mean of the mean FFT Y-axis observation of the time-domain body linear acceleration jerk signal.
Mean_fBodyAccJerkmeanZ        | Mean of the mean FFT Z-axis observation of the time-domain body linear acceleration jerk signal.
Mean_fBodyAccJerkstdX         | Mean of the standard deviations of FFT X-axis observations of the time-domain body linear acceleration jerk signal.
Mean_fBodyAccJerkstdY         | Mean of the standard deviations of FFT Y-axis observations of the time-domain body linear acceleration jerk signal.
Mean_fBodyAccJerkstdZ         | Mean of the standard deviations of FFT Z-axis observations of the time-domain body linear acceleration jerk signal.
Mean_fBodyGyromeanX           | Mean of the mean FFT X-axis observation of the time-domain body angular velocity jerk signal.
Mean_fBodyGyromeanY           | Mean of the mean FFT Y-axis observation of the time-domain body angular velocity jerk signal.
Mean_fBodyGyromeanZ           | Mean of the mean FFT Z-axis observation of the time-domain body angular velocity jerk signal.
Mean_fBodyGyrostdX            | Mean of the standard deviations of FFT X-axis observations of the time-domain body angular velocity jerk signal.
Mean_fBodyGyrostdY            | Mean of the standard deviations of FFT Y-axis observations of the time-domain body angular velocity jerk signal.
Mean_fBodyGyrostdZ            | Mean of the standard deviations of FFT Z-axis observations of the time-domain body angular velocity jerk signal.
Mean_fBodyAccMagmean          | Mean of the mean FFT magnitudes of the 3-dimensional time-domain body acceleration signal.
Mean_fBodyAccMagstd           | Mean of the standard deviation of the FFT magnitudes of the 3-dimensional time-domain body acceleration signal.
Mean_fBodyBodyAccJerkMagmean  | Mean of the mean FFT magnitudes of the 3-dimensional time-domain body linear acceleration jerk signal.
Mean_fBodyBodyAccJerkMagstd   | Mean of the standard deviaton of the FFT magnitudes of the 3-dimensional time-domain body linear acceleration jerk signal.
Mean_fBodyBodyGyroMagmean     | Mean of the mean FFT magnitudes of the 3-dimensional time-domain body angular velocity signal.
Mean_fBodyBodyGyroMagstd      | Mean of the standard deviation of the FFT magnitudes of the 3-dimensional time-domain body angular velocity signal.
Mean_fBodyBodyGyroJerkMagmean | Mean of the mean FFT magnitudes of the 3-dimensional time-domain body angular velocity jerk signal.
Mean_fBodyBodyGyroJerkMagstd  | Mean of the standard deviation of the FFT magnitudes of the 3-dimensional time-domain body angular velocity jerk signal.

Note that the last several variable names contain `fBodyBody`, which appears to be an error in the construction of the variable names in the original dataset.  The variable names in the new, aggregated data set continue to use the duplicated `Body`so as to maintain consistency with the work of the original researchers.