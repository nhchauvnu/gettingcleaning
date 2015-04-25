library(tidyr)
library(dplyr)
# Answer 1: Merge the training and test data sets
# Training data set
trainx = read.table('UCI HAR Dataset/train/X_train.txt')
trainsub = read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('subject'))
trainy = read.table('UCI HAR Dataset/train/y_train.txt', col.names=c('activity'))
traindata = cbind(trainx, trainsub, trainy)

# test data set
testx = read.table('UCI HAR Dataset//test/X_test.txt')
testsub = read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('subject'))
testy = read.table('UCI HAR Dataset/test/y_test.txt', col.names=c('activity'))
testdata = cbind(testx, testsub, testy)

# merge training and test data sets
data = rbind(traindata, testdata)

# Answer 2: Extracts only the measurements on the mean and standard deviation for each measurement
features = read.table('UCI HAR Dataset//features.txt', col.names = c('ID', 'name'))
extfeatures = grep('mean|std', features$name)
extdata = data[,extfeatures]
extdata = cbind(extdata, data[,c('activity', 'subject')])

# Answer 3: Uses descriptive activity names to name the activities in the data set
activity = read.table('UCI HAR Dataset//activity_labels.txt', col.names=c('ID', 'name'))
extdata$activity = sapply(extdata$activity, function(x) { activity$name[which(activity$ID==x)]})

# Answer 4: Appropriately labels the data set with descriptive variable names
featurenames = gsub('\\(|\\)|,|\\.|-', '', features[,2][extfeatures])
names(extdata) = c(featurenames, 'activity', 'subject')

# Answer 5: From the data set in step 4, creates a second,
# independent tidy data set with the average of each
# variable for each activity and each subject
tidy = extdata %>%
	group_by(subject, activity) %>%
	summarise_each(funs(mean)) %>%
	gather(measure, mean, -activity, -subject)

write.table(tidy, file='tidy.txt', row.name=FALSE)

