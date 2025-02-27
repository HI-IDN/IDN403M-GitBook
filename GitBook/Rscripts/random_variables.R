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
  xlab("Gildi") +
  ylab("Líkindi") +
  theme_minimal()
ggsave('GitBook/random/figs/uniform_comparison.jpg', plot = p1, width = 6, height = 4)

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
  xlab("Gildi") +
  ylab("Líkindi") +
  theme_minimal() +
  theme(legend.position = 'bottom')
ggsave('GitBook/random/figs/expon_comparison.jpg', plot = p2, width = 6, height = 4)

# Höfnunarval fyrir Beta dreifingu
rejection_sampling_beta <- function(n, alpha, beta) {
  samples <- numeric(n)
  count <- 0
  M <- dbeta((alpha - 1) / (alpha + beta - 2), alpha, beta)  # Hámark Beta(alpha, beta)
  acceptance <- data.frame(u1 = numeric(0), u2 = numeric(0))  # Listi fyrir samþykkt gildi
  rejection <- data.frame(u1 = numeric(0), u2 = numeric(0))  # Listi fyrir hafnað gildi

  while (count < n) {
    u1 <- runif(1, 0, 1)  # Kandidat úr jafndreifingu [0,1]
    u2 <- runif(1, 0, M)  # Markgildi úr [0, M]

    if (u2 < dbeta(u1, alpha, beta)) {
      count <- count + 1
      samples[count] <- u1
      acceptance <- rbind(acceptance, data.frame(u1 = u1, u2 = u2))  # Geyma samþykkt gildi
    } else {
      rejection <- rbind(rejection, data.frame(u1 = u1, u2 = u2))  # Geyma hafnað gildi
    }
  }

  return(list(samples = samples, acceptance = acceptance, rejection = rejection))
}

# Fjöldi slembigilda
alpha <- 2
beta <- 5
set.seed(42)

# Framkvæma höfnunarval
beta_rejection_method <- rejection_sampling_beta(n, alpha, beta)

# Beint úr Beta(2,5) með rbeta()
samples_beta_direct <- rbeta(n, alpha, beta)

# Búa til gögn fyrir scatterplot (p3a)
accepted_points <- beta_rejection_method$acceptance
rejected_points <- beta_rejection_method$rejection

# Skilgreina x-gildi fyrir Beta þéttleikafallið
x_vals <- seq(0, 1, length.out = 1000)
beta_density <- dbeta(x_vals, alpha, beta)

# Scatterplot af samþykktum og hafnuðum gildum
p3a <- ggplot() +
  geom_point(data = rejected_points, aes(x = u1, y = u2), color = "red", alpha = 0.5, size = 1.5) +
  geom_point(data = accepted_points, aes(x = u1, y = u2), color = "green", alpha = 0.7, size = 1.5) +
  geom_line(data = data.frame(x = x_vals, y = beta_density), aes(x = x, y = y), color = "blue", linewidth = 1) +
  ggtitle(sprintf("Höfnunarval: %d samþykkt, %d hafnað", nrow(accepted_points), nrow(rejected_points))) +
  xlab("x-gildi úr aðhvarfsdreifingu") +
  ylab("Líkindi") +
  theme_minimal()

# Búa til gögn fyrir histogram samanburð (p3b)
beta_data <- data.frame(
  value = c(beta_rejection_method$samples, samples_beta_direct),
  method = rep(c("Höfnunarval", "Beint með rbeta()"), each = n_beta)
)

# Histogram samanburður á aðferðum
p3b <- ggplot(beta_data, aes(x = value)) +
  geom_histogram(aes(y = after_stat(density), fill = method), bins = 50, alpha = 0.5, position = "identity") +
  geom_line(data = data.frame(x = x_vals, y = beta_density), aes(x = x, y = y), color = "blue", linewidth = 1) +
  ggtitle("Samanburður á Beta(2,5) úr höfnunarvali og rbeta()") +
  xlab("Gildi") +
  ylab("Þéttleiki") +
  theme_minimal() + theme(legend.position = 'bottom') +
  scale_fill_manual(values = c("blue", "red"))

# Sameina plottin p3a og p3b í eitt
p3 <- plot_grid(p3a, p3b, labels = c("A", "B"), ncol = 2)

# Vista mynd í GitBook mappu
ggsave('GitBook/random/figs/beta_rejection_comparison.jpg', plot = p3, width = 10, height = 4)

# Box-Muller aðferð til að búa til slembigögn úr N(μ,σ²)
box_muller_method <- function(n, mu, sigma){
  n <- ceiling(n / 2)
  U1 <- runif(n, 0, 1)
  U2 <- runif(n, 0, 1)

  # Umbreyting
  Z1 <- sqrt(-2 * log(U1)) * cos(2 * pi * U2)
  Z2 <- sqrt(-2 * log(U1)) * sin(2 * pi * U2)

  return(c(Z1, Z2) * sigma + mu)
}

# Fjöldi slembigilda
mu <- 5
sigma <- 2
set.seed(42)

# Framleiða slembigögn með Box-Muller
normal_samples_boxmuller <- box_muller_method(n, mu, sigma)

# Framleiða slembigögn með innbyggða rnorm()
normal_samples_rnorm <- rnorm(n, mean = mu, sd = sigma)

# Búa til gögn fyrir samanburð
normal_data <- data.frame(
  value = c(normal_samples_boxmuller, normal_samples_rnorm),
  method = rep(c("Box-Muller", "rnorm()"), each = n)
)

# Teikna histogram samanburð
p4 <- ggplot(normal_data, aes(x = value, fill = method)) +
  geom_histogram(aes(y = after_stat(density)), bins = 50, alpha = 0.5, position = "identity") +
  stat_function(fun = dnorm, args = list(mean = mu, sd = sigma), linewidth = 1, inherit.aes = FALSE) +
  ggtitle("Samanburður á N(5,2²) úr Box-Muller og rnorm()") +
  xlab("Gildi") +
  ylab("Líkindi") +
  theme_minimal() +
  scale_fill_manual(values = c("blue", "red"))

# Vista mynd í GitBook mappu
ggsave('GitBook/random/figs/box_muller.jpg', plot=p4, width = 6, height = 4)