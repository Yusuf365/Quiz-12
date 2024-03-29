# Stimulated data 12 c

library(tibble)
library(dplyr)

set.seed(123)

# Simulating data
data <- tibble(
  Year = rep(2004:2023, times = 5 * 4), # 5 hospitals, 4 cancer types, 20 years
  Hospital = rep(c('Hospital A', 'Hospital B', 'Hospital C', 'Hospital D', 'Hospital E'), each = 4 * 20),
  CancerType = rep(c('Lung', 'Breast', 'Prostate', 'Colorectal'), times = 5 * 20),
  Deaths = rpois(5 * 4 * 20, lambda = 100) # Assuming Poisson distribution for death counts
)


# Sample Test: Check the length (number of observations and columns)
expected_rows = 20 * 5 * 4 # 20 years, 5 hospitals, 4 types of cancer
expected_columns = 4 # Year, Hospital, CancerType, Deaths

# Check if the actual dimensions match the expected dimensions
actual_rows = nrow(data)
actual_columns = ncol(data)

test_passed_rows = actual_rows == expected_rows
test_passed_columns = actual_columns == expected_columns

list(
  test_passed_rows = test_passed_rows,
  test_passed_columns = test_passed_columns,
  message = if(test_passed_rows && test_passed_columns) "Test passed: Dataset has the correct dimensions." else "Test failed: Dataset dimensions are incorrect."
)