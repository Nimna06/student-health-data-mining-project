# Load necessary libraries
library(cluster)
library(factoextra)
library(dbscan)
library(ggplot2)

#Load the dataset
getwd()
df =read.csv("C:/Users/USER/Downloads/Australian_Secondary_School_Students_Alcohol_and_Drug__ASSAD__Survey_-_dashboard.csv")
head(df)


# Explore the dataset
head(df)
str(df)

# Check total missing values
sum(is.na(df))
colSums(is.na(df))

# Find problematic values in 'Year' column
unique(df$Year[!grepl("^\\d+$", as.character(df$Year))])

# Identify rows where 'Year' is purely numeric
df <- df[grepl("^\\d+$", df$Year), ] 

# Convert 'Year' to numeric after removing problematic values
df$Year <- as.numeric(df$Year)

# Remove problematic rows
df <- df[!is.na(as.numeric(as.character(df$Year))), ]  

# Convert 'Year' to numeric
df$Year <- as.numeric(as.character(df$Year))

# Check if columns are numeric
is.numeric(df$Year)
is.numeric(df$Estimate)

# Select relevant numeric columns for clustering
relevant_numeric_columns <- c("Year", "Estimate", "Standard.error", 
                              "Lower.95..CI", "Upper.95..CI", "Relative.standard.error")
relevant_numeric_columns <- intersect(relevant_numeric_columns, colnames(df))

# Create clustering feature set
clustering_features <- df[, relevant_numeric_columns] 

# Remove rows with missing values
clustering_features <- na.omit(clustering_features)

# Scale features
clustering_features <- scale(clustering_features)

# Check if dataset is empty after removing NA
if (nrow(clustering_features) == 0) {
  stop("Error: No valid data available after removing NA values.")
}

# Determine optimal number of clusters using Elbow Method
fviz_nbclust(clustering_features, kmeans, method = "wss")

# Apply K-Means Clustering
set.seed(123)
kmeans_model <- kmeans(clustering_features, centers = 3, nstart = 25)
df$Cluster <- as.factor(kmeans_model$cluster)

# Visualize K-Means Clusters
fviz_cluster(kmeans_model, data = clustering_features)


# Apply DBSCAN Clustering
set.seed(123)
dbscan_model <- dbscan(clustering_features, eps = 0.5, minPts = 5)
df$DBSCAN_Cluster <- as.factor(dbscan_model$cluster)

#Check Row Count Differences
nrow(df) 
nrow(clustering_features)  
length(dbscan_model$cluster)  

#Fix the Mismatch Before Assigning Clusters
df <- df[1:nrow(clustering_features), ]  # Adjust df size
df$DBSCAN_Cluster <- as.factor(dbscan_model$cluster)

# Visualize DBSCAN Clusters
plot(clustering_features, col = dbscan_model$cluster + 1, pch = 20, main = "DBSCAN Clustering")

