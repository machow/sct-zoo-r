---
title       : Insert the chapter title here
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf



--- type:NormalExercise lang:r xp:100 skills:1 key:6f2fb6af72
## More movies



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

