v <- data.frame( 'name' = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'), 
                'score' =  c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
                'questions' = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
                'qualify' = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes'))
v$mean_score <- (v$score / v$questions)
v

our_list[[3]][1,]
our_list <- list("numbers_vec" = num_mat,
                 "letters" = let_vec,
                 "spp_pres" = species_dat,
                 "number" = 5)
names(our_list)
our_list$spp_pres

install.packages("devtools", dependencies = TRUE)
library("devtools")
install_github("r-lib/vroom")
library(vroom)



wad_dat <- vroom()
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
wad_dat <- vroom("./data/wader_data.csv")
covid_data <- vroom("./data/Workshop 3/time_series_covid19_deaths_global.csv")
head(covid_data)

##install the tidyverse
install.packages("tidyverse")
library("tidyverse")

class(covid_data)
covid_data
names(covid_data)[1:2] <- c("Province.State", "Country.Reigion")

covid_long <- covid_data %>% pivot_longer(cols = -c(Province.State,
                                                    Country.Reigion,
                                                    Lat,
                                                    Long))
covid_long
names(covid_long)[5] <- c("Date")
names(covid_long)[6] <- c("Deaths")
