Sys.setlocale("LC_ALL", "is_IS.UTF-8")
library(tidyverse)
library(cowplot)

# Strjál raundreifing
X <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
df_strjal <- as_tibble(table(X)) %>% rename(x = X, freq = n) %>% mutate(prob = freq / sum(freq))

ggplot(df_strjal, aes(x = as.factor(x), y = prob)) +
  geom_col(fill = "lightblue") +
  labs(title = "Strjál raundreifing", x = "Gildi", y = "Líkindi") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/empirical_discrete.jpg", width = 6, height = 4)

# Samfelld raundreifing (Continuous empirical distribution)
set.seed(42)
X_samfelld <- runif(100, min = 0, max = 10)

ggplot(data.frame(X_samfelld), aes(x = X_samfelld)) +
  stat_ecdf(geom = "step", color = "blue") +
  labs(title = "Samfelld raundreifing", x = "x", y = "F(x)") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/empirical_continuous.jpg", width = 6, height = 4)

## Samanburður á raundreifingum og líkindum
n <- 1000
X_norm <- rnorm(n, mean = 5, sd = 2)

k <- round(1 + log2(n)) # Regla Sturges fyrir fjölda stöpla
ggplot(data.frame(X_norm), aes(x = X_norm)) +
  geom_histogram(aes(y = ..density..), fill = "lightgrey", bins = k, alpha = 0.6) +
  geom_density(aes(color = "Raunveruleg"), size = 1, linetype = "dashed") +
  stat_function(fun = dnorm, args = list(mean = mean(X_norm), sd = sd(X_norm)),
                aes(color = "Fræðileg"), size = 1) +
  labs(title = "Samanburður á fræðilegri og raundreifingu", x = "x", y = "Þéttleiki",
       color="Dreifing") +
  theme_minimal()
ggsave("GitBook/GitBook/results_analysis/figs/empirical_comparison.jpg", width = 6, height = 4)