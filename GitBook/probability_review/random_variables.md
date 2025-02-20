---
description: >-
  Lýsing á slembibreytum, eiginleikum þeirra og grunnhugtökum í líkindafræði sem tengjast hermun.
---

# Slembibreytur og eiginleikar þeirra

Slembibreyta er stærð sem tekur mismunandi gildi eftir tilviljun. Hér verður farið yfir grunnþætti
slembibreyta, strjálla og samfellda dreifingu þeirra, og hvernig líkindi eru reiknuð fyrir breytur
sem eru háðar hver annarri.

---

## Tilraun og útkomurúm

> **Tilraun (e. experiment)** er aðferð sem skilar úrtaki sem er ekki þekkt með vissu.  
> Mengi allra mögulegra úrtaka kallast **útkomurúm (e. sample space)** og er táknað með $$S$$.  
> Hvert mögulegt úrtak úr tilrauninni kallast **úrtakspunktur (e. sample point)** og er stak í
> $$S$$.

**Dæmi:** Kasta teningi tvisvar.  
Útkomurúmið er þá:

$$S = \big\{ (1,1), (1,2), \ldots, (i,j), \ldots, (6,6)\big\}$$

Þar sem $$(i,j)$$ táknar að $$i$$ kom upp í fyrsta kasti og $$j$$ í því síðara.

---

## Dreififall (e. cumulative distribution function, CDF)

Dreififall $$F(x)$$ lýsir líkum þess að slembibreyta $$X$$ taki gildi sem er minna en eða jafnt 
$$x$$:

$$F(x) = P(X \le x)~~~\text{fyrir}~~~-\infty < x < \infty$$

### Eiginleikar dreififalls:

1. $$0\leq F(x) \leq 1$$ fyrir öll $$x$$.
2. $$F(x)$$ er vaxandi, þ.e. $$x_1 < x_2 \Rightarrow F(x_1) \leq F(x_2)$$.
3. $$\lim_{x\rightarrow \infty} F(x) = 1$$ og $$\lim_{x\rightarrow -\infty} F(x) = 0$$

---

## Strjál dreifing (e. discrete distribution)

Slembibreyta $$X$$ er sögð vera **strjál (e. discrete)** ef hún getur tekið teljanlegan fjölda
gilda,
t.d. $$x_1, x_2, \ldots, x_n$$. Líkur þess að $$X$$ taki gildi $$x_i$$ eru:

$$p(x_i) = P(X=x_i) ~~~ \text{fyrir} ~~~i=1,2,\ldots$$

og þessar líkur summast upp í einn:

$$\sum_{i=1}^\infty p(x_i)= 1$$

> **Líkindafall (e. probability mass function, PMF)** er táknað sem $$p(x)$$.  
> Það segir okkur hversu líklegt er að breytan taki tiltekið strjált gildi.

**Dreififall fyrir strjálar breytur:**
$$F(x) = \sum_{x_i\le x} p(x_i) ~~~ \forall -\infty < x < \infty$$

---

## Samfelld dreifing (e. continuous distribution)

Slembibreyta $$X$$ sem getur tekið óteljanlegan fjölda gilda er **samfelld slembibreyta (e.
continuous
random variable)**. Líkur eru ekki reiknaðar fyrir einstök gildi heldur fyrir bil:

$$P(x\in I) = \int_a^b f(x) dx$$

þar sem:

- $$I$$ eru allar rauntölur milli $$a$$ og $$b$$
- $$f(x)$$ er **líkindaþéttleikafall (e. probability density function, PDF)**
- Fallið $$f(x)$$ uppfyllir skilyrðið:

$$\int_{-\infty}^\infty f(x) dx = 1$$

> **Mikilvægt:**  
> $$f(x)$$ gefur ekki líkur á tilteknu gildi $$X=x$$, heldur líkurnar á því að
> $$X$$ liggi innan ákveðins bils.  
> Í raun er $$P(X=x)=0$$ fyrir samfelldar slembibreytur.

**Líkindadreifingarfall (e. cumulative distribution function, CDF)** er skilgreint sem:

$$F(x) = \int_{-\infty}^x f(y) dy, ~~ \forall ~ -\infty < x < \infty$$

og líkurnar fyrir að $$X$$ taki gildi á bilinu $$[a, b]$$ eru:

$$P(x\in I) = F(b)-F(a)$$

---

## Samlíkindafall (e. joint probability function)

Ef við höfum tvær slembibreytur, $$X$$ og $$Y$$, sem eru annaðhvort **strjálar** eða **samfelldar**,
getum við lýst sameiginlegum líkindum þeirra með **samlíkindafalli (e. joint probability function)**.

### Strjálar breytur:

Ef $$X$$ og $$Y$$ eru strjálar, þá er samlíkindafallið:

$$p(x,y) = P(X = x, Y = y)$$

Ef breyturnar eru **óháðar**, þá gildir:

$$p(x,y) = p_X(x)p_Y(y)$$

Sundurliðun yfir allar mögulegar útkomur gefur:

$$\begin{aligned}
p_X(x) = \sum_{\text{öll}~ y} p(x,y)\\
p_Y(y) = \sum_{\text{öll}~ x} p(x,y)
\end{aligned}$$

---

### Samfelldar breytur:

Ef $$X$$ og $$Y$$ eru samfelldar, þá er samlíkindafallið:

$$P(X\in A, Y\in B) = \int_B\int_A f(x,y) dx~dy$$

Ef $$X$$ og $$Y$$ eru **óháðar**, þá gildir:

$$f(x,y) = f_X(x)f_Y(y)$$

Þar sem jaðardreifingar eru gefnar með:


$$ f_X(x) = \int_{-\infty}^\infty f(x,y) dy $$


$$ f_Y(y) = \int_{-\infty}^\infty f(x,y) dx $$