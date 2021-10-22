library(tidyverse)
library(vroom) ## the first two lines load in the tidyverse and vroom packages

## importing the data to R from the desktop
to_sort_pop_1 <- vroom("./data/Workshop 3/to_sort_pop_1.csv")
to_sort_pop_2 <- vroom("./data/Workshop 3/to_sort_pop_2.csv")

## joining the two data frames together using the full_join function
sorted_pop <- full_join(to_sort_pop_1, 
                        to_sort_pop_2)

## pivoting the sorted dataframe around the columns: sp, 1-thr, 2-thr, 3-thr
long_sorted_pop <- sorted_pop %>% pivot_longer(cols = -c( species,
                                                          primary_threat,
                                                          secondary_threat,
                                                          tertiary_threat)
                                               )
 <- 