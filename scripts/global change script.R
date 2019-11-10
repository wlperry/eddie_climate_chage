# global temperatues and co2 
# Eddie Module


# Load libraries -----
library(tidyverse)
library(readxl)
library(janitor)
library(lubridate)
library(broom)
library(plotly)

# Read files individually ----
global_temp.df <- read_excel("data/climate_change_module_dataset.xls", 
                             sheet = "Global Temperature",
                             skip=4)

vostok_co2.df <- read_excel("data/climate_change_module_dataset.xls", 
                            sheet = "Vostok CO2",
                            skip=4)

vostok_temp.df <- read_excel("data/climate_change_module_dataset.xls", 
                            sheet = "Vostok Temp",
                            skip=4)

loa_co2.df <- read_excel("data/climate_change_module_dataset.xls", 
                             sheet = "Mauna Loa CO2",
                             skip=4)


# Plot of global tempreatures ------
global_temp.plot <- global_temp.df %>%
                          ggplot(aes(year, temp_c)) +
                          geom_line()+
                          geom_point()
global_temp.plot
ggplotly(global_temp.plot)

# Plot of global tempreatures - subset -----
# Enter the years here
min_year_global = 1976
max_year_global =  1998

global_temp.plot <- global_temp.df %>%
  filter(year >= min_year_global & year <= max_year_global) %>%
  ggplot(aes(year, temp_c)) +
  geom_line()+
  geom_point()
global_temp.plot
ggplotly(global_temp.plot)


# Plot of Vostok tempreatures ------
vostok_temp.plot <- vostok_temp.df %>%
  ggplot(aes(ice_age_year_bp, temp_c)) +
  geom_line()+
  geom_point()
vostok_temp.plot
ggplotly(vostok_temp.plot)

# Plot of Vostok tempreatures - subset -----
# Enter the years here
min_year_vostok = 231979
max_year_vostok =  237643
# run this to see the number of years
max_year_vostok - min_year_vostok  

# plot of temp over time for sub area
vostok_temp.plot <- vostok_temp.df %>%
  filter(ice_age_year_bp >= min_year_vostok & ice_age_year_bp <= max_year_vostok) %>%
  ggplot(aes(ice_age_year_bp, temp_c)) +
  geom_line()+
  geom_point()
vostok_temp.plot
ggplotly(vostok_temp.plot)


                        

