library(ggplot2)

# Búa til slembirunu með AR(1) ferli
set.seed(42)
X <- arima.sim(model = list(ar = 0.5), n = 100)

# Reikna ACF og umbreyta í gagnaramma fyrir ggplot
acf_data <- acf(X, plot = FALSE)
acf_df <- data.frame(
  Lag = acf_data$lag[-1],   # Sleppum fyrsta gildinu (lag 0)
  Fylgni = acf_data$acf[-1]
)

# Reikna 95% öryggismörk fyrir ACF
ci <- qnorm(0.975) / sqrt(length(X))

# Teikna með ggplot
ggplot(acf_df, aes(x = Lag, y = Fylgni)) +
  geom_col(fill = "steelblue") +  # Súlurit fyrir fylgni
  geom_hline(yintercept = c(ci, -ci), linetype = "dashed", color = "red") + # Öryggismörk
  geom_hline(yintercept = 0, linetype = "dotted") + # Lína við 0
  labs(title = "Fylgni milli athugana", x = "Lag", y = "Fylgni") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/independence_acf.jpg", width = 6, height = 4)

set.seed(42)
X <- rnorm(100) # Slembigögn
tibble(Xi=X[-length(X)], Xi1=X[-1]) %>%
  ggplot(aes(x = Xi, y = Xi1)) +
  geom_point() + labs(title = "Dreifirit til að meta óhæði", x = expression(X[i]), y = expression(X[i+1])) +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/independence_scatter.jpg", width = 6, height = 4)