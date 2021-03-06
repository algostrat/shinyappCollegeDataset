# Shiny App College dataset 
 This project demostrates and explores combinations of linear relationships between features within the 'College' dataset provided by R's ISLR package and the News and World Report issue from 1995. Model options and a sortable datable of all the dataset is provided as well as a key for column features and descriptions. The College data provides information on 777 colleges and 18 features. The data is useful for constructing and analyzing relationships between features such as cost of attendance, admissions stats, faculty stats, and more (a detailed list is provided below).  

## Visit website running on shinyapp.io server:
```
https://rwahler.shinyapps.io/shinyappcollegedataset/
```

## How to run software of local installation of R
- R >= 3.2
- Shiny >= 1.6.0
- In R:
```
install.packages('shiny')
library(shiny)
shiny::runGitHub("shinyappCollegeDataset", "algostrat", ref="main", destdir = <your directory of choice>)
```
## Description of website
The user is first presented with a plotted linear regression model showing the plotted data points and fitted line. The user can modify the regresssion line through the model options menu box to the left of the plot. In the model options, a default setting is shown which buids and plots a model relating the number of students who were top 10% in their highschool to their college's out of state tuition price. The user can select any regressor(y-axis) and predictor(x-axis) feature to create and plot a model on the the graph to the right. In the model options is the choice to choose between a linear model and a smoothed loess regression model. Lastly, there is an option to split the data into private/public subset to see how the data and models behave differently between colleges that are private and those that are public. A legend is shown at the top of the plot indicating which color model fit(line) 

Below the plot for the regression model and model options menu is a data table showing the entire data set. A user can click on the arrows of any column header to sort Colleges by increasing/decreasing value for that feature. The user can also scroll left/right and up/down to see the entire data of 777 obervations and 18 variables while still seeing the fixed column of college names. 

Below the table is more information including the list of variable names used in the data table, a decription of the datset, and a citation. This same information is provided in this readme.

## Decription of repository and code

- ui.R 
This file contains the front end visual components. The page contains a navigation bar used as just a placeholder for the name of the dataset used. A header for the first components follows, titled "Explore linear relationships in college data". The entire site is nested into a side bar layout which is further nested into the sidebar panel and main panel. The sidebar panel, titled "model options" provides two select inputs for the regressor/predictor variables, a select input for the model fit type (smooth or linear), and a checkbox to split the data into the categorical "private" or "public" subsets. 
In the main panel exists a header for the datatable, the datatable itself, a list of the variables used and their definitions (taken from rdocumention). Next in the main panel is a section describing the source of the data, followed by a reference of links to this repository, the package dataset authors' website, and a link to an rdocumentation link for the dataset. Last is the reference to the authors of the ISLR package and corresponding book.

- global.R
The global file checks for package dependencies and installs them in needed. This file also load in the data and performs the necessary modification relevant to getting the column names. In detail, we drop the categorical variable "Private" in order to not regress or predict on it and instead provide it as a way to only subset the data into separate plotted models. Also, for user readability, a more interpretable list of regressor/predictor variables are provided as compared to the original names in the data set.  

- server.R
This server file is the backend component for responsively rendering the data to the user interface (ui.R). The server is split up between a renderplot function which detects which regressor, predictor, model fit method, and if the data is to be split by private/public. "reg" and "pred" are variables used to exchange what the user chooses and how the ggplot knows what data column to use. The renderplot then plots the data using variable "g" through use of ggplot's geom_point(scatterplot) and stat_smooth(line plot) functions. FOllwing renderplot is a function the render the datatable and show the entire dataset, worth to mention is that the names of the colleges are fixed and the rows are sortable on different columns in order to explore with ease. 

- gitignore
The gitignore file is used to ignore server_local.R which is a version of the site used for testing on my local machine. 


## Variables in the College dataset 
(Taken from R's help(College) function)
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

College: U.S. News and World Report's College Data, https://www.rdocumentation.org/packages/ISLR/versions/1.2/topics/College

