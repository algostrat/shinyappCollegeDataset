# Shiny App College dataset 
 This project demostrates and explores combinations of linear relationships between features within the 'College' dataset provided by R's ISLR package and the News and World Report issue from 1995. Model options and a sortable datable of all the dataset is provided as well as a key for column features and descriptions.  

## How to run software of local installation of R
- R >= 3.2
- Shiny >= 1.6.0
- In R:
```
install.packages('shiny')
library(shiny)
shiny::runGitHub("HCMM_CNVs","lunching", destdir = <your app directory>)
```
## Description
The College data provides information on 777 colleges recorded in 1995. The data is useful for constructing and analyzing relationships to between featueres relative to College  statistcs such as cost of attendance, admissions stats, faculty stats, and more (a detailed list is provided below). The uder is first presented with a plotted linear regression model showing the plotted data points and fitted line. The user can modify the regresssion line through the model options menu box to the left of the plot. In the model options, a default setting is shown which buids and plots a model relating the percentage of students who were top 10% in their highschool to their college's out of state tuition price. The user can select any regressor(y-axis) and predictor(x-axis) feature to create and plot a model on the the graph to the right. In the model options is the choice to choose between a linear model and a smoothed loess regression model. Lastly, there is an option to split the data into private/public subset to see how the data and models behave differently between colleges that are private and those that are public. A legend is shown at the top of the plot indicating which color model fit(line) 

Below the plot for the regression model and model options menu is a data table showing the entire data set. A user can click on the arrows of any column header to sort Colleges by increasing/decreasing value for that feature. The user can also scroll left/right and up/down to see the entire data of 777 obervations and 18 variables while still seeing the fixed column of college names. 

Below the table is more information including the list of variable names used in the data table, a decription of the datset, and a citation. This same information is provided in this readme.

## Variables in the college dataset 
(copied from R's help(College) function)
- Private = A factor with levels No and Yes indicating private or public university
- Apps = Number of applications received
- Accept = Number of applications accepted
- Enroll = Number of new students enrolled
- Top10perc = Pct. new students from top 10% of H.S. class
- Top25perc = Pct. new students from top 25% of H.S. class
- F.Undergrad = Number of fulltime undergraduates
- P.Undergrad = Number of parttime undergraduates
- Outstate = Out-of-state tuition
- Room.Board = Room and board costs
- Books = Estimated book costs
- Personal = Estimated personal spending
- PhD = Pct. of faculty with Ph.D.'s
- Terminal = Pct. of faculty with terminal degree
- S.F.Ratio = Student/faculty ratio
- perc.alumni = Pct. alumni who donate
- Expend = Instructional expenditure per student
- Grad.Rate = Graduation rate

## Citations
This websites involves data curated and presented in the ISLR package and supplemental textbook:
James, G., Witten, D., Hastie, T., and Tibshirani, R. (2013) An Introduction to Statistical Learning with applications in R

The College dataset is from the StatLib library which is maintained at Carnegie Mellon University. The dataset was used in the ASA Statistical Graphics Section's 1995 Data Analysis Exposition.



