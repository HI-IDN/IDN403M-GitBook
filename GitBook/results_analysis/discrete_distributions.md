---
description: >-
  Strjálar líkindadreifingar, eiginleikar þeirra og notkun í tölfræði og hermun.
---

# Strjálar líkindadreifingar

Strjálar líkindadreifingar eru notaðar til að lýsa breytum sem geta tekið aðeins stök gildi, oft
náttúruleg tölugildi eins og fjölda atburða eða árangra í endurteknum tilraunum.

## Nytsamlegar strjálar líkindadreifingar

Hér eru nokkrar algengar strjálar dreifingar sem notaðar eru í tölfræði og hermun.

| Dreifing                     | Skammstöfun              | Enskt heiti                    | Notkun                                                                                                            |
|------------------------------|--------------------------|--------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Bernoulli-dreifing**       | **Bernoulli**$$(p$$)     | Bernoulli distribution         | Tvær mögulegar útkomur (t.d. velgengni/bilun). Grunnurinn að binomial, geometric og negative binomial dreifingum. |
| **Tvíkostadreifing**         | **Binomial**$$(t, p$$)   | Binomial distribution          | Fjöldi velgengna í ákveðnum fjölda tilrauna.                                                                      |
| **Hlutafallsrunudreifing**   | **Geom**$$(p$$)          | Geometric distribution         | Fjöldi misheppnaðra tilrauna fyrir fyrstu velgengni.                                                              |
| **Neikvæð tvíkostadreifing** | **Negbin**$$(s, p$$)     | Negative binomial distribution | Fjöldi misheppnaðra tilrauna fyrir \(s$$ velgengni.                                                               |
| **Poisson-dreifing**         | **Poisson**$$$$lambda$$) | Poisson distribution           | Fjöldi atburða á ákveðnu tímabili eða svæði.                                                                      |

---

## Mikilvægi strjálla dreifinga í hermun

- Lýsa atburðum sem gerast með fastri tíðni eða háðum skilyrðum.**
- Eru grunnurinn að mörgum flóknari *stochastic processes*.
- Algengar í tölfræði og *machine learning classification*.

> **Val á dreifingu:** Fer eftir eðli gagna, t.d. hvort fjöldi atburða sé bundinn hámarksfjölda (
> tvíkostadreifing) eða opinn (Poisson-dreifing).

