# Athuga hvort slembigögnin fylgi fræðilegri veldisdreifingu með LCG-aðferð
library(ggplot2)

# Línulegur samfelldur hendingaframleiðari (LCG)
lcg <- function(n, seed = 42, a = 1664525, c = 1013904223, m = 2^32) {
  x <- numeric(n)
  x[1] <- seed  # Upphafsgildi

  for (i in 2:n) {
    x[i] <- (a * x[i - 1] + c) %% m  # LCG formúla
  }

  return(x / m)  # Skilar jafndreifðum gildum á [0,1]
}

# Fjöldi hendinga
n <- 10000

# Nota LCG til að búa til jafndreifð gildi á [0,1]
set.seed(42)
uniform_lcg <- lcg(n)

# Nota innbyggða runif() aðferðina í R til samanburðar
uniform_r <- runif(n)

# Búa til gögn fyrir ggplot
uniform_data <- data.frame(
  value = c(uniform_lcg, uniform_r),
  type = rep(c("LCG", "runif()"), each = n)
)

# Teikna samanburð á LCG og runif() í sama grafinu með ggplot
p1 <- ggplot(uniform_data, aes(x = value, fill = type)) +
  geom_histogram(aes(y = after_stat(density)), bins = 50, alpha = 0.5, position = "identity") +
  stat_function(fun = dunif, args = list(min = 0, max = 1), linewidth = 1, inherit.aes = FALSE) +
  ggtitle("Jafndreifing: LCG vs runif()") +
  xlab("Gildi") + ylab("Líkindi") +
  theme_minimal()
ggsave('GitBook/random/figs/uniform_comparison.jpg', plot=p1, width = 6, height = 4)

# Breyta báðum í veldisdreifingu
lambda <- 2
exponential_lcg <- -log(uniform_lcg) / lambda
exponential_r <- rexp(n, rate = lambda)  # Nota innbyggða aðferð R

# Búa til gögn fyrir veldisdreifingu
exponential_data <- data.frame(
  value = c(exponential_lcg, exponential_r),
  type = rep(c("LCG", "rexp()"), each = n)
)

# Teikna samanburð á veldisdreifingu í sama grafinu með ggplot
p2 <- ggplot(exponential_data, aes(x = value, fill = type)) +
  geom_histogram(aes(y = after_stat(density)), bins = 50, alpha = 0.5, position = "identity") +
  stat_function(fun = dexp, args = list(rate = lambda), linewidth = 1, inherit.aes = FALSE) +
  ggtitle("Veldisdreifing: LCG vs rexp()") +
  xlab("Gildi") + ylab("Líkindi") +
  theme_minimal() + theme(legend.position='bottom')
ggsave('GitBook/random/figs/expon_comparison.jpg', plot=p2, width = 6, height = 4)

