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
# install.packages("gridExtra")


library(ggpubr) 
library(tidyverse)
library(glue)
library(scales)
library(lubridate)
library(gridExtra)
# gridExtra::
#For any plots below
# Global ggplotheme
# theme_set(theme_pubclean(base_size = 11))
theme_set(theme_minimal(base_size = 11))


# library(ggplot2) #Very cool add on package I found that could be useful for the future 
# install.packages("devtools")
# library(devtools)
# install_github("kassambara/easyGgplot2")



p1 <- ggplot(accidents, aes(x = time, fill = severity)) +
  geom_density(alpha = 0.5) +
  labs(title = "Number of accident throughout the day",
       x = "Time of day",
       y = "Density"
  )
  
# This should take out fatality
accidents <- as.data.frame(accidents)
x <- accidents
x <- x[!grepl('Fatal', x$severity),]


p2 <- ggplot(x, aes(x = time, fill = severity)) +
  geom_density(alpha = 0.5) +
  labs(title = "Number of accident throughout the day",
       x = "Time of day",
       y = "Density"
  )



#I did grid arrange as faceting wasn't working 
grid.arrange(p1, p2, nrow =2)

# although in the graph example in the homework prompt I am not sure why Serious and Slight 
# do not look the same. As in the slopes are different from the top and bottom graphs


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
  scale_fill_manual(values = c("Male" = "blue4",
                               "Female" = "pink")
                    )+
  labs(title = "Marathon Times for Men and Women",
       x = "Gender",
       y = "Marathon Time (hours)"
       ) 
# What information in the above plot is redundant? Redo the plot avoiding this redundancy. 
# How does this update change the data-to-ink ratio?
  
# d. Visualize the marathon times of men and women over the years. As is usual with time series 
# plot, year should go on the x-axis.
# Use different colors and shapes to represent the times for men and women. Make sure 
# your colors match those in the previous part. Once you have your plot,
# describe what is visible in this plot but not in the others.

ggplot(nyc_marathon, aes(x = year)) +
  geom_histogram()
  





## 3 - US counties----
# US counties. The following questions use the county dataset in the openintro package. 
# You can find out more about the dataset by inspecting its documentation with ?county 
# and you can also find this information here.

# a. What does the following code do? Does it work? Does it make sense? Why/why not?
  
  ggplot(county) +
  geom_point(aes(x = median_edu, y = median_hh_income)) +
  geom_boxplot(aes(x = smoking_ban, y = pop2017))

# It creates agraph where the x-axis is the education attain and the y-axis is the median household income levels. It does the job 
# getting the correlation of degree to earnings

# b. Which of the following two plots makes it easier to compare poverty levels (poverty) 
# across people from different median education levels (median_edu)? What does this say about
# when to place a faceting variable across rows or columns?
  
ggplot(county |> filter(!is.na(median_edu))) + 
  geom_point(aes(x = homeownership, y = poverty)) + 
  facet_grid(median_edu ~ .)

ggplot(county |> filter(!is.na(median_edu))) + 
  geom_point(aes(x = homeownership, y = poverty)) + 
  facet_grid(. ~ median_edu)


# High school diploma and some college are easier to see when using the faceting. Faceting makes it easier 
# to compare with the data is too clustered together. The second one seems easier to read as it shares inforamtion
# in a smaller area 



# c. Recreate the R code necessary to generate the following graphs. Note that wherever a categorical variable is used in the plot, it’s metro.
library(openintro)


ggplot(county) + 
  geom_point(aes(x = homeownership, y = poverty)) + 
  geom_smooth(orientation = "county", 
              aes(x = homeownership, y = poverty), 
              method = "lm", se = FALSE, color = "blue") +
  facet_wrap(metro ~ .)  +
  labs(title = "Plot A and Plot B",
     x = "homeownership",
     y = "poverty")



# ggplot(county) + #Ignore this it was troubleshooting some code
#   geom_point(aes(x = homeownership, 
#                  y = poverty, 
#                  color = metro)
#              ) |>
#   facet_wrap(~ metro) +
#   labs(title = "Comparison of Price vs. Area across Metro categories",
#        x = "Area",
#        y = "Price") 






## 4 - Rental apartments in SF----
# Rental apartments in SF. The data for this exercise comes from TidyTuesday and it's on rental prices in San Francisco. 
# You can find out more about the dataset by inspecting its documentation here. The dataset you'll be using is called rent.
# Create a visualization that will help you compare the distribution of rental prices (price) per bedroom (beds) 
# across neighborhoods (nhood) in the city of San Francisco (city == "san francisco"), over time. Limit your analysis
# to rentals where the full unit is available, i.e. (room_in_apt	== 0). You have the flexibility to choose which years
# and which neighborhoods. Note that you should have a maximum of 8 neighborhoods on your visualization, but one or more 
# of them can be a combination of many (e.g., an "other" category). Your visualization should also display some measure 
# of the variability in your data. You get to decide what type of visualization to create and there is more than one 
# correct answer! In your answer, include a brief description of why you made the choices you made as well as 
# an interpretation of the findings of how rental prices vary over time and neighborhoods in San Francisco.

