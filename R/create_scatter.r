#' Create a scatterplot with the specified X and Y variables
#'
#' @param data A dataframe
#' @param scatter1 A column in the dataframe we are interested in visualizing on the x-axis
#' @param scatter2 A column in the dataframe we are interested in visualizing on the y-axis
#'
#' @return A ggplot scatterplot with the specified columns on the x and y axes
#' @export
#'
#' @examples
#' create_scatter_plot(wine_data, 'alcohol', 'total_phenols')

create_scatter_plot <- function(data, scatter1, scatter2) {
  # first check if scatter1 and scatter2 exist in the data
  if (!scatter1 %in% colnames(data) || !scatter2 %in% colnames(data)) {
    stop("One or both of the inputted variables do not exist in the dataframe")
  }
  
  # make the scatter plot
  ggplot(data, aes(x = !!sym(scatter1), y = !!sym(scatter2), color = cultivar)) +
    geom_point() +
    labs(
      title = paste("Scatter Plot of", scatter1, "vs", scatter2),
      x = scatter1,
      y = scatter2)
}