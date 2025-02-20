source('GitBook/GitBook/Rscripts/mm1.R')

# Function to compute lagged correlation of waiting times
compute_correlation <- function(waiting_times, max_lag = 10) {
  n <- length(waiting_times)

  correlation_values <- numeric(max_lag + 1)

  for (j in 0:max_lag) {
    X_i <- waiting_times[1:(n - max_lag)]
    X_j <- waiting_times[(1 + j):(n - max_lag + j)]

    mu_i <- mean(X_i)
    mu_j <- mean(X_j)
    sigma2_i <- var(X_i)
    sigma2_j <- var(X_j)

    correlation_values[j + 1] <- (mean(X_i * X_j) - mu_i * mu_j) / sqrt(sigma2_i * sigma2_j)
  }

  tibble(lag = 0:max_lag, correlation = correlation_values)
}

# Generate M/M/1 queue simulation data
n_customers <- 1000
sim_data_1 <- simulate_mm1(2.0, 1.0, n_customers)
sim_data_2 <- simulate_mm1(1.11, 1.0, n_customers)

# Compute correlation for both scenarios
cor_data_1 <- compute_correlation(sim_data_1$sim$waiting_time)
cor_data_2 <- compute_correlation(sim_data_2$sim$waiting_time)

# Combine the data
cor_data <- bind_rows(
  cor_data_1 %>% mutate(scenario_label = sim_data_1$scenario_label,
                        mu = sim_data_1$mu,
                        lambda = sim_data_1$lambda),
  cor_data_2 %>% mutate(scenario_label = sim_data_2$scenario_label,
                        mu = sim_data_2$mu,
                        lambda = sim_data_2$lambda)
) %>% mutate(rho = round(lambda / mu,2))

# Plot correlation decay
ggplot(cor_data, aes(x = lag, y = correlation, color = scenario_label)) +
  geom_point() +
  geom_line() +
  labs(
    title = "Correlation Decay in M/M/1 Queue",
    x = "Lag (j)",
    y = "Correlation"
  ) +
  geom_text(
    data = cor_data %>% filter(lag == mean(lag)),
    aes(label = paste0("rho = lambda/mu = ", rho)),
    hjust = 1,
    vjust = 1
  ) +
  theme_minimal()

ggsave("GitBook/GitBook/probability_review/figs/figure_410.jpg", width = 6, height = 4)
