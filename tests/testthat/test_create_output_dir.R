# load the necessary libraries
library(testthat)

# call in the function that we are testing
source("../../R/create_output_dir.R")

# test that the output directory has been created
test_that("`create_output_dir` correctly creates the output directory when it does not exist", {
  create_output_dir('alcohol', 'total_phenols', input_dir, output_dir) # run function
  expect_true(dir.exists(output_dir), info = "Output directory should be created")
})

# test that the function is making the scatterplot and saving it to the output directory
test_that("create_output_dir is creating and saving the scatterplot correctly", {
  create_output_dir('alcohol', 'total_phenols', input_dir, output_dir) # run function
  
  # get the filepath that the function saved the scatterplot to
  file_path <- file.path(output_dir, "scatterplot.png")
  
  expect_true(file.exists(file_path), info = "Scatterplot should be saved in output directory")
})

# test that the function is throwing an error when the input directory is invalid
test_that("`create_output_dir` throws an error for an invalid input directory", {
  invalid_input_dir <- fake_input_dir # give the fake directory
  expect_error(create_output_dir("alcohol", "total_phenols", invalid_input_dir, output_dir),
               info = "Should throw an error for invalid input directory")
})

# test that the function throws an error for invalid inputs of the variables
test_that("`create_output_dir` throws an error for an invalid inputs for `scatter1`, 
          `scatter2`, and `input_dir`", {
  # test variations of incorrect inputs
  expect_error(create_output_dir(invalid_scatter1, 'total_phenols', input_dir, output_dir))
  expect_error(create_output_dir('alcohol', invalid_scatter2, input_dir, output_dir))
  expect_error(create_output_dir('alcohol', 'total_phenols', fake_input_dir, output_dir))
})

# test that the function throws an error for an empty scatter plot variables
test_that("`create_output_dir` throws an error for scatterplot variables with no data", {
  expect_error(create_output_dir(empty_data$alcohol, empty_data$total_phenols, input_dir, output_dir))
})


# test that the function is converting cultivar to a factor
test_that("`create_output_dir` is converting cultivar into a factor", {
  data <- readr::read_csv(input_dir) # read in the data from the input directory as we do in the function
  data$cultivar <- factor(data$cultivar) # check the method we use in the function to convert it to a factor
  expect_is(data$cultivar, "factor", info = "The 'cultivar' column should be converted into a factor")
})

# all 8 tests pass
