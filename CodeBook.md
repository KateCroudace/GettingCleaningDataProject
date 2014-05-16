Human Activity Recognition Using Smartphones Dataset
----------------------------------------------------

The raw data used in this project is available from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Relevant information associated with this dataset is repeated below:

###Background###
Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

###Feature Selection####
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
* 
### Restricted data set produced for analysis ###
The data used was the entire set of experiment results obtained from recombining the training and test data sets. The variables were restricted to the mean and standard deviation of the 17 features. With 8 of the 17 features having three components (XYZ) this reduced the total number of variables considered to 2(8x3 + 9) = 66 variables.

The variables were labelled using the names contained within the original dataset, (and defined in its associated file features.txt), stripping out non-standard characters such as brackets, commas and hyphens to produce names that conform more closely to R standards. Note capitalisation was retained for ease of readability. Each of the 66 variables were averaged over each student/activity combination, with the results contained in the text file averages.txt. 
Each row of averages.txt corresponds to the mean values for each of the 66 variables, rounded to 4 decimal places, for a particular subject and activity. With 30 subjects and 6 activities, the file therefore contains a total of 180 records. The values on a line are space-separated and consist of the following:

* subject: numeric identifier of the subject, taking values from 1 to 30
* activity: string describing activity being undertaken. One of {LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS}.
* tBodyAccmeanX: numeric, average mean of tBodyAcc, X component
* tBodyAccmeanY: numeric, average mean of tBodyAcc, Y component
* tBodyAccmeanZ: numeric, average mean of tBodyAcc, Z component
* tBodyAccstdX: numeric, average standard deviation of tBodyAcc, X component
* tBodyAccstdY: numeric, average standard deviation of tBodyAcc, Y component
* tBodyAccstdZ: numeric, average standard deviation of tBodyAcc, Z component
* tGravityAccmeanX: numeric, average mean of tGravityAcc, X component
* tGravityAccmeanY: numeric, average mean of tGravityAcc, Y component
* tGravityAccmeanZ: numeric, average mean of tGravityAcc, Z component
* tGravityAccstdX: numeric, average standard deviation of tGravityAcc, X component
* tGravityAccstdY: numeric, average standard deviation of tGravityAcc, Y component
* tGravityAccstdZ: numeric, average standard deviation of tGravityAcc, Z component
* tBodyAccJerkmeanX: numeric, average mean of tBodyAccJerk, X component
* tBodyAccJerkmeanY: numeric, average mean of tBodyAccJerk, Y component
* tBodyAccJerkmeanZ: numeric, average mean of tBodyAccJerk, Z component
* tBodyAccJerkstdX: numeric, average standard deviation of tBodyAccJerk, X component
* tBodyAccJerkstdY: numeric, average standard deviation of tBodyAccJerk, Y component
* tBodyAccJerkstdZ: numeric, average standard deviation of tBodyAccJerk, Z component
* tBodyGyromeanX: numeric, average mean of tBodyGyro, X component
* tBodyGyromeanY: numeric, average mean of tBodyGyro, Y component
* tBodyGyromeanZ: numeric, average mean of tBodyGyro, Z component
* tBodyGyrostdX: numeric, average standard deviation of tBodyGyro, X component
* tBodyGyrostdY: numeric, average standard deviation of tBodyGyro, Y component
* tBodyGyrostdZ: numeric, average standard deviation of tBodyGyro, Z component
* tBodyGyroJerkmeanX: numeric, average mean of tBodyGyroJerk, X component
* tBodyGyroJerkmeanY: numeric, average mean of tBodyGyroJerk, Y component
* tBodyGyroJerkmeanZ: numeric, average mean of tBodyGyroJerk, Z component
* tBodyGyroJerkstdX: numeric, average standard deviation of tBodyGyroJerk, X component
* tBodyGyroJerkstdY: numeric, average standard deviation of tBodyGyroJerk, Y component
* tBodyGyroJerkstdZ: numeric, average standard deviation of tBodyGyroJerk, Z component
* tBodyAccMagmean: numeric, average mean of tBodyAccMag
* tBodyAccMagstd: numeric, average standard deviation of tBodyAccMag
* tGravityAccMagmean: numeric, average mean of tGravityAccMag
* tGravityAccMagstd: numeric, average standard deviation of tGravityAccMag
* tBodyAccJerkMagmean: numeric, average mean of tBodyAccJerkMag
* tBodyAccJerkMagstd: numeric, average standard deviation of tBodyAccJerkMag
* tBodyGyroMagmean: numeric, average mean of tBodyGyroMag
* tBodyGyroMagstd: numeric, average standard deviation of tBodyGyroMag
* tBodyGyroJerkMagmean: numeric, average mean of tBodyGyroJerkMag
* tBodyGyroJerkMagstd: numeric, average standard deviation of tBodyGyroJerkMag
* fBodyAccmeanX: numeric, average mean of fBodyAcc, X component
* fBodyAccmeanY: numeric, average mean of fBodyAcc, Y component
* fBodyAccmeanZ: numeric, average mean of fBodyAcc, Z component
* fBodyAccstdX: numeric, average standard deviation of fBodyAcc, X component
* fBodyAccstdY: numeric, average standard deviation of fBodyAcc, Y component
* fBodyAccstdZ: numeric, average standard deviation of fBodyAcc, Z component
* fBodyAccJerkmeanX: numeric, average mean of fBodyAccJerk, X component
* fBodyAccJerkmeanY: numeric, average mean of fBodyAccJerk, Y component
* fBodyAccJerkmeanZ: numeric, average mean of fBodyAccJerk, Z component
* fBodyAccJerkstdX: numeric, average standard deviation of fBodyAccJerk, X component
* fBodyAccJerkstdY: numeric, average standard deviation of fBodyAccJerk, Y component
* fBodyAccJerkstdZ: numeric, average standard deviation of fBodyAccJerk, Z component
* fBodyGyromeanX: numeric, average mean of fBodyGyro, X component
* fBodyGyromeanY: numeric, average mean of fBodyGyro, Y component
* fBodyGyromeanZ: numeric, average mean of fBodyGyro, Z component
* fBodyGyrostdX: numeric, average standard deviation of fBodyGyro, X component
* fBodyGyrostdY: numeric, average standard deviation of fBodyGyro, Y component
* fBodyGyrostdZ: numeric, average standard deviation of fBodyGyro, Z component
* fBodyAccMagmean: numeric, average mean of fBodyAccMag
* fBodyAccMagstd: numeric, average standard deviation of fBodyAccMag
* fBodyBodyAccJerkMagmean: numeric, average mean of fBodyBodyAccJerkMag
* fBodyBodyAccJerkMagstd: numeric, average standard deviation of fBodyBodyAccJerkMag
* fBodyBodyGyroMagmean: numeric, average mean of fBodyBodyGyroMag
* fBodyBodyGyroMagstd: numeric, average standard deviation of fBodyBodyGyroMag
* fBodyBodyGyroJerkMagmean: numeric, average mean of fBodyBodyGyroJerkMag
* fBodyBodyGyroJerkMagstd: numeric, average standard deviation of fBodyBodyGyroJerkMag

### Citation
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012