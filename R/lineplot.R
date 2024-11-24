#' lineplot function
#' @export
#'
#' @description
#' a wrapper function for ggplot showing two lines in a line plot.
#'
#' @param Data data frame.
#' @param xaxis the column including values of xaxis, e.g. time variable.
#' @param vector1 the column including the values of the first line of interest.
#' @param vector2 the column including the values of the second line of interest.
#'
#' @return a line plot created using ggplot
#'
#' @import ggplot2


lineplot <- function(Data, xaxis, vector1, vector2) {
  # Create the plot
  ggplot2::ggplot(Data, aes(x = xaxis)) +
    ggplot2::geom_line(ggplot2::aes(y = vector1, color = "vector1"), size = 1) +
    ggplot2::geom_line(ggplot2::aes(y = vector2, color = "vector2"), size = 1) +
    ggplot2::scale_color_manual(values = c("vector1" = "blue", "vector2" = "red")) +
    ggplot2:: labs(x = "Time", y = "Value", color = "Lines") +
    ggplot2::theme_minimal()
}
