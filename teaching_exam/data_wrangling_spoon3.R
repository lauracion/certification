# Data Wrangling Spoon 3

# In this lesson we will learn to use dplyr::group_by() and dplyr::ungroup()
# group_by can be used with the rest of the dplyr functions (e.g., filter, select)

# As usual, we start by loading the packages we will use
library(tidyverse); library(gapminder)

# Let's recall how gapminder looks like
gapminder

# Last class we saw how summarize can be used to calculate summary numbers for
# our variables. For example the average for life expectancy
gapminder %>% 
    summarize(average = mean(lifeExp)) 

# So, how would you go about calculating the average life expectancy 
# for each continent rather than for the whole data set?
# group_by() to the rescue!
gapminder %>% 
    group_by(continent) # note the "Groups: continent [5]" in the output

# the result is grouped into rows that have the same combination of continent
# values: all countries in Asia are treated as one group, all in Africa as another 
# group and so on.

# By itself, group_by doesn't do much

# Other ways to say "grouped by continent" are "sliced by continent", 
# "aggregated by continent", "collapsed over continent"
gapminder %>% 
    group_by(continent)  %>% 
    summarize(average = mean(lifeExp))

# _____________________________________
# Let's practice some of what we know so far for wrangling our data
# Order and indent the following lines of code to calculate the 
# average life expectancy in 2007 in each continent. You will need to add
# %>% at the end of some of the lines

summarize(mean(lifeExp))
gapminder
group_by(continent)
filter(year == 2007)

# One solution:
gapminder %>% 
    filter(year == 2007) %>%
    group_by(continent) %>% 
    summarize(mean(lifeExp))
    
# _____________________________________
# Now we want the average life expectancy by continent and country
gapminder %>% 
    group_by(continent, country) # Note the "Groups: continent, country [142]" in the output

# the result is grouped into rows that have the same combination of continent
# and country values: all entries for Argentina in Americas are treated as one group,
# all in Japan in Asia as another group and so on.

gapminder %>% 
    group_by(continent, country) %>%  
    summarize(average = mean(lifeExp))

# But now you want to keep only the columns country and average in the output
gapminder %>% 
    group_by(continent, country) %>% 
    summarize(average = mean(lifeExp)) %>% 
    select(country, average)

# Oups! R gives a warning and keeps the column continent
# What is going on?
# To avoid having surprise problems with group_by(), everytime you use a 
# group_by, it is a great habit to use ungroup()
# Let us check how it works
# Adding ungroup() makes the problem go away
gapminder %>% 
    group_by(continent, country) %>% 
    summarise(average = mean(lifeExp)) %>% 
    ungroup() %>% 
    select(country, average)

# This is the result we wanted!

# _____________________________________
# Homework: Let's practice a bit more
# Complete the code missing so it calculates the average life expectancy by 
# continent each year between 1990 and 2007. 

gapminder %>% 
    ____(between(year, 1990, 2007)) %>%
    ____(continent, year) %>% 
    ____(average_1990_2007 = mean(lifeExp)) %>%
    ____()

# Solution
gapminder %>% 
    filter(between(year, 1990, 2007)) %>%
    group_by(continent, year) %>% 
    summarize(average_1990_2007 = mean(lifeExp)) %>%
    ungroup()
