set.seed(42)
data <- rnorm(100, mean = 50, sd = 10) # Slembigögn

# Skilgreina bil fyrir prófið
breaks <- seq(floor(min(data)), ceiling(max(data)), length.out = 6)
observed <- hist(data, breaks = breaks, plot = FALSE)$counts
expected <- dnorm(breaks[-length(breaks)], mean = mean(data), sd = sd(data)) * length(data)

# Chi-Square próf
chisq.test(observed, p = expected / sum(expected))

# Kolmogorov-Smirnov próf
ks.test(data, "pnorm", mean = mean(data), sd = sd(data))

# Lillefors próf
nortest::lillie.test(data)

# Anderson-Darling próf
nortest::ad.test(data)