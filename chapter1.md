---
title       : Insert the chapter title here
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf



--- type:NormalExercise lang:r xp:100 skills:1 key:96d069d603
## test_expression_result and randomness


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
custom_seed(123)
```

*** =sample_code
```{r}
library(MASS)
M <- matrix(rnorm(300), nrow=100)
```

*** =solution
```{r}
library(MASS)
M <- matrix(rnorm(300), nrow=100)
```

*** =sct
```{r}
test_expression_result("cov.rob(M)$cov")
```
--- type:NormalExercise lang:r xp:100 skills:1 key:6f2fb6af72
## Issue 71: test_function



*** =pre_exercise_code
```{r}
source("http://s3.amazonaws.com/assets.datacamp.com/production/course_1414/datasets/shared.R")
votes_joined <- read_dataset("votes_joined")
```

*** =sample_code
```{r}
# Load the tidyr package
library(tidyr)

# Gather the six mu/nu/di/hr/co/ec columns
votes_joined %>%
  gather(topic, has_topic, me:ec)

# Perform gather again, then filter
votes_gathered <- votes_joined %>%
  gather(topic, has_topic, me:ec) %>%
  filter(has_topic == 1)
```

*** =solution
```{r}
# Load the tidyr package
library(tidyr)

# Gather the six mu/nu/di/hr/co/ec columns
votes_joined %>%
  gather(topic, has_topic, me:ec)

# Perform gather again, then filter
votes_gathered <- votes_joined %>%
  gather(topic, has_topic, me:ec) %>%
  filter(has_topic == 1)
```

*** =sct
```{r}
test_library_function("tidyr")
# TODO: why does this throw an error?
test_function("gather", args = c("data", "key", "value"))

# test_correct({
#     test_data_frame("votes_gathered", incorrect_msg = "Did you gather the six columns (`mu`, `nu`, `di`, `hr`, `co`, and `ec`) and filter such that `has_topic == 1` to create the `votes_gathered` dataset?")
#     }, {
#     test_function("gather", args = c("data", "key", "value"))
#     test_function("filter")
# })

test_error()
success_msg("Awesome job!")
```



--- type:NormalExercise lang:r xp: skills: key:8144ede3b8
## Issue 70: test_output_contains


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(ggplot2)
source("http://s3.amazonaws.com/assets.datacamp.com/production/course_1414/datasets/shared.R")
votes_processed <- read_dataset("votes_processed")
```

*** =sample_code
```{r}

```

*** =solution
```{r}
# Start with by_year_country dataset
by_year_country <- votes_processed %>%
  group_by(year, country) %>%
  summarize(total = n(),
            percent_yes = mean(vote == 1))

# Print by_year_country
by_year_country

# Create a filtered version: UK_by_year
UK_by_year <- by_year_country %>%
  filter(country == "United Kingdom")

# Line plot of percent_yes over time for UK only
ggplot(UK_by_year, aes(year, percent_yes)) +
  geom_line()
```

*** =sct
```{r}
test_data_frame("by_year_country", incorrect_msg = "Don't change the code given to you to create `by_year_country`! This was defined in the previous exercise, remember?")

# TODO: throws error even though it's printed...
#test_output_contains("by_year_country", incorrect_msg = "Did you print `by_year_country` to the console?")

test_correct({
    test_function_result("filter", incorrect_msg = "Did you filter `by_year_country` such that `country` equals `'United Kingdom'`?")
    }, {
    test_function("filter", ".data")
    test_data_frame("UK_by_year", undefined_msg = "Don't forget to define `UK_by_year`!")
})

test_ggplot(data_fail_msg = "Did you use the `UK_by_year` as the `data` argument to your `ggplot()` call?",
            aes_fail_msg = "Something's wrong in the `aes()` layer of your `ggplot()` call. Did you plot `year` on the x-axis and `percent_yes` on the y-axis?",
            geom_fail_msg = "Did you add a `geom_line` layer with `geom_line()` to your call to `ggplot()`?")

test_error()
success_msg("Fantastic job!")
```


--- type:NormalExercise lang:r xp: skills: key:2488e7033d
## Issue 69: ggplot

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(ggplot2)
source("http://s3.amazonaws.com/assets.datacamp.com/production/course_1414/datasets/shared.R")
by_year_country <- read_dataset("by_year_country")
```

*** =sample_code
```{r}

```

*** =solution
```{r}
# Vector of six countries to examine
countries <- c("United States", "United Kingdom",
               "France", "Japan", "Brazil", "India")

# Filtered by_year_country: filtered_6_countries
filtered_6_countries <- by_year_country %>%
  filter(country %in% countries)

# Line plot of % yes over time faceted by country
ggplot(filtered_6_countries, aes(year, percent_yes)) +
  geom_line() +
  facet_wrap(~ country)
```

*** =sct
```{r}
test_predefined_objects("countries")

test_correct({
    test_data_frame("filtered_6_countries", incorrect_msg = "Did you `filter()` such that your new dataset contains all the countries listed in the vector `countries`? The `%in%` operator may prove useful here.")
    }, {
    test_function("filter", ".data")
})

#TODO: how to test facet_wrap() content? facet_fail_msg never gets used...
test_ggplot(data_fail_msg = "Did you use the `filtered_6_countries` as the `data` argument to your `ggplot()` call?",
            aes_fail_msg = "Something's wrong in the `aes()` layer of your `ggplot()` call. Did you plot `year` on the x-axis and `percent_yes` on the y-axis?",
            geom_fail_msg = "Did you add a `geom_line` layer with `geom_line()` to your call to `ggplot()`?",
            facet_fail_msg = "Did you add a facet layer with `facet_wrap()`? Make sure to use the correct syntax: `~ country`.")
# WORKAROUND ----
test_function("facet_wrap", args = "facets", eval = FALSE)
# ---
test_error()
success_msg("Great work!")
```
