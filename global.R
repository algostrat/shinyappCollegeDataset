## Check packages ##
if (!require('DT')) install.packages("DT")
if (!require('shiny')) install.packages("shiny")
if (!require('shinythemes')) install.packages("shinythemes")
if (!require('shinyFiles')) install.packages("shinyFiles")
if (!require('ggplot2')) install.packages("ggplot2")
if (!require('ISLR')) install.packages("ISLR")
if (!require('ISLR')) install.packages("waldo")

library(ISLR)
library(shiny)
library(ggplot2)
library(shinythemes)
library(DT)

data("College")
cols = colnames(College)
cols = cols[cols !="Private"]

#cols
names = c("Applications recieved","Applications accepted", "Number of new enrollees", "% of top 10% HS students",
          "% of top 25% HS students", "Fulltime undergrads", "Partime undergrads", "Out of state tuition",
          "Room and Board costs", "Book costs", "Estimated personal expenditure", "% of Phd faculty",
          "% of faculty with terminal degree", "Student/faculty ratio", "% of alumni who donate",
          "Total instructional expenditure","Graduation rate")
dict = setNames(as.list(names), cols)
dictr = setNames(as.list(cols), names)
#dictr$`Applications recieved`
#dictr[["Applications recieved"]]
#dict[["Apps"]]
