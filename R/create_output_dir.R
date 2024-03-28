#' Function for making a scatterplot and placing it in the output directory
#'
#' Makes the output directory if it does not already exist,
#' reads the data in and makes sure it is in the right format,
#' calls a function to make a scatterplot, 
#' and saves the scatterplot to the output directory
#'
#' @param scatter1 The first scatterplot variable
#' @param scatter2 The second scatterplot variable
#' @param input_dir The path to the input directory
#' @param output_dir The path to the output directory
#'
#' @return creates and saves the scatterplot to the right output directory
#' @export
#'
#' @examples
#' create_output_dir('alcohol', 'total_phenols', '../data/wine_data.csv', '../results/')

create_output_dir <- function(scatter1, scatter2, input_dir, output_dir) {
  # create output_dir if it does not exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # read the data in from the input directory
  data <- readr::read_csv(input_dir)
  # change cultivar into a factor
  data$cultivar <- factor(data$cultivar)
  
  # call function for making a scatterplot
  scatter <- create_scatter_plot(data, scatter1, scatter2)
  
  # save the scatterplot to our output directory as a png
  ggsave(file.path(output_dir, "scatterplot.png"), scatter, device = "png", width = 5, height = 3)
}
