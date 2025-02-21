---
description: >-
  Mátunarpróf eru mikilvæg fyrir sönnun á dreifingum og geta tryggt að valin líkan sé viðeigandi fyrir
  raunveruleg gögn.
---

# Mátunarpróf (Goodness of Fit Tests)

Mátunarpróf (e. goodness of fit test) eru notuð til að meta hversu vel tiltekin dreifing passar
við raunveruleg gögn.
Slík próf eru mikilvæg fyrir gagngreiningu þar sem við viljum sannprófa hvort gögnin okkar fylgi
fræðilegri dreifingu.

## $$\chi^2$$-próf (Chi-Square Test)

Kí-kvaðrat mátunarpróf, eða $$\chi^2$$-mátunarpróf, metur hvort dreifing gagna passar við 
væntingar:

1. Skiptum gögnunum upp í bil $$[a_0, a_1), [a_1, a_2), \dots, [a_{k-1}, a_k)$$.
2. Fjöldi mælinga í hverju bili er $$N_j$$.
3. Reiknum væntigildi fyrir hverja bilskiptingu:
   $$E[M_j]=np_j$$
4. Mátum próftölu:  
   $$\chi^2=\sum_{j=1}^k\frac{(N_j-np_j)^2}{np_j}$$
5. Ef $$\chi^2 > \chi_{k-1,1-\alpha}^2$$ þá er dreifingin ekki talin henta gögnunum.

## Kolmogorov-Smirnov (K-S) próf

Kolmogorov-Smirnov prófið mælir hámarksmuninn milli raungagna og mátaðrar dreifingar:

1. Finnum $$D_n$$ sem er mesta frávik milli raunverulegs dreififalls og mátaðs dreififalls:
   $$D_n = \sup_{x}|F_n(x)-\hat{F}(x)|$$
2. Notum Kolmogorov-Smirnov dreifingu til að reikna líkur.
3. Ef $$D_n > c_{1-\alpha}$$ þá er mátuð dreifing ekki hæfileg.

## Lilliefors próf

Lilliefors prófið er sértæk útgáfa af Kolmogorov-Smirnov prófi og er notuð ef fræðileg dreifing er
normaldreifing:

$$\big(\sqrt{n}-0.01+\frac{0.85}{\sqrt{n}}\big)D_n > c'_{1-\alpha}$$

## Anderson-Darling próf

Anderson-Darling prófið lætur meiri þunga á frávik í hölunum og er því betra fyrir sum tilfelli en
Kolmogorov-Smirnov prófið:

1. Finnum $$A_n^2$$ sem vegið mismun af dreififalli:
   $$A^2_n = n\int_{-\infty}^\infty [F_n(x)-\hat{F}(x)]^2\psi(x)\hat{f}(x)dx$$

2. Ef $$A_n^2 > a_{n,1-\alpha}$$ þá er mátuð dreifing ekki hæfileg.

## R-kóði til að keyra mátunarpróf

```r
set.seed(42)
data <- rnorm(100, mean = 50, sd = 10) # Slembigögn

# Skilgreina bil fyrir prófið
breaks <- seq(floor(min(data)), ceiling(max(data)), length.out = 6)
observed <- hist(data, breaks = breaks, plot = FALSE)$counts
expected <- dnorm(breaks[-length(breaks)], mean = mean(data), sd = sd(data)) * length(data)

# Kí-kvaðrat próf
chisq.test(observed, p = expected / sum(expected))

# Kolmogorov-Smirnov próf
ks.test(data, "pnorm", mean = mean(data), sd = sd(data))

# Lillefors próf
nortest::lillie.test(data)

# Anderson-Darling próf
nortest::ad.test(data)
```

| Próf                    | Prófstærð | $$p$$-gildi | Niðurstaða               |
|-------------------------|-----------|-------------|--------------------------|
| Kí-kvaðrat próf         | 28.64     | 9.25e-06    | Höfnun á normaldreifingu |
| Kolmogorov-Smirnov próf | 0.0557    | 0.9158      | Engin höfnun             |
| Lilliefors próf         | 0.0557    | 0.6253      | Engin höfnun             |
| Anderson-Darling próf   | 0.4619    | 0.2533      | Engin höfnun             |

Kí-kvaðrat prófið bendir til þess að gögnin fylgi ekki normaldreifingu (mjög lágt p-gildi), á meðan
Kolmogorov-Smirnov, Lilliefors og Anderson-Darling prófin gefa ekki ástæðu til að hafna
normaldreifingu (hærri p-gildi). Kí-kvaðrat prófið gæti verið ónákvæmt vegna þess að bilaskipting
gagna getur haft áhrif á niðurstöðuna (rétt er að taka fram að R gefur viðvörun við keyrslu á 
`chisq.test` ).

Prófstærðirnar gefa einnig vísbendingar:
- KS-prófið ($$D = 0.0557$$) mælir stærsta frávik raunverulegu dreifingarinnar frá normaldreifingu. 
  Lítil gildi benda til góðs mats.
- Lilliefors prófið ($$D = 0.0557$$) er sérsniðið fyrir normaldreifingu og gefur sömu niðurstöðu og 
  KS-prófið.
- Anderson-Darling prófið ($$A = 0.4619$$) leggur meiri áherslu á halana á dreifingunni og 
  gefur einnig hátt $$p$$-gildi, sem bendir ekki til fráviks frá normaldreifingu.