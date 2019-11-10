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
                          ggplot(aes(year, air_temp_c)) +
                          geom_line()+
                          geom_point()
global_temp.plot
ggplotly(global_temp.plot)

# Plot of global tempreatures - subset -----
# Enter the years here
min_year = 1976
max_year =  1998

global_temp.plot <- global_temp.df %>%
  filter(year >= min_year & year <= max_year) %>%
  ggplot(aes(year, air_temp_c)) +
  geom_line()+
  geom_point()
global_temp.plot
ggplotly(global_temp.plot)




                        

