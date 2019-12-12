# Data Wrangling Spoon 3

# In this lesson we will learn to use dplyr::group_by() and dplyr::ungroup()
# group_by can be used with the rest of the dplyr functions (e.g., filter, select)

# As usual we start by loading the packages we will use
library(tidyverse); library(gapminder)

# Let's recall how gapminder looks like
gapminder

# Last class we saw how `summarize` can be used to calculate summary numbers for
# our variables. For example the average for life expectancy
gapminder %>% 
    summarize(average = mean(lifeExp)) 

# So, how would you go about calculating the average life expectancy 
# for each continent rather than for the whole data set?
# group_by() to the rescue!


# _______________________________________________
# Exercises

# Order and indent the following lines of code to calculate the 
# average life expectancy in 2007 in each continent. You will need to add
# %>% at the end of some of the lines

summarize(mean(lifeExp))
gapminder
group_by(continent)
filter(year == 2007)


# Homework: Let's practice a bit more
# Complete the code missing so it calculates the average life expectancy by 
# country between 1990 and 2007. 

gapminder %>% 
    ____(between(year, 1990, 2007)) %>%
    ____(country) %>% 
    ____(average_1990_2007 = mean(lifeExp)) %>%
    ____()
