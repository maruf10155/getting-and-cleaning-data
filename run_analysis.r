#this function reads data files and gives a tidy datasets. 
run_analysis = function () {
  library ( data.table ) #load data.frame package
  library ( plyr ) ##load plyr package
  # following commands load datasets
  activity = fread ( "UCI HAR Dataset/activity_labels.txt" )
  features = fread ( "UCI HAR Dataset/features.txt" )
  subtest = fread ( "UCI HAR Dataset/test/subject_test.txt" )
  datatest = fread( "UCI HAR Dataset/test/X_test.txt" )
  activitytest = fread ( "UCI HAR Dataset/test/y_test.txt" )
  subtrain = fread( "UCI HAR Dataset/train/subject_train.txt" )
  datatrain = fread ( "UCI HAR Dataset/train/X_train.txt" )
  activitytrain = fread( "UCI HAR Dataset/train/y_train.txt" )
  dataall = rbind( datatrain , datatest ) # merge test and training data
  colnames( dataall ) = features[[ 2 ]] # assigning column names from fetures
  dataall = as.data.frame( dataall ) # convert dataall as a data frame
  extractvector = grep ( "-(mean|std)\\(\\)" , colnames( dataall ) ) # gives a vector which contains word mean and std
  extractdata = dataall [ , extractvector ] # extracts columns from dataall  
  subjectall = rbind ( subtrain , subtest ) # merges subject for training and testing 
  activityall = rbind ( activitytrain , activitytest ) # merges activity for training and testing 
  activityall [ ,1 ] = activity [ activityall [[ 1 ]] , 2] # assigning a descriptive name instead of number
  colnames ( subjectall ) = "subject" # assigning a column name
  colnames ( activityall ) = "activity" # assigning a column name 
  extractdata = cbind ( subjectall , activityall , extractdata ) # merges columns for subject, activity and extracted data 
  extractdata = as.data.frame ( extractdata ) # convering extractdata as a data frame
  meandata = ddply ( extractdata , .(subject, activity), function(x) colMeans( x [, 3:68] ) ) # getting a tidy datasets for each subjects 
                    # and activity, first 2 column is subject and activity, so, we set from 3 to 68 
  write.table ( meandata , "meandata.txt" , row.names = FALSE ) # writing data as a text file
}
