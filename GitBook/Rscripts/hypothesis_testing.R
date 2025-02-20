alpha <- 0.1  # P-gildi
m <- 1000000  # Fjöldi tilrauna
n <- 10  # Fjöldi mæligilda
mu <- 0; sigma <- 1  # Rétt meðalgildi og staðalfrávik
X <- matrix(rnorm(m * n, mean = mu, sd = sigma), nrow = m, ncol = n)  # Normleg slembistærð
Xbar <- rowMeans(X)  # Meðalgildi
S2 <- apply(X, 1, var)  # Fervik
zgildi <- qnorm(1 - alpha / 2, mean = 0, sd = 1)  # Höfnunarsvæði

# Hermun á P-gildi (1 - alpha) þegar fervik er þekkt
Pr <- mean((Xbar - zgildi * sqrt(sigma / n) <= mu) & (mu <= Xbar + zgildi * sqrt(sigma / n)))
cat(sprintf("Hermun á P-gildi, Pr = %f, rétt P-gildi er 1-alpha = %f\n", Pr, 1 - alpha))

# Hvað ef við notum mat á ferviki út frá mælingum?
Pr_z <- mean((Xbar - zgildi * sqrt(S2 / n) <= mu) & (mu <= Xbar + zgildi * sqrt(S2 / n)))
cat(sprintf("Hermun á P-gildi, Pr_z = %f, rétt P-gildi er 1-alpha = %f\n", Pr_z, 1 - alpha))

# Ef fervik er ekki þekkt þá skal nota t-gildi !!!
tgildi <- qt(1 - alpha / 2, df = n - 1)
Pr_t <- mean((Xbar - tgildi * sqrt(S2 / n) <= mu) & (mu <= Xbar + tgildi * sqrt(S2 / n)))
cat(sprintf("Hermun á P-gildi, Pr_t = %f, rétt P-gildi er 1-alpha = %f\n", Pr_t, 1 - alpha))