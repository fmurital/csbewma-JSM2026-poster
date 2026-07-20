# Example script for running the csbewma package in a headless environment
# Run with: Rscript run_csbewma_example.R

# install.packages("csbewma")
library(csbewma) # Load the CS-BEWMA control chart package

############## Step 1: Generate Binary Process Data ##############
set.seed(2026) # Set random seed for reproducibility
# Define simulation parameters
k <- 10          # Number of binary streams/processes
n_time <- 500    # Number of observations over time
p0 <- 0.5        # In-control success probability
# Generate in-control binary data
# Each stream initially follows a Bernoulli(p0) distribution
bin_matrix <- matrix(rbinom(k * n_time, size = 1, prob = p0),nrow = k, ncol = n_time)

############## Step 2: Introduce Small Process Shifts (δ) ##############
# Shift probabilities for the first three streams
# These values represent subtle departures from the in-control probability p0 = 0.50
p1_vector <- c(0.56, 0.55, 0.60, rep(0.5, 7))
# Replace the first three streams with shifted processes
# while leaving the remaining seven streams unchanged
for (i in 1:3) {bin_matrix[i, ] <- rbinom(n_time,size = 1,prob = p1_vector[i])}

############## Step 3: Precompute EWMA Variance  ##############
# Precompute variance terms used by the CSB-EWMA chart
var_cache <- precompute_variance(
  lambda = 0.175,     #EWMA smoothing parameter
  max_t = n_time)

############## Step 4: Apply the CSB-EWMA Control Chart ##############
result <- csb_ewma(
  data = bin_matrix,
  lambda = 0.175, #lambda: EWMA smoothing parameter
  L = 1.375, # L: Control limit multiplier determining alarm threshold
  p0 = p0,  # p0:Significance level for post-hoc testing.
  posthoc_method = "BH", # posthoc_method:Benjamini-Hochberg adjustment to control FDR when identifying OOC
  alpha = 0.05   # Significance level for post-hoc testing.
)

##############  Step 5: Review Results ############## 
print(result) # Print summary of monitoring results
plot(result) # Visualize the monitoring chart and detected signals
identify_ooc(bin_matrix, p0 = p0, alpha = 0.05, method = "BH") ### (use bonferroni or holm)
