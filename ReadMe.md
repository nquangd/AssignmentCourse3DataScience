## This is the script to tidy up the data collected by the activity bands

The script does the following steps:

	* Read the raw collected data, the subject id, and the activity id using read.csv
	* Add the subject id and activity id to the data set using cbind. This is done for both Train and Test data set
	* Merge Train and Test data set using rbind
	* Get the id for the variables by using the grep command to look for the pattern std() and mean()
	* Extract the merge data set by using the variables id obtained from previous step to pass to the column index of the data set
	* Using sapply to label the activity by matching the activity id in the data set and the activity list
	* Rename the whole data set using the variables names obtained from step 4
	* Calculate the average for each subject - activity combination by aggregate command
	
The data set, the variables and the transformation steps are described in the CodeBook


To use this script, run

> run_analysis()  in the R command prompt

this will write a tidy data set named tidydata.txt

