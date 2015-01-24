### Author: nhatmn
### Course: Getting and Cleaning Data

#Peer Assessments

This document explains how all of the scripts work and how they are connected.
Please follow steps below to verify my working:
* Step 1: Check out this repo, save it in your workspace. The folder name should be "**Getting_and_Cleaning_Data_Peer_Ass**".
* Step 2: Download the data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, save it in "Getting_and_Cleaning_Data_Peer_Ass".
* Step 3: Extract the data zip file, rename the data folder (after unzipping) to "**UCI_HAR_Dataset**".
* Step 4: In RStudio, Change your workspace to "Getting_and_Cleaning_Data_Peer_Ass" folder, then run:
```{r}
source("run_analysis.R")
```
* Verify that there are 2 files created in "Getting_and_Cleaning_Data_Peer_Ass" folder: **Step04_merged_clean_data.txt** and **Step05_data_set_with_means.txt**.
* You can open Step05_data_set_with_means.txt by any other tools, or load it in R using command:
```{r}
data <- read.table("Step05_data_set_with_means.txt")
```
