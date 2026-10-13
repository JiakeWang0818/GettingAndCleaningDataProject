# CodeBook for tidy_dataset.txt
## Data source
The raw data is UCI Human Activity Recognition Using Smartphones Dataset.

## Dimensions
- 180 rows: 30 subjects × 6 activities
- 68 columns: subject, activity name, and 66 averaged mean/std measurements

## Variables
1. subject: integer 1~30, the ID of test volunteer
2. activity: character, 6 activity types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. tBodyAcc-mean-X: average mean value of body acceleration on X axis
4. tBodyAcc-mean-Y: average mean value of body acceleration on Y axis
5. tBodyAcc-mean-Z: average mean value of body acceleration on Z axis
6. tBodyAcc-std-X: average standard deviation of body acceleration on X axis
...
All other variables are the average of mean() and std() features from the original dataset, grouped by subject and activity.
