# Data Wrangling Spoon 3

# In this lesson we will learn to use dplyr::group_by() 
# and dplyr::ungroup() group_by can be used with the rest 
# of the dplyr functions (e.g., filter, select)

# We start by loading the packages we will use
library(tidyverse); library(gapminder)

# Let's recall how gapminder looks like
gapminder

# Last class we learned how to use summarize to calculate 
# summary numbers for our variables. 
# For example, the average for life expectancy
gapminder %>% 
    summarize(average = mean(lifeExp)) 

# How would you go about calculating the average life 
# expectancy for each continent rather than for the whole 
# data set? We can use group_by()


# _____________________________________
# Exercise. Let's practice some of what we know so far 
# for wrangling our data.

# Order and indent the following lines of code to calculate 
# the average life expectancy in 2007 in each continent. 
# You will need to add %>% at the end of some of the lines

summarize(mean(lifeExp))
gapminder
group_by(continent)
filter(year == 2007)
