#' change direction function
#'
#' @export
#'
#' @description
#' A function to indicate the direction of change in value between current value and the next one.
#' i.e. whether the current value is bigger, smaller or equal to the next value
#'
#' @param value a numeric vector of values.
#'
#' @return A modified vector with values 1,-1, or 0 depending on whether the direction of change
#' was increasing, decreasing or no change.
#'



change_direction <- function(value) {

  # Initialize a vector to store the results
  result <- numeric(length(value))
  n <- length(value)

  # Loop only up to the second-to-last value
  for (i in seq_len(n - 1)) {
    # Compare the current value with the next one
    if (value[i] > value[i+1]) {
      result[i] <- 1  # value increased
    } else if (value[i] < value[i+1]) {
      result[i] <- -1  # value decreased
    } else {
      result[i] <- 0  # No change in value
    }
  }

  return(result)
}
