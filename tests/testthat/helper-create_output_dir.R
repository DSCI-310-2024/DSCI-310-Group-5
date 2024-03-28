# source in the create_scatter function
source("../../R/create_scatter.R")

# function input for create_output_dir function
wine_test_data <- data.frame(
  alcohol = c(12, 13, 14),
  total_phenols = c(2, 3, 4),
  cultivar = c("A", "B", "A")
)

# dataframe with empty columns
empty_data <- data.frame(
  alcohol = c(),
  total_phenols = c(),
  cultivar = c()
)

# individuals variables for testing
input_dir <- "../../data/wine_data.csv" # specify the correct input directory
fake_input_dir <- "fake_input_dir/" # invalid input directory
output_dir <- tempdir() # specify the correct output directory
invalid_scatter1 <- "scatter1" # giving a invalid variable for the scatterplot
invalid_scatter2 <- "scatter2" # giving a invalid variable for the scatterplot

# no expected output because it is just saving a plot to somewhere
