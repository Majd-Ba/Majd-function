#' process_acceleration function
#' @export
#'
#' @description
#' a function that iteratively apply threshold_function and change direction function on
#' a data frame
#'
#' @param acceleration a numeric vector including acceleration values.
#' @param window an integer specifying the number of observations in each comparison window for the threshold_function.
#' @param Data a data frame where the output of the function will be stored in two new columns
#'
#' @return data frame with two new columns including the updated acceleration column and change direction


process_acceleration <- function(acceleration, window, Data) {

  n <- length(acceleration)
  updated_acceleration <- acceleration # Start with the original vector for updates
  binary_change <- rep(NA, n) # Initialize binary_change with NAs

  # Iterate over windows
  for (i in seq(1, n, by = window)) {
    # Define the start and end of the current window
    start <- i
    end <- min(i + window - 1, n)

    # Apply threshold_func within the window
    updated_acceleration[start:end] <- threshold_func(acceleration[start:end])

    # If the threshold was not exceeded, set all values in the window to the first value
    if (all(updated_acceleration[start:end] - acceleration[start]) < 0.5) {
      updated_acceleration[start:end] <- acceleration[start]
    }

    # Binary change is based on the first and last value in the window
    binary_change <- change_direction(acceleration)
  }

  # Update the corresponding columns in the original data frame
  Data$updated_acceleration <- updated_acceleration
  Data$binary_change <- binary_change

  return(Data)  # Return the modified data frame
}
