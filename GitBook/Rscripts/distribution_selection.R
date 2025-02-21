set.seed(42)
data <- rnorm(100, mean = 50, sd = 10) # Slembigögn með normaldreifingu

summary_stats <- data.frame(
  Min = min(data),
  Max = max(data),
  Mean = mean(data),
  Median = median(data),
  Variance = var(data),
  Skewness = e1071::skewness(data)
)

print(summary_stats)

k <- floor(1 + log2(length(data))) # Regla Sturges fyrir fjölda stöpla í stöplariti
ggplot(data.frame(data), aes(x = data)) +
  geom_histogram(aes(y = ..density..), bins = k, fill = "lightgrey", color = "black") +
  geom_density(color = "red", size = 1) +
  labs(title = "Stöplarit með þéttleikafalli", x = "Gildi", y = "Þéttleiki") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/distribution_histogram.jpg", width = 6, height = 4)

ggplot(data.frame(sample = data), aes(sample = sample)) +
  stat_qq() +
  stat_qq_line(color = "red") +
  labs(title = "Q-Q línurit fyrir normaldreifingu") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/distribution_qq.jpg", width = 6, height = 4)