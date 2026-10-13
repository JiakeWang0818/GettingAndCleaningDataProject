# 1. 读取所有数据文件
# 读取特征名称
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "featureNames"))
# 活动标签映射
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "activityName"))

# 读取训练集
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityId")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# 读取测试集
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityId")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# 合并训练集：把 subject + y + x 横向拼在一起
train_data <- cbind(subject_train, y_train, x_train)
# 合并测试集
test_data <- cbind(subject_test, y_test, x_test)

# 纵向合并训练+测试，得到完整数据集
full_data <- rbind(train_data, test_data)
# 提取需要的列索引：匹配 mean() 和 std()
wanted_features <- grep("mean\\(\\)|std\\(\\)", features$featureNames)
# 因为full_data前两列是subject、activityId，特征列从第3列开始，所以索引+2
wanted_columns <- c(1,2, wanted_features + 2)

# 筛选子集
mean_std_data <- full_data[, wanted_columns]

# 给特征列分配原始名字
colnames(mean_std_data) <- c("subject", "activityId", features$featureNames[wanted_features])
# 将activityId转为factor，用activityName做标签
mean_std_data$activityId <- factor(mean_std_data$activityId,
                                   levels = activities$activityId,
                                   labels = activities$activityName)
# 把列名activityId改成activity，现在存储的是文字名称
names(mean_std_data)[2] <- "activity"

