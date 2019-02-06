require(lmerTest)
test_data_means <- rnorm(10, 0, 6)
test_data_sds <- rep(1,10)
test_data_bias <- data.frame(bias_basis = c(rep("lab 1", 5), rep("lab 2", 5)), bias_value = c(rep(0,5), rep(1,5)))
n_results <- 4

results <- data.frame(repeat_num = numeric(), test = numeric())
for(i in 1:length(test_data_means)){
  repeat_num <- rep(i, n_results)
  test_i <- rnorm(n_results, test_data_means[i] + test_data_bias$bias_value[i], test_data_sds[i])
  results_i <- data.frame(repeat_num, test_i, rep(test_data_bias$bias_basis[i], n_results))
  results <- rbind(results, results_i)
  rm(results_i)
}
