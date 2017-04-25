---
title       : Issues
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf



--- type:NormalExercise lang:r xp:100 skills:1 key:ba3ff3004c

## Adding a spatially autocorrelated effect

Adding a spatial term to the model.

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(sp)
library(raster)
library(R2BayesX)
library(spdep)

data_dir <- "/usr/local/share/datasets"
london <- readRDS(file.path(data_dir, "london_2017_2.rds"))


```

*** =sample_code
```{r}
# do this
borough_nb <- ___
borough_gra <- ___

# then this
flu_spatial <- ___
```

*** =solution
```{r}
# do this
borough_nb <- poly2nb(london)
borough_gra <- nb2gra(borough_nb)

# then this
flu_spatial <- bayesx(Flu_OBS ~ HealthDeprivation + sx(i, bs = "spatial", map = borough_gra),
                      offset = log(london$TOTAL_POP),
                      family = "poisson",
                      data = data.frame(london))

```

*** =sct
```{r}

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
