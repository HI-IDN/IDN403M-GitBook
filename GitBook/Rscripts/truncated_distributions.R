# Slembigögn
X <- c(3, 4, 5, 4, 5, 6, 4, 80, 20, 8, 10, 25, 10, 9, 8, 8, 9)
X <- sort(X)
n <- length(X)

# Finna k
k <- which(X[-c(1, n)] > X[1])[1] + 1

# Reikna staðsetningarstika
gamma_hat <- (X[1] * X[n] - X[k]^2) / (X[1] + X[n] - 2 * X[k])
cat("Áætlað gildi fyrir γ (hliðrun):", gamma_hat, "\n")



set.seed(42)
X <- rweibull(100, shape = 2, scale = 5) + 30  # Hliðrun um gamma = 30

# Teikna Weibull dreifingu með hliðrun
library(ggplot2)
k <- floor(1 + log2(length(X)))  # Sturges regla
ggplot(data.frame(X), aes(x = X)) +
  geom_histogram(aes(y = ..density..), bins = k, fill = "lightgrey", color = "black", alpha = 0.7) +
  stat_function(fun = function(x) dweibull(x - 30, shape = 2, scale = 5),
                color = "red", size = 1) +
  labs(title = "Hliðruð Weibull dreifing", x = "Gildi", y = "Þéttleiki") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/distribution_shifted.jpg", width = 6, height = 4)
