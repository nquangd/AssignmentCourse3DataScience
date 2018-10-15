## Study designs: 

Using the acitivity bands with accelerometer and gyroscope 3-axial sensors to collect different data of individuals performing different activities

## Variables

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

These variables are available for these signals collected from accelerometer and gyroscope 3-axial
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
The variables is coded as can be seen in the variables list 

## Data set
The data set includes measurements for 30 different subjects performing 6 different activities 
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING
The activity is coded as in the activity label list 

The data is collected for (1) Test and (2) Train set
Each column is meadurements for a specific variable listed above. Using the column number to match the variables id in the variable list, the variable name can be retrieved.


## Transformation
	
	1. Add the two columns indicating the subject id (column 1) and the activity performed (column 2) for each measurement
	2. Merge the Test and Train data sets
	3. Extract the mean() and standard() deviation for each signal using the 
	4. Add the variables name, i.e. std and mean for each signal, explicitly to the data set. Replace "t" by "time" and "f" by "frequency"
	5. Replace the coded activity to descriptive activity names as WALKING...
	6. Calculate the average of each variables for a each combination of subject - activity. That is, 30 x 6 = 180 combinations
	
## Tidy data set

Is a data frame with size 180x68
Column 1: Subject id
Column 2: Activity
Column 3-68: Mean and standard deviation for each signals
Each row is the measurement for each subject - activity combination
	