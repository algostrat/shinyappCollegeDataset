# College dataset explorer
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
##Description
The Colelge data provides information on 777 colleges recorded in 1995. The data is useful for constructing and analyzing relationships to between featueres relative to College  statistcs such as cost of attendance, admissions stats, faculty stats, and more (a detailed list is provided below). The uder is first presented with a plotted linear regression model showing the plotted data points and fitted line. The user can modify the regresssion line through the model options menu box to the left of the plot. In the model options, a default setting is shown which buids and plots a model relating the percentage of students who were top 10% in their highschool to their college's out of state tuition price. The user can select any regressor(y-axis) and predictor(x-axis) feature to create ashow plot a model on the the plot to the right. In the model options is the choice to choose betweena linear model and a smoothed loess regression model. Lastly, there is an option to split the data into private/public subset to see how the data and models behave differently between colleges that are private and those that are public.

Below the plot for the regression model and model options menu is a data table showing the entire data set. A user can click on the arrows of any column header to sort Colleges by increasing/decreasing value for that feature. The user can also scroll left/right and up/down to see the entire data of 777 obervations and 18 variables while still seeing the fixed column of college names. 

Below the table is more information including the list of variable names used in the data table, a decription of the datset, and a citation. 
