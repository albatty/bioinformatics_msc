library(tidyverse)
library(vroom)
covid_dat <- vroom("data/Workshop 3/time_series_covid19_deaths_global.csv")

#change the first two names of out data frame
names(covid_dat)[1:2] <- c("Province.State", "Country.Region")

#making the data long
covid_long <- covid_dat %>% pivot_longer(
  cols = -c(Province.State:Long),
  names_to = "Date",
  values_to = "Deaths"
)

# counts the number of covid deaths
sum(covid_long$Deaths)

#installing wbstats
install.packages("wbstats")
library(wbstats)

#extracting population data for all countries
pop_data <- wb_data(indicator = "SP.POP.TOTL",
                    start_date = 2002,
                    end_date = 2020)
#convert data to a tibble
pop_data <- as_tibble(pop_data)

#the maximun value of years
max(pop_data$date)

#filter the data to only include 2020 data
pop_2020 <- pop_data %>%
  filter(date == 2020)
pop_2020<-