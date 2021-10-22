library(tidyverse)
library(vroom)

wide_spp.1 <- vroom("./data/Workshop 3/to_sort_pop_1.csv")
wide_spp.2 <- vroom("./data/Workshop 3/to_sort_pop_2.csv")
long_spp <- full_join(wide_spp.1, wide_spp.2) %>%
  pivot_longer(cols = -c(species, 
                         primary_threat, 
                         secondary_threat, 
                         tertiary_threat), 
               names_to = c("population", "date"),
               names_pattern = "(.*)_(.*)",
               ##removing the n/a values
               values_drop_na = T, 
               values_to = "abundance")

#formatting the dates as dates using an uppercase Y as year is yyyy (not yy)
slong_spp$date_formatted <- as.Date(long_spp$date, format = "%Y-%m-%d")

#creating the base plot with
plot_1 <- ggplot(data = long_spp, aes(x = date_formatted, y = abundance)) 

#plotting every species on one graph creating a cluster fuck
plot_1 + geom_line(aes(col = species)) + theme(legend.position = "none")

#creating a subset of the populations 
select_pop <- c("Tortula subulata", "Cinclidotus nigricans", "Sphagnum palustre", "Pleuridium acuminatum", "Thamnobryum alopecurum", "
Cirriphylum crassinervium", "Bartramia halleriana", "Sphagnum squarrosum")

# using ggplot to create a base plot that filters the species used as set by the list and only to population 1
sel_pop1_plot <- ggplot(data = long_spp %>% filter(species %in% select_pop, population == "pop_1"), aes(x = date_formatted, y = abundance))
#adding a line and colour
sel_pop1_plot + geom_line(aes(col=species))

# using ggplot to create a base plot that filters the species used as set by the list and only to population 2
sel_pop2_plot <- ggplot(data = long_spp %>% filter(species %in% select_pop, population == "pop_2"), aes(x = date_formatted, y = abundance))
#adding a line and colour
sel_pop2_plot + geom_line(aes(col=species))

#======================================================creating dataframes, filtering by primary threat===========================================================================#
climate_threat <- long_spp %>% filter(primary_threat == "Climate change")

exploitation_threat <- long_spp %>% filter(primary_threat == "Exploitation")

habitat_destruction_threat <- long_spp %>% filter(primary_threat == "Habitat destruction")

habitat_fragmentation_threat <- long_spp %>% filter(primary_threat == "Habitat fragmentation")

habitat_loss_threat <- long_spp %>% filter(primary_threat == "Habitat loss")

pollution_threat <- long_spp %>% filter(primary_threat == "Pollution")

#=====================================================creating the separate plots using specified dataframes======================================================================#
climate_plot <- ggplot(data = climate_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))
exploitation_plot <- ggplot(data = exploitation_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))
habitat_destruction_plot <- ggplot(data = habitat_destruction_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))
habitat_fragmentation_plot <- ggplot(data = habitat_fragmentation_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))
habitat_loss_plot <- ggplot(data = habitat_loss_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))
pollution_plot <- ggplot(data = pollution_threat, aes(x = date_formatted, y = abundance)) + geom_line(aes(col=species)) + geom_point(aes(col=species))

#======================================================doing it all a better way================================================================================================#
population_1 <- ggplot(data = long_spp %>% filter(population == "pop_1"), aes(x = date_formatted, y = abundance))

population_1 + facet_wrap(. ~ primary_threat) + geom_line(aes(col=species)) + geom_point(aes(col=species)) + labs(x="Date", y = "Abundance") + ggtitle("Resopnse of Species Abundace in Population 1 Over Time")

population_2 <- ggplot(data = long_spp %>% filter(population == "pop_2"), aes(x = date_formatted, y = abundance))

population_2 + facet_wrap(. ~ primary_threat) + geom_line(aes(col=species)) + geom_point(aes(col=species)) + labs(x="Date", y = "Abundance") + ggtitle("Resopnse of Species Abundace in Population 2 Over Time") 
