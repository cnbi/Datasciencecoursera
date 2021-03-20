---
title: "CodeBook"
author: "Camila Natalia Barragán Ibáñez"
date: "20/3/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## Description of the data
The original features selected for the original database came from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. Similarly, the signals can be divided in data from the accelerometer and data from the gyroscope. The  acceleration signal was is separated in body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).


## Variables

All the variables are numeric, with exception of the Activity variable which is a factor of six levels.

          
- Activity: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, - STANDING, LAYING)          
- Subject:  Number that identifies the person. 

- TimeBodyAccelerometerMeanX                   
- TimeBodyAccelerometerMeanY                 
- TimeBodyAccelerometerMeanZ                  
- TimeBodyAccelerometerStdX                  
- TimeBodyAccelerometerStdY                   
- TimeBodyAccelerometerStdZ                  
- TimeGravityAccelerometerMeanX               
- TimeGravityAccelerometerMeanY              
- TimeGravityAccelerometerMeanZ               
- TimeGravityAccelerometerStdX               
- TimeGravityAccelerometerStdY                
- TimeGravityAccelerometerStdZ               
- TimeBodyAccelerometerJerkMeanX              
- TimeBodyAccelerometerJerkMeanY             
- TimeBodyAccelerometerJerkMeanZ              
- TimeBodyAccelerometerJerkStdX              
- TimeBodyAccelerometerJerkStdY               
- TimeBodyAccelerometerJerkStdZ              
- TimeBodyGyroscopeMeanX                      
- TimeBodyGyroscopeMeanY 
- TimeBodyGyroscopeMeanZ                      
- TimeBodyGyroscopeStdX                      
- TimeBodyGyroscopeStdY                       
- TimeBodyGyroscopeStdZ                      
- TimeBodyGyroscopeJerkMeanX                  
- TimeBodyGyroscopeJerkMeanY                 
- TimeBodyGyroscopeJerkMeanZ                  
- TimeBodyGyroscopeJerkStdX                  
- TimeBodyGyroscopeJerkStdY                   
- TimeBodyGyroscopeJerkStdZ                  
- TimeBodyAccelerometerMagnitudeMean
- TimeBodyAccelerometerMagnitudeStd          
- TimeGravityAccelerometerMagnitudeMean       
- TimeGravityAccelerometerMagnitudeStd       
- TimeBodyAccelerometerJerkMagnitudeMean      
- TimeBodyAccelerometerJerkMagnitudeStd      
- TimeBodyGyroscopeMagnitudeMean              
- TimeBodyGyroscopeMagnitudeStd              
- TimeBodyGyroscopeJerkMagnitudeMean          
- TimeBodyGyroscopeJerkMagnitudeStd          
- FrequencyBodyAccelerometerMeanX             
- FrequencyBodyAccelerometerMeanY            
- FrequencyBodyAccelerometerMeanZ             
- FrequencyBodyAccelerometerStdX             
- FrequencyBodyAccelerometerStdY              
- FrequencyBodyAccelerometerStdZ             
- FrequencyBodyAccelerometerJerkMeanX         
- FrequencyBodyAccelerometerJerkMeanY        
- FrequencyBodyAccelerometerJerkMeanZ         
- FrequencyBodyAccelerometerJerkStdX         
- FrequencyBodyAccelerometerJerkStdY          
- FrequencyBodyAccelerometerJerkStdZ         
- FrequencyBodyGyroscopeMeanX                 
- FrequencyBodyGyroscopeMeanY                
- FrequencyBodyGyroscopeMeanZ                 
- FrequencyBodyGyroscopeStdX                 
- FrequencyBodyGyroscopeStdY                  
- FrequencyBodyGyroscopeStdZ                 
- FrequencyBodyAccelerometerMagnitudeMean     
- FrequencyBodyAccelerometerMagnitudeStd     
- FrequencyBodyAccelerometerJerkMagnitudeMean
- FrequencyBodyAccelerometerJerkMagnitudeStd 
- FrequencyBodyGyroscopeMagnitudeMean         
- FrequencyBodyGyroscopeMagnitudeStd         
- FrequencyBodyGyroscopeJerkMagnitudeMean     
- FrequencyBodyGyroscopeJerkMagnitudeStd

# Procedures
Originally the data base was subsetted, hereby the first procedure was bind all the parts to configurate a single table with all the data. After this, the columns with the standard deviation and the mean are extracted and use to build a data base with these and the subject and activity. The Activity variable was converted to a factor with 6 levels. Additionally, the columns namnes were changed to indicate the domain (time or frequency) and remove special characters.
Finally, a new table was created with the  the average of each variable for each activity and each subject.