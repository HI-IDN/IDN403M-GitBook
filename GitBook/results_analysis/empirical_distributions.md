---
description: >-
  Raundreifingar og hvernig þær eru notaðar til að lýsa gögnum þegar fræðileg dreifing er ekki þekkt.
---

# Raundreifingar

Stundum höfum við áhuga á að láta gögnin sjálf skilgreina dreifinguna og ekki nota fræðilegt
dreififall. Þetta getur verið mikilvægt þegar engin fræðileg líkön passa vel við gögnin.

## Strjált raundreifing

Strjált raundreifing er auðvelt að skilgreina:

- Líkindi $$p(x)$$ eru einfaldlega hlutfall gildanna $$X_i$$ sem eru jafnt og $$x$$.
- Í R má reikna þetta með:

## Samfelld raundreifing

Fyrir samfelldar dreifingar er hægt að reikna dreififallið sem:

$$
F(x) = \begin{cases}
0, & \text{ef } x < X_{(1)} \\
\frac{i-1}{n-1} + \frac{x - X_{(i)}}{(n-1)(X_{(i+1)} - X_{(i)})}, & \text{ef } X_{(i)} \leq x < X_{(i+1)} \\
1, & \text{ef } X_{(n)} \leq x
\end{cases}
$$

## Samanburður á raundreifingum

Til að bera saman dreifingar notum við bæði tölfræðileg og myndræn verkfæri. Til dæmis má er hægt að
reikna raunverulegt dreififall og bera saman við fræðileg líkön í R.

Eftirfarandi kóði inniheldur aðferðir til að vinna með strjálar og samfelldar raundreifingar, teikna
tíðnidreifingu og bera saman dreifingar:

```r
# Búa til strjált raundreififall
X <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
p_x <- table(X) / length(X)
print(p_x)

# Búa til samfellda raundreifingu
set.seed(42)
X <- sort(runif(10, min = 0, max = 10)) # Tilviljanakennd gögn
x_vals <- seq(min(X), max(X), length.out = 100)
F_x <- ecdf(X)

# Teikna dreififallið
plot(F_x, main = "Raundreifing", xlab = "x", ylab = "F(x)")

# Búa til gögn fyrir samanburð
set.seed(42)
n <- 100
X <- rnorm(n, mean = 5, sd = 2)

# Reikna dreififall og tíðnidreifingu
hist(X, probability = TRUE, col = "lightblue", main = "Samanburður á dreifingum")
lines(density(X), col = "red", lwd = 2) # Þéttleikafall
curve(dnorm(x, mean = mean(X), sd = sd(X)), col = "blue", lwd = 2, add = TRUE) # Normleg dreifing
legend("topright", legend = c("Raungögn", "Þéttleikafall", "Normleg dreifing"), col = c("lightblue", "red", "blue"), lwd = 2)
```

> **Athugasemd:** Ef fræðileg dreifing passar illa við gögnin getur verið betra að nota raunmælingar
> til að móta líkindalíkan.

---

## Mikilvægi raundreifinga

- **Henta vel þegar engin fræðileg líkön passa við gögnin.**
- **Gefa betri mynd af raunverulegum dreifingum í gögnum.**
- **Hægt að nota til að sannreyna hvort fræðileg dreifing sé viðeigandi.**

