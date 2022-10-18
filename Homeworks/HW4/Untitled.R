library("readr")
library("dplyr")

glass_data <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/glass.data",
                       col_names = c("Id", "RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe", "Type_Of_Glass"))

glass_data

glass_data$Type_Of_Glass <- factor(glass_data$Type_Of_Glass) 

glass_data$Type_Of_Glass <- recode(glass_data$Type_Of_Glass, 
                                          "1" = "building_windows_float_processed",
                                          "2" = "building_windows_non_float_processed",
                                          "3" = "vehicle_windows_float_processed", 
                                          "4" = "vehicle_windows_non_float_processed", 
                                          "5" = "containers", 
                                          "6" = "tableware",
                                          "7" = "headlamps")

glass_data %>% 
  filter((Fe < 0.2) & Type_Of_Glass %in% c("tableware", "headlamps"))


# yeast data 
yeast_data <- read_table("https://www4.stat.ncsu.edu/~online/datasets/yeast.data", 
                       col_names = c("seq_name", "mcg", "gvh", "alm", "mit", "erl", "pox", "vac", "nuc", "class"))

yeast_data

yeast_data %>% 
  select(class, mcg) %>% 
  group_by(class) %>% 
  summarise(mean_mcg = mean(mcg), std_mcg = sd(mcg))

# Part 3 
install.packages("DBI")
install.packages("RSQLite")
library("DBI")
library("RSQLite")


