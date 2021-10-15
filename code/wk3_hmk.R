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
## renaming the new abundance column 
names(long_sorted_pop)[6] <- c("Abundance")

## two sets of data are included in the name column, splitting three ways by the _ to distinguish pop and date
final_long_pop <- long_sorted_pop %>% separate(name, 
                                               c("eh", "population","date"),
                                               "_")
## deleting the third redundant column 'eh'
final_long_pop$eh <- NULL

## finally organising the data by ascending date
species_data <- final_long_pop[order(final_long_pop$date),] 

species_data