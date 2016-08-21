
**Contents: 1) Data Set Code Book
          2) Feature Selection Details**

#**======================**
#**1) Data Set Code Book **
#**======================**

This set of variables are the main identifiers of subjects and involved activities:

 Col    Variable Name
 ----   -------------
 *[1]    "id"                    - id of human subject measured (1-30)
 *[2]    "activity"              - six human subject activities:
         * laying                   -subject laying down
         * sitting                  -subject sitting
 	 * standing                 -subject standing
	 * walking                  -subject walking
         * walking_downstairs       -subject walking downstairs
	 * walking_upstairs         -subject walking upstairs

The following variables (cols) are the mean of the means for
the associated intertial measurements with suffix set.
Each value is a numeric value representing the mean value of all
mean measurements for the associated human subject and activity. 
(measurement suffix: -mean;  axial measurement suffixes: -mean-x, -mean-y, -mean-z)

  Col   Variable Name
  ----  ----------------------
 * [3]   "tbodyacc-mean-x"
 * [4]   "tbodyacc-mean-y"          
 * [5]   "tbodyacc-mean-z"
 * [6]   "tgravityacc-mean-x"       
 * [7]   "tgravityacc-mean-y"
 * [8]   "tgravityacc-mean-z"       
 * [9]   "tbodyaccjerk-mean-x"
 *[10]   "tbodyaccjerk-mean-y"      
 *[11]   "tbodyaccjerk-mean-z"
 *[12]   "tbodygyro-mean-x"         
 *[13]   "tbodygyro-mean-y"
 *[14]   "tbodygyro-mean-z"         
 *[15]   "tbodygyrojerk-mean-x"
 *[16]   "tbodygyrojerk-mean-y"     
 *[17]   "tbodygyrojerk-mean-z"
 *[18]   "tbodyaccmag-mean"         
 *[19]   "tgravityaccmag-mean"
 *[20]   "tbodyaccjerkmag-mean"     
 *[21]   "tbodygyromag-mean"
 *[22]   "tbodygyrojerkmag-mean"    
 *[23]   "fbodyacc-mean-x"
 *[24]   "fbodyacc-mean-y"          
 *[25]   "fbodyacc-mean-z"
 *[26]   "fbodyaccjerk-mean-x"      
 *[27]   "fbodyaccjerk-mean-y"
 *[28]   "fbodyaccjerk-mean-z"      
 *[29]   "fbodygyro-mean-x"
 *[30]   "fbodygyro-mean-y"         
 *[31]   "fbodygyro-mean-z"
 *[32]   "fbodyaccmag-mean"         
 *[33]   "fbodybodyaccjerkmag-mean"
 *[34]   "fbodybodygyromag-mean"    
 *[35]   "fbodybodygyrojerkmag-mean"
 *[36]   "tbodyacc-std-x"

The following variables (cols) are the standard deviation for
the associated standard deviation intertial measurements with suffix set:
Each variable is a numeric value representing the standard deviation of all
standard deviations for the human subject and activity. 
(measurement suffix: -std;  axial measurement suffixes: -std-x, -std-y, -std-z)

 Col   Variable Name
 ----  ----------------------
*[37]   "tbodyacc-std-y"
*[38]   "tbodyacc-std-z"           
*[39]   "tgravityacc-std-x"
*[40]   "tgravityacc-std-y"        
*[41]   "tgravityacc-std-z"
*[42]   "tbodyaccjerk-std-x"       
*[43]   "tbodyaccjerk-std-y"
*[44]   "tbodyaccjerk-std-z"       
*[45]   "tbodygyro-std-x"
*[46]   "tbodygyro-std-y"          
*[47]   "tbodygyro-std-z"
*[48]   "tbodygyrojerk-std-x"      
*[49]   "tbodygyrojerk-std-y"
*[50]   "tbodygyrojerk-std-z"      
*[51]   "tbodyaccmag-std"
*[52]   "tgravityaccmag-std"       
*[53]   "tbodyaccjerkmag-std"
*[54]   "tbodygyromag-std"         
*[55]   "tbodygyrojerkmag-std"
*[56]   "fbodyacc-std-x"           
*[57]   "fbodyacc-std-y"
*[58]   "fbodyacc-std-z"           
*[59]   "fbodyaccjerk-std-x"
*[60]   "fbodyaccjerk-std-y"       
*[61]   "fbodyaccjerk-std-z"
*[62]   "fbodygyro-std-x"          
*[63]   "fbodygyro-std-y"
*[64]   "fbodygyro-std-z"          
*[65]   "fbodyaccmag-std"
*[66]   "fbodybodyaccjerkmag-std"  
*[67]   "fbodybodygyromag-std"
*[68]   "fbodybodygyrojerkmag-std" 



#**============================**
#**2) Feature Selection Details**
#**============================**

The explanations below describe the base measurements behind the "-mean"
and "-std" suffix types predictive values in the data set. This can be used to
determine the origins of the prefix values associated with each suffix.

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to
denote time) were captured at a constant rate of 50 Hz. Then they were filtered using
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-xyz, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

