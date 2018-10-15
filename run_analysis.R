run_analysis <- function() {
	
	## Read data file in train
	xtr <- read.csv("./train/X_train.txt",sep="",header=FALSE)
	ytr <- read.csv("./train/y_train.txt",sep="",header=FALSE)
	sjtr <- read.csv("./train/subject_train.txt",sep="",header=FALSE)
	
	# add the subject id and activity id as columns to the data set
	train <- cbind(sjtr,ytr,xtr)
	
	## Read data file in test
	xt <- read.csv("./test/X_test.txt",sep="",header=FALSE)
	yt <- read.csv("./test/y_test.txt",sep="",header=FALSE)
	sjt <- read.csv("./test/subject_test.txt",sep="",header=FALSE)
	
	# add the subject id and activity id as columns to the data set
	test <- cbind(sjt,yt,xt)
	
	## Read the feature list
	f <- read.csv("./features.txt",sep="",header=FALSE)
	
	## Read the activity label
	a <- read.csv("./activity_labels.txt",sep="",header=FALSE)
	
	## STEP 1: Merge the data
	
	data <- rbind(train,test)
	
	## STEP 2: Extract only the std() and mean() for each measurement
	
	## Get the code for the std() and mean() of each feature in the feature list
	f <- f[grep("mean\\()|std\\()",f[,2]),]    ## Use \\ so that R recognises () as literal character
	
	## Extract the data
	data <- cbind(data[,1:2],data[,f[,1]+2])    ## "+2" since two columns were added to the data
	
	## STEP 3: Add descriptive name for activity in the merged data set. Retrieve from the label df a
	
	data[,2] <- sapply(data[,2], function(x) a[x,2])
	
	## STEP 4: Add the descriptive name for the variables
	
	f[,2] <- sub("^t","Time",f[,2])  			## replace "t" and "f" to something selfexplanatory
	f[,2] <- sub("^f","Frequency",f[,2])
	f[,2] <- gsub("-","",f[,2])
	f[,2] <- gsub("\\()","",f[,2])
	f[,2] <- gsub("mean","Mean",f[,2])
	f[,2] <- gsub("std","Std",f[,2])
		
	names(data)[3:length(names(data))] <- f[,2]   ## rename the names of the data set
	names(data)[1:2] <- c("Subject","Activity")
	
	## STEP 5: Find the average for each subject and each activity
	
	data <- aggregate(data[3:dim(data)[2]], by = list(data$Subject,data$Activity), FUN = function(x) mean(x))
	names(data)[1:2] <- c("Subject","Activity")
	
	write.table(data, file = "tidydata.txt", row.names=FALSE)
	
}