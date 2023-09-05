---
title: "HW 01"
author: "Antonio Escalante Jr"
format: html
toc: true
---
  
## 1 - Road traffic accidents in Edinburgh
#load librabries gglplot, here, tidyverse
#install and then Load library dsbox packages called accidents
install.packages("accidents")
# install.packages("dsbox")
install.packages("dsbox")
 library(tidyverse)
 # library(accidents)
  
  `{r label-me-1}`

## 2 - NYC marathon winners
  
# Install openintro
install.packages("openintro")
# load library openintro
library(openintro)
library(ggplot2)
# a. Create a histogram and a box plot of the distribution of marathon times of 
# all runners in the dataset. What features of the distribution are apparent in the histogram 
# and not the box plot? What features are apparent in the box plot but not in the histogram?
# ```{r label-me-2}

ggplot(nyc_marathon, aes(x = time)) +
  geom_histogram() +
  labs(title = "Histogram of NYC Marathon Times", x = "Time (minutes)", y = "Number of Runners") 
  



  
  
  
# ```

## 3 - US counties

## 4 - Rental apartments in SF

## 5 - Napoleon's march.