rent <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/rent.csv")
filtered_rent <- rent |>
  filter(city == "san francisco") +
  ggplot(aes(x = nhood, 
             y = price, 
             group = nhood, 
             color = years)) +
  geom_area()+
    labs(title = "Rentals in San Francisco",
         x = "Area",
         y = "Price")

# structure(rent)


 


## 5 - Napoleon's march.----
# Napoleon’s maNapoleon’s march plot
# by Charles John Minard in ggplot2. The data is provrch. The instructions for this exercise are simple: recreate the ided as a list, saved as napoleon.rds. Read it in using read_rds().
# This object has three elements: cities, temperatures, and troops. Each of these is a data frame, and the three 
# of them combined contain all of the data you need to recreate the visualization. Your goal isn’t to create 
# an exact replica of the original plot, but to get as close to it as you can using code you understand and can describe 
# articulately in your response. I’ll be the first to say that if you google “Napoleon’s march in ggplot2”, you’ll find 
# a bunch of blog posts, tutorials, etc. that walk you through how to recreate this visualization with ggplot2. 
# So you might be thinking, “why am I being asked to copy something off the internet for my homework?” Well, this is 
# an exercise in 
# (1) working with web resources and citing them properly, 
# (2) understanding someone else’s ggplot2 code and reproducing their work, 
# (3) describing what that code does in your own words, and finally 
# (4) putting some final touches to make the final product your own. Some more guidelines below:
  
#   You should make sure your response properly cites all of the resources you use. I’m defining “use” to include 
# “browse, read, get inspired by, or directly borrow snippets of code from”. You don’t need to worry about formal citations,
# it’s okay to make a list with links to your resources and provide a brief summary of how you used each one.
# For this exercise, you’re asked to describe what your code does (instead of interpreting the visualization, 
# since we already did that in class). If you write the code, it should be straightforward for you to describe it. 
# If you borrow any code from outside resources, you need to understand what that code does, and describe it, in your own 
# words. (This is important, you’re allowed to use found code, but you are not allowed to copy someone’s blog post 
#         or tutorial as your description of their code.)
# Finally, you should personalize the visualization with your own touch. You can do this in a myriad of ways, e.g.,
# change colors, annotations, labels, etc. This change should be made to make the plot more like the original in some way.
# You need to explicitly call out what change you made and why you made it.

#1) citations
# http://vita.had.co.nz/papers/layered-grammar.pdf
# https://www.datavis.ca/gallery/re-minard.php
# https://www.andrewheiss.com/blog/2017/08/10/exploring-minards-1812-plot-with-ggplot2/
# http://euclid.psych.yorku.ca/www/psy6135/tutorials/Minard.html

library(tidyverse)
library(ggplot2)
library(scales)        # additional formatting for scales
library(grid)          # combining plots
library(gridExtra)     # combining plots
library(dplyr)         # tidy data manipulations
napoleon_data <- read_rds("napoleon.rds")
#Checking Structure of data 
 as.data.frame(napoleon_data)
structure(napoleon_data)




#Using the code from the last cited website and transforming it with my data info 


#Attempt

breaks <- c(1, 2, 3) * 10^5
ggplot(napoleon_data[["troops"]], aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group),
            lineend="round") +
  scale_size("Survivors", range = c(1,10), #c(0.5, 15),
             breaks=breaks, labels=scales::comma(breaks)) +
  scale_color_manual("Direction",
                     values = c("#6636f5", "#7a0012"),
                     labels=c("Advance", "Retreat"))

#turn tibble into data frame so I don't get an error message 
# The changes I made to the snip of code I got from http://euclid.psych.yorku.ca/www/psy6135/tutorials/Minard.html
# was the colors as well as how I retreive the specfic data so the code would function. 
# Since the data from the website was configured differently into separate parts, as opposed to 
# how the data we were given were all together, I had to use indexing to go into the data and select
# the specific coloumn that I wanted to use. I am still so new at using R, and the fact I didn't use it 
# regularly over the summer, I forgot alot of the trick I picked up from my last data class. Although 
# I was never taught any of the specific grammar of R. In that class we were given all the code in markdown 
# and has to simily duplicate it. So going in blind like this is extrememly hard and time consuming when 
# I am plugging and checking. I've learned so much in this class already through many stressful night and 
# I know I will continue to learn. I just have to keep trying different ways to make the code work. 








     