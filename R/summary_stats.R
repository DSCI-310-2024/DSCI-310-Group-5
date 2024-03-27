#' Count class observations
#'
#' Creates a new data frame with two columns, 
#' listing the classes present in the input data frame,
#' and the number of observations for each class.
#'
#' @param data_frame A data frame or data frame extension (e.g. a tibble).
#' @param class_col unquoted column name of column containing class labels
#'
#' @return A data frame with two columns. 
#'   The first column (named class) lists the classes from the input data frame.
#'   The second column (named count) lists the number of observations for each class from the input data frame.
#'   It will have one row for each class present in input data frame.
#'
#' @export
#'
#' @examples
#' count_classes(mtcars, am)
#' 

calc_summ_stats <- function(num_data,output_dir) {
  var_names <- names(num_data)
  
  # Create an empty data frame to store statistics
  # summary_df <- data.frame(row.names = var_names)
  # 
  # #  Calculate statistics for each column
  # for (var in var_names) {
  #   summary_df[, var] <- c(
  #     Min = min(num_data[[var]]),
  #     Max = max(num_data[[var]]),
  #     Mean = mean(num_data[[var]], na.rm = TRUE),
  #     SD = sd(num_data[[var]], na.rm = TRUE)
  #   )
  # } 
  
  # colnames(summary_df)[1:ncol(summary_df)] <- c("Min", "Max", "Mean", "SD")  # Adjust as needed
  print(var_names)
  # write_csv(summary_stats, file.path({{output_dir}}, "summary_stats.csv")) 
}

