
# accelerometerpackage

<!-- badges: start -->
<!-- badges: end -->

The goal of accelerometerpackage is to  analyze sequential accelerometer data which is composed of a x, y and z axis (i.e., three values for each time point. The data is a subset of one participants accelerometer data collected for one week at 100Hz. 


# Here is a step by step code to generate the required plot


``` r
# First, load the data found in Canvas
library(readr)
Example_window <- read_csv("path_to_data/Example_window.csv")

#name our data
Data <- Example_window

# Convert 'time' column to POSIXct
Data$time <- as.POSIXct(Data$time)

# Compute the Euclidean norm
Data <- dplyr::mutate(Data, combined_vector=sqrt(x^2 + y^2 + z^2))

# load the created package
library(accelerometerpackage)

# generate the desired data frame using the created package
newdata <- process_acceleration(Data$combined_vector, window = 100, Data)

# generate the desired line plot
lineplot(newdata, newdata$time, newdata$combined_vector, newdata$updated_acceleration)


```

