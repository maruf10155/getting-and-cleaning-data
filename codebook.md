# codebook
## This codebook describes the function run_analysis.R
the code is divided into some sections
* load the required packages
* load the required datasets
* manipulates data 
* gives a tidy dataset.

## Loading packages
At this stage function load data.frame and plyr package

## loading required 

The function read the text files,  which reads feture.txt, activity_labels, x_train.txt, y_train.txt, x_test.txt
y_test.txt.

## Manipulating the data

The function merges test and train datasets. Then assign column names from features data. 
Select the column names ehich contains words "mean" and "std". Then extracts the columns from merged datasets.
Extracted columns are

> colnames(extractdata)
 [1] "subject"                    
 [2] "activity"                   
 [3] "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"          
 [6] "tBodyAcc-std()-X"           
 [7] "tBodyAcc-std()-Y"           
 [8] "tBodyAcc-std()-Z"           
 [9] "tGravityAcc-mean()-X"       
[10] "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"       
[12] "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"        
[14] "tGravityAcc-std()-Z"        
[15] "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"      
[18] "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"       
[20] "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"         
[22] "tBodyGyro-mean()-Y"         
[23] "tBodyGyro-mean()-Z"         
[24] "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"          
[26] "tBodyGyro-std()-Z"          
[27] "tBodyGyroJerk-mean()-X"     
[28] "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"     
[30] "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"      
[32] "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"          
[35] "tGravityAccMag-mean()"      
[36] "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"     
[38] "tBodyAccJerkMag-std()"      
[39] "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"    
[42] "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"          
[44] "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"           
[47] "fBodyAcc-std()-Y"           
[48] "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"      
[50] "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"       
[54] "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"         
[56] "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"          
[59] "fBodyGyro-std()-Y"          
[60] "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"         
[62] "fBodyAccMag-std()"          
[63] "fBodyBodyAccJerkMag-mean()" 
[64] "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"    
[66] "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()"
[68] "fBodyBodyGyroJerkMag-std()" 

## Tidy dataset 
The function also calculaates average for each subjects and activities from extracted datasets. The new datasets is tidy because
each columns contains one variable and each rows contains observations. Heading of thetidy data are,
> head(meandata)
  subject           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X
1       1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647
2       1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901
3       1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990
4       1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026
5       1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534
6       1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803
