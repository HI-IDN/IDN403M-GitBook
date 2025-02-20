library(tidyverse)

# Function to simulate an M/M/1 queue
simulate_mm1 <- function(mean_interarrival, mean_service, n_customers, seed = 42) {
  set.seed(seed)

  # Initialize vectors
  A <- numeric(n_customers + 1)  # Interarrival times
  S <- numeric(n_customers)  # Service times
  X <- numeric(n_customers + 1)  # Waiting times

  # Generate interarrival and service times using -mean * log(rand(1))
  for (i in 1:n_customers) {
    S[i] <- -mean_service * log(runif(1))  # Service time
    A[i + 1] <- -mean_interarrival * log(runif(1))  # Interarrival time
  }

  # Compute waiting times
  # Note, X[1] is initialized as 0, because there is no waiting time for the first customer
  for (i in 1:n_customers) {
    X[i + 1] <- max(X[i] + S[i] - A[i + 1], 0)
  }

  lambda <- 1 / mean_interarrival
  mu <- 1 / mean_service

  list(
    sim = tibble(
      customer = 1:n_customers,
      waiting_time = X[-1]  # Exclude first value since it's initialized as 0
    ),
    lambda = lambda,
    mu = mu,
    w_theoretical = 1 / (mu - lambda),
    num_customers = n_customers,
    scenario_label = paste0("lambda == ", round(lambda, 2), "~~~ mu == ", round(mu, 2))
  )
}

n_customers <- 1000

# Simulate for two different scenarios
sim_data_1 <- simulate_mm1(2.0, 1.0, n_customers)
sim_data_2 <- simulate_mm1(1.11, 1.0, n_customers)

sim_data <- bind_rows(
  mutate(sim_data_1$sim, scenario_label = sim_data_1$scenario_label),
  mutate(sim_data_2$sim, scenario_label = sim_data_2$scenario_label)
)

theoretical <- tibble(
  waiting_time = c(sim_data_1$w_theoretical, sim_data_2$w_theoretical),
  scenario_label = c(sim_data_1$scenario_label, sim_data_2$scenario_label)
)

k_sturges <- function(n) {
  round(1 + log2(n))
}

# Plot comparison with LaTeX-rendered labels
ggplot(sim_data, aes(x = waiting_time, fill = scenario_label)) +
  geom_histogram(bins = k_sturges(n_customers), alpha = 0.5, position = "identity") +
  geom_vline(data = theoretical, aes(xintercept = waiting_time, color = scenario_label),
             linetype = "dashed", size = 1) +
  scale_fill_manual(
    name = "Scenario",
    values = c("red", "blue"),
    labels = lapply(unique(sim_data$scenario_label), function(x) parse(text = x))
  ) +
  scale_color_manual(
    name = "Theoretical",
    values = c("red", "blue"),
    labels = lapply(unique(theoretical$scenario_label), function(x) parse(text = x))
  ) +
  labs(
    title = "Simulated vs. Theoretical Waiting Time Distribution",
    x = "Waiting Time",
    y = "Count"
  ) +
  theme_minimal()
