---
description: >-
  Tilgátupróf í tölfræði, með áherslu á höfuðsetningu tölfræðinnar, öryggisbil,
  mistök af gerð I og II, og t-dreifingu.
---

# Tilgátupróf

## Höfuðsetning tölfræðinnar (e. Central Limit Theorem)

Látum $$Z_n$$ vera slembibreytu:

$$
Z_n = \frac{\bar{X}(n) - \mu}{\sqrt{\sigma/n}}
$$

Þá segir *höfuðsetning tölfræðinnar* að þegar $$n \rightarrow \infty$$ stefnir dreififallið $$F_n(z)$$ á normaldreifingu:

$$
F_n(z) \rightarrow \frac{1}{\sqrt{2\pi}} \int_{-\infty}^z e^{-y^2/2}dy
$$

> **Túlkun:** Þessi setning segir að þegar úrtaksstærðin $$n$$ er nægilega stór, þá verður úrtaksmeðaltalið $$\bar{X}(n)$$ næstum normaldreift óháð undirliggjandi dreifingu á $$X_i$$.

## Öryggisbil

Öryggisbil fyrir meðaltal $$\mu$$ er gefið með formúlunni:

$$
\bar{X}(n) \pm z_{1-\alpha/2} \sqrt{\frac{S^2(n)}{n}}
$$

> **Túlkun:** Ef mörg öryggisbil eru reiknuð með óháðum athugunum, þá erum við í $$100(1-\alpha)\%$$ tilvika með sanna gildið $$\mu$$ innan þeirra bila.

Ef $$X$$-in eru normaldreifðar slembibreytur, er betra að nota:

$$
\bar{X}(n) \pm t_{n-1,1-\alpha/2} \sqrt{\frac{S^2(n)}{n}}
$$

þar sem $$t_{n-1,1-\alpha/2}$$ er höfnunarmark fyrir t-dreifingu með $$n-1$$ frelsisgráðum.

> **Athugasemd:** Þar sem $$t$$-dreifingin hefur þykkari hala en normaldreifingin, verður öryggisbilið stærra. Þess vegna er oft mælt með notkun $$t$$-dreifingar þegar fervikið er áætlað úr gögnum.

## Tilgátupróf

**Núlltilgáta:** $$H_0: \mu = \mu_0$$

**Tvíhliða prófun:**

$$
|t_n| \begin{cases} > t_{n-1,1-\alpha/2} & \text{höfnum } H_0 \\
\leq t_{n-1,1-\alpha/2} & \text{höfnum ekki } H_0 \end{cases}
$$

þar sem

$$
t_n = \frac{\bar{X}(n) - \mu_0}{\sqrt{S^2(n)/n}}
$$

> **Villur í tilgátuprófum:**
> - *Mistök af gerð I* (e. type I error): $$H_0$$ er hafnað þegar hún er sönn.
> - *Mistök af gerð II* (e. type II error): $$H_0$$ er ekki hafnað þegar hún er röng.

## t-dreifing

Til að prófa tilgátur þar sem fervikið er ekki þekkt, notum við $$t$$-dreifingu. Þegar 
úrtaksstærðin er lítil og fervikið er metið út frá gögnum, hefur t-dreifingin þykkari hala en normaldreifingin, sem leiðir til stærri öryggisbila.

Hér að neðan er R-kóði sem hermir út $$p$$-gildi fyrir tilgátupróf með $$t$$-dreifingu:

```r
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
```

## Þumalputtareglur

- Þegar fervikið er þekkt, þá gefur normaldreifingin nákvæmar öryggismörk.
- Þegar fervikið er metið úr úrtakinu, gefur normaldreifingin oft of þröng mörk.
- Þegar fervikið er óþekkt, er $$t$$-dreifingin réttari vegna þess að hún tekur tillit til 
  óvissunnar í mati á ferviki.

---

