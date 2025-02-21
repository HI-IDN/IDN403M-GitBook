# Slembigögn
X <- c(3, 4, 5, 4, 5, 6, 4, 80, 20, 8, 10, 25, 10, 9, 8, 8, 9)
X <- sort(X)
n <- length(X)

# Finna k
k <- which(X[-c(1, n)] > X[1])[1] + 1

# Reikna staðsetningarstika
gamma_hat <- (X[1] * X[n] - X[k]^2) / (X[1] + X[n] - 2 * X[k])
cat("Áætlað gildi fyrir γ (hliðrun):", gamma_hat, "\n")
