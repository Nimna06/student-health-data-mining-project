# Exploring the Influence of Demographic and Behavioral Factors on Health Outcomes Using Data Mining

## Overview
This project analyzes demographic and behavioral factors that influence student health outcomes using data mining techniques. The analysis focuses on identifying patterns in lifestyle habits such as diet, exercise, substance use, sleep duration, and screen time, and how these factors affect physical and mental health.

Machine learning classification and clustering algorithms were implemented in **R** to uncover hidden patterns and build predictive models that support data-driven health interventions and policy planning.

## Dataset
The dataset used in this study is derived from the **Australian Secondary School Students Alcohol and Drug (ASSAD) Survey.

**Source:** ASSAD Survey Dashboard  
**Format:** CSV  
**Records:** 16,525  
**Variables:** 13  

### Key Variables
- Age
- Gender
- Dietary Habits
- Exercise Frequency
- Substance Use (Alcohol & Drugs)
- Screen Time
- Sleep Duration
- Socioeconomic Status (SES)
- Body Mass Index (BMI)
- Physical Health Conditions
- Mental Health Indicators
- Academic Performance
- Self-Perceived Health Status

These variables allow the analysis of how lifestyle and demographic factors influence students' health outcomes.

## Project Components

### 1. Data Preparation in R
The dataset was cleaned and prepared using **R**.

Key tasks include:
- Handling missing values
- Converting categorical variables into factors
- Normalizing and transforming relevant variables
- Preparing datasets for machine learning models
- Splitting the dataset into training and testing sets (80/20)

### 2. Data Mining Techniques

#### Classification Models
Several classification algorithms were applied to predict student health outcomes:

- Decision Tree
- Random Forest
- Naïve Bayes
- Neural Networks

These models were evaluated using performance metrics such as:

- Accuracy
- Precision
- Recall
- F1-score
- Confusion Matrix

#### Clustering Models
Unsupervised learning techniques were used to identify hidden patterns in the data.

Methods applied include:

- K-Means Clustering
- DBSCAN (Density-Based Spatial Clustering of Applications with Noise)

The **Elbow Method** was used to determine the optimal number of clusters.

### 3. Data Visualization
Visualization techniques were used to interpret and present model outputs.

Visualizations include:

- Confusion matrices for classification models
- Feature importance plots
- Elbow method plot for cluster selection
- Cluster scatter plots
- DBSCAN anomaly detection plots

These visualizations help identify relationships between lifestyle behaviors and health outcomes.

## Tools & Technologies
The project was implemented using the following tools:

- **R Programming Language**
- caret
- randomForest
- e1071
- rpart
- nnet
- cluster
- factoextra
- dbscan
- ggplot2

## Key Findings
- **Random Forest achieved the highest prediction accuracy** among classification models.
- **K-Means clustering identified three distinct student health groups** based on lifestyle patterns.
- **Dietary habits and exercise frequency strongly influence health outcomes.**
- Students with **low physical activity and unhealthy diets show higher risk of adverse health conditions.**
- **DBSCAN successfully identified anomalies** representing unusual behavioral or health patterns.

## Limitations
- The dataset represents **Australian secondary school students**, which may not directly generalize to other populations.
- The data is based on **self-reported responses**, which may introduce bias.
- Some variables contained missing values that required preprocessing.
- Socioeconomic and environmental factors were limited in the dataset.

## Recommendations
- Implement **targeted health education programs** promoting healthy diets and physical activity.
- Use **data-driven health monitoring systems** in schools.
- Apply clustering insights to design **personalized health interventions**.
- Conduct further research using **larger datasets and longitudinal studies**.

## Challenges
Several challenges were encountered during the project:

- Handling missing and inconsistent data
- Managing multiple categorical variables
- Selecting optimal clustering parameters
- Avoiding overfitting in classification models
- Interpreting clustering results meaningfully

## Conclusion
This project demonstrates how **data mining techniques can extract meaningful insights from health datasets**. By combining classification and clustering methods, the study reveals important patterns in student lifestyle behaviors and their impact on health outcomes.

The findings highlight the importance of **data-driven approaches in public health decision-making**, enabling policymakers and educators to design more effective health promotion strategies.

## Author
Nimna Jayawardhana
BSc in Applied Data Science Communication (Undergraduate)  
General Sir John Kotelawala Defence University

## License
This project is for **educational purposes only**.
