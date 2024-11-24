
# accelerometerpackage

<!-- badges: start -->
<!-- badges: end -->

The goal of accelerometerpackage is to  analyze sequential accelerometer data which is composed of a x, y and z axis (i.e., three values for each time point. The data is a subset of one participants accelerometer data collected for one week at 100Hz. 

First, make sure to load the data found in Canvas.
Then run the following rows in order to prepare your data:
# Convert 'time' column to POSIXct
Data$time <- as.POSIXct(Data$time)

# Compute the Euclidean norm
Data <- dplyr::mutate(Data, combined_vector=sqrt(x^2 + y^2 + z^2))

``` r
library(accelerometerpackage)
## basic example code
```

