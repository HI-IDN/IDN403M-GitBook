---
description: >-
  Samfelldar líkindadreifingar og eiginleikar þeirra, flokkun eftir stikum og hagnýtar 
  dreifingar í hermun og tölfræði.
---

# Samfelldar líkindadreifingar

Samfelldar líkindadreifingar eru grundvallaratriði í tölfræði og hermun. Þær eru notaðar
til að lýsa breytum sem geta tekið hvaða gildi sem er á ákveðnu bili. Þær eru oft auðkenndar með
nokkrum stikum sem hafa efnislega eða rúmfræðilega túlkun.

## Flokkun samfelldra dreifinga eftir stikum

1. **Staðsetningarstiki (e. location parameter) $$\gamma$$**

    - Skilgreinir hvar dreifingin liggur á x-ásnum.
    - Fyrir normlegar slembibreytur er þessi stiki meðaltal $$\mu$$.

2. **Kvörðunarstiki (e. scale parameter) $$\beta$$**

    - Stýrir skölun á gildum í dreifingunni og þjappar eða víkkar hana.
    - Fyrir normlegar slembibreytur er þessi stiki staðalfrávik $$\sigma$$.

3. **Lögunarstiki (e. shape parameter) $$\alpha$$**

    - Skilgreinir form dreifingarinnar innan ákveðinnar fjölskyldu dreifinga.
    - Hefur áhrif á skeifni (e. skewness) dreifingarinnar.

---

## Nytsamlegar samfelldar líkindadreifingar

Hér eru nokkrar algengar samfelldar dreifingar sem notaðar eru í tölfræði og hermun.

| Dreifing                    | Skammstöfun                          | Enskt heiti                  | Notkun                                             |
|-----------------------------|--------------------------------------|------------------------------|----------------------------------------------------|
| **Rétthyrnd dreifing**      | **U**$$(a,b)$$                       | Uniform distribution         | Fyrsta líkan ef lítið er vitað um dreifingu gilda. |
| **Veldisdreifing**          | **Expo**$$(\beta)$$                  | Exponential distribution     | Millikomutímar, tími til bilanna.                  |
| **Gammadreifing**           | **Gamma**$$(\alpha, \beta)$$         | Gamma distribution           | Tími til að klára verk, þjónustutími.              |
| **Weibulldreifing**         | **Weibull**$$(\alpha, \beta)$$       | Weibull distribution         | Tími til bilanna, líftími véla.                    |
| **Normleg dreifing**        | **N**$$(\mu, \sigma^2)$$             | Normal distribution          | Samantekt á mörgum smábreytingum.                  |
| **Logranormleg dreifing**   | **LN**$$(\mu, \sigma^2)$$            | Lognormal distribution       | Tími sem tekur að klára verk.                      |
| **Betadreifing**            | **Beta**$$(\alpha_1,\alpha_2)$$      | Beta distribution            | Hlutfallsgögn, líkindi gallaðra vara.              |
| **Pearson V dreifing**      | **PT5**$$(\alpha,\beta)$$            | Pearson type V distribution  | Líkt og logranormleg, en með stærri topp.          |
| **Pearson IV dreifing**     | **PT6**$$(\alpha_1,\alpha_2,\beta)$$ | Pearson type IV distribution | Tími sem tekur að klára verk.                      |
| **Logra-logistic dreifing** | **LL**$$(\alpha, \beta)$$            | Log-logistic distribution    | Líftími eða biðtími.                               |
| **Þríhyrnd dreifing**       | **Triang**$$(a,b,m)$$                | Triangular distribution      | Notað þegar gögn vantar.                           |

> **Athugasemd:** Þegar raunmælingar eru ekki til staðar, getur verið gagnlegt að velja viðeigandi
> fræðilega dreifingu sem líkan af raunverulegum gögnum.

---

## Mikilvægi samfelldra dreifinga í hermun

- **Fræðilegar dreifingar:** Hægt að útfæra stærðfræðilega og nota í greiningu.
- **Raundreifingar:** Byggja á mælingum og sýna sveiflur sem geta verið mikilvægar.
- **Val á dreifingu:** Fer eftir eðli viðfangsefnisins, en best er að prófa hvort mátun við
  raunmælingar gefi góðan árangur.

