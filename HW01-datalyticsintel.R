----
# title: Homework 01 INFO 526
# Author: Antonio Escalante Jr
#> Date: 2023- 08-30 
#> Description: Homework 01 from Github 
----
 
  
#### 1 - Road traffic accidents in Edinburgh----
#   Road traffic accidents in Edinburgh. Next we’ll look at traffic accidents in Edinburgh. 
# The data are made available online by the UK Government. It covers all recorded accidents 
# in Edinburgh in 2018 and some of the variables were modified for the purposes of this assignment.
# The data can be found in the dsbox package, and it’s called accidents. You can find out
# more about the dataset by inspecting its documentation with ?accidents and you can also find 
# this information here. Recreate the following plot, and interpret in context of the data.

#### Install & load packages
#load libraries ggplot, here, tidyverse - adding pacman from live lecture 
#install and then Load library dsbox packages called accidents
# install.packages("pacman")


#Accidents dataset is within dsbox package
# install.packages("dsbox")
# install.packages("dsbox")
#install devtools per dsbox website
# install.packages("devtools")
#install github code into console to get a working dsbox installed
#check alternative versions 

library(ggpubr) 
library(tidyverse)
library(glue)
library(scales)
library(lubridate)
#For any plots below
# Global ggplotheme
# theme_set(theme_pubclean(base_size = 11))
theme_set(theme_minimal(base_size = 11))


library(ggplot2)

ggplot(accidents, aes(x = day_of_week, fill = severity)) +
  geom_density(alpha = 0.5) +
  labs(title = "Number of acciedent throughout the day",
       x = "Time of day",
       y = "Density"
  )





## 2 - NYC marathon winners----
  
# Install openintro
install.packages("openintro")
# load library openintro
library(openintro)
library(ggplot2)
# a. Create a histogram and a box plot of the distribution of marathon times of 
# all runners in the dataset. What features of the distribution are apparent in the histogram 
# and not the box plot? What features are apparent in the box plot but not in the histogram?
# 
#plot histogram
ggplot(nyc_marathon, aes(x = time)) +
  geom_histogram() +
  labs(title = "Histogram of NYC Marathon Times", 
       x = "Time in minutes", 
       y = "Number of Runners"
       ) 

#Now plot boxplot  
ggplot(nyc_marathon, aes(x = time)) +
geom_boxplot() +
  labs(title = "Histogram of NYC Marathon Times", 
       x = "Time in minutes", 
       y = "Number of Runners"
  ) 
# Features that are apparent in the boxplot are the outliers that hav more time and space further out on the 
# graph. 
  
# b. Create a side-by-side box plots of marathon times for men and women. Use different colors for 
# the each of the box plots – do not use the default colors, but instead manually define them 
# (you can choose any two colors you want). Based on the plots you made, compare the distribution 
# of marathon times for men and women.

ggplot(nyc_marathon, aes(division)) +
  geom_boxplot()+
   # scale_fill_manual( 
   #    "Men" = "orange",
   #    "Women" = "pink",
      # )+
  labs(title = "Marathon Times for Men and Women",
       x = "Gender",
       y = "Marathon Time (hours)"
       ) 
 




# ```

## 3 - US counties

## 4 - Rental apartments in SF

## 5 - Napoleon's march.
