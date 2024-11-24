#' threshold function
#' @export
#' @description
#' A function to modify values only if the difference between the current value and the next value exceeds a threshold
#' @param value a numeric vector of values.
#' @param threshold a numeric value indicating threshold.
#' @return A modified vector with values updated based on the threshold condition
#'
#'

threshold_func <- function(value, threshold=0.5) {
  # Arguments:
  # - value: A numeric vector of values.
  # - threshold: A numeric value indicating the threshold for difference

  n <- length(value)
  updated <- value # Copy of the original vector for modification

  for (i in seq_len(n - 1)) { # Loop only up to the second-to-last value
    # Calculate the difference with the next value
    diff_next <- value[i] - value[i + 1]

    # Check if the difference exceeds the threshold
    if (abs(diff_next) > threshold) {
      # Update to the next value if the threshold is exceeded
      updated[i] <- value[i + 1]
    }
  }

  return(updated)
}
