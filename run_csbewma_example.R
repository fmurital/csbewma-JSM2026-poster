# Example script for running the csbewma package in a headless environment
# Run with: Rscript run_csbewma_example.R

library(csbewma)

set.seed(2026)

k <- 10
n_time <- 500
p0 <- 0.5

bin_matrix <- matrix(rbinom(k * n_time, size = 1, prob = p0), nrow = k, ncol = n_time)

p1_vector <- c(0.56, 0.55, 0.60, rep(0.5, 7))
for (i in 1:3) {
  bin_matrix[i, ] <- rbinom(n_time, size = 1, prob = p1_vector[i])
}

result <- csb_ewma(
  data = bin_matrix,
  lambda = 0.175,
  L = 1.375,
  p0 = p0,
  posthoc_method = "BH",
  alpha = 0.05
)

print(result)

pdf(file = "csbewma_plot.pdf")
plot(result)
dev.off()

cat("Plot saved to csbewma_plot.pdf\n")
print(identify_ooc(bin_matrix, p0 = p0, alpha = 0.05, method = "BH"))
