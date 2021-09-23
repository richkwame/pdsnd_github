
newy = read.csv('new_york_city.csv')
washing = read.csv('washington.csv')
chicago = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

library(ggplot2)
library(dplyr)

chi_summary <-
    chi                          %>% # Pipe df into group_by
    group_by(User.Type)              %>% # grouping by 'user.type' column
    summarise(usertype_count = n())     # calculate the usertytpe count for each group
## 'chi_summary' now contains the summary data for each 'user.type'
chicago_summary
ggplot(chicago_summary, aes(User.Type, usertype_count)) +  
    geom_bar(stat = 'identity')+  
labs(y = 'total count for each usertype in chicago')
labs(x = 'usertype')
ggtitle('Bar chart of total counts for each usertypes in Chicago')



#Total count and graph for washington
washing_summary <-
    wash                          %>% # Pipe wash into group_by
    group_by(User.Type)              %>% # grouping by 'usertype' column
    summarise(usertype_count = n())     # calculate the usertype count for each group
## 'wash_summary' now contains the summary data for each 'usertype'
 washing_summary

ggplot(washing_summary, aes(User.Type, usertype_count)) +  
    geom_bar(stat = 'identity')+  
labs(y = 'total count for each usertype in wahington')
labs(x = 'usertype')
ggtitle('Bar chart of total counts for each usertypes in Washington')



#Total count and graph for New_york
newy_summary <-
    newy                          %>% # Pipe ny into group_by
    group_by(User.Type)              %>% # grouping by 'usertype' column
    summarise(usertype_count = n())     # calculate the usertype count for each group
## 'ny_summary' now contains the summary data for each 'usertype'
 newy_summary


ggplot(ny_summary, aes(User.Type, usertype_count)) +  
    geom_bar(stat = 'identity') + 
labs(y = 'total number of counts count for each usertype in new_york')
labs(x = 'usertype')
ggtitle('Bar chart of total countsfor each usertypes in new_york')




### Question 2

**Which gender type has the highest mean and median trip duration?**
library(ggplot2)

by(chi$Trip.Duration,chi$Gender,summary)

ggplot(aes(x=Gender,y=Trip.Duration), data=subset(chi, !is.na(Gender)))+
 geom_boxplot(binwidth = 30, color = 'black', fill = '#099DD9')+
 coord_cartesian(ylim = c(0,3000))
labs(y = 'quatile,mean and median trip duration in chicago')
labs(x = 'Gender')
ggtitle('Box plot showing the quatiles,mean and median trip duration in Chicago')

by(ny$Trip.Duration,ny$Gender,summary)
ggplot(aes(x=Gender,y=Trip.Duration), data=subset(ny, !is.na(Gender)))+
 geom_boxplot(binwidth = 30, color = 'black', fill = '#099DD9')+
 coord_cartesian(ylim = c(0,3000))
labs(y = 'quatile,mean and median trip duration in new york')
labs(x = 'Gender')
ggtitle('Box plot showing the quatiles,mean and median trip duration in new york')

**Summary of your question 2 results goes here.**
summary for chicago
chi$Gender: 
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   63.0   918.8  1370.0  1929.5  1934.0 85408.0 
------------------------------------------------------------ 
chi$Gender: Female
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
     60     406     668     774    1004   12913 
------------------------------------------------------------ 
chi$Gender: Male
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   60.0   338.0   536.0   655.4   847.5 21634.0
   
   
  summary for new york 
   ny$Gender: 
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
     62     738    1232    1892    1709  495414       1 
------------------------------------------------------------ 
ny$Gender: Female
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
     61     400     644     876    1068   77918 
------------------------------------------------------------ 
ny$Gender: Male
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
     61.0     340.0     551.0     768.9     918.0 1088634.0 
# total number of males and total number of females
chi_summary <-
    chi                          %>% # Pipe df into group_by
    group_by(Gender)              %>% # grouping by 'gender' column
    summarise(total_number = n())     # calculate the total number  for each gender type
## 'chi_summary' now contains the summary data for each 'gender'
chi_summary
ggplot(chi_summary,aes(Gender, total_number)) +  
    geom_bar(stat = 'identity')+  
labs(y = 'total number for each Gender type in chicago')
labs(x = 'Gender')
ggtitle('Bar chart of total number of males and total number of females in Chicago')

# total number of males and total number of females
ny_summary <-
    ny                          %>% # Pipe df into group_by
    group_by(Gender)              %>% # grouping by 'gender' column
    summarise(total_number = n())     # calculate the total number  for each gender type
## 'ny_summary' now contains the summary data for each 'gender'
ny_summary
ggplot(ny_summary,aes(Gender, total_number)) +  
    geom_bar(stat = 'identity')+  
labs(y = 'total number for each Gender type in new york')
labs(x = 'Gender')
ggtitle('Bar chart of total number of males and total number of females in New york')

system('python -m nbconvert Explore_bikeshare_data.ipynb')
