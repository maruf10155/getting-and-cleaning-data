run_analysis=function(){
  library(data.table)
  library(plyr)
  activity=fread("UCI HAR Dataset/activity_labels.txt")
  features=fread("UCI HAR Dataset/features.txt")
  subtest=fread("UCI HAR Dataset/test/subject_test.txt")
  datatest=fread("UCI HAR Dataset/test/X_test.txt")
  activitytest=fread("UCI HAR Dataset/test/y_test.txt")
  subtrain=fread("UCI HAR Dataset/train/subject_train.txt")
  datatrain=fread("UCI HAR Dataset/train/X_train.txt")
  activitytrain=fread("UCI HAR Dataset/train/y_train.txt")
  dataall=rbind(datatrain,datatest)
  colnames(dataall)=features[[2]]
  extractvector=grep("-(mean|std)\\(\\)",colnames(dataall))
  extractdata=dataall[,extractvector]
  subjectall=rbind(subtrain,subtest)
  activityall=rbind(activitytrain,activitytest)
  activityall[,1]=activity[activityall[[1]],2]
  colnames(subjectall)="subject"
  colnames(activitytall)="activity"
  extractdata=cbind(subjectall,activityall,extractdata)
  extractdata=as.data.frame(extractdata)
  meandata= ddply(extractdata, .(subject, activity), function(x) colMeans(x[, 3:68]))
  write.table(meandata,"meandata.txt",row.names = FALSE)
}