---
description: >-
  Inngangur að hendingum og hvernig þær eru notaðar í hermilíkönum. Fjallað er um línulegan samfelldan hendingaframleiðara (LCG), eiginleika hans og hvernig tryggja má löng tímabil án endurtekninga. Samanburður við jöfna (rectangular) og veldisdreifingu.
---

# Hendingar og LCG-aðferðin

## Hvað eru hendingar í hermun?

Hermilíkön þurfa hendingar til að líkja eftir óvissu í raunheiminum. Dæmi eru:

- Komutími viðskiptavina í biðröð.
- Bilunartími véla í verksmiðju.
- Eftirspurn eftir vörum.

### Línulegur samfelldur hendingaframleiðari (LCG)

LCG (*Linear Congruential Generator*) er algeng reikniaðferð sem býr til *gervi hendingar* 
(e. pseudo random) með jöfnu formi:

$$
Z_i = (a Z_{i-1} + c) \mod m
$$

Þar sem:

- $$m$$ er mótulið (hámarksfjöldi gilda),
- $$a$$ er margfaldari,
- $$c$$ er viðbót,
- $$Z_0$$ er fræsgildi (e. seed) þ.e. upphafsgildi.

Sjá nánar kafla 7.2 í Law (2007).

---

## **Jöfn (rétthyrnd) dreifing**

Jöfn dreifing (*continuous uniform distribution* eða *rectangular distribution*) lýsir sér þannig að
öll gildi á ákveðnu bili eru jafn líkleg.

LCG-aðferðin er oft notuð til að búa til hendingar sem fylgja **jöfnu dreifingu á bilinu $$[0,1]
$$**.
Til að athuga hvort slembitalnaframleiðari virki rétt, má bera saman:

- **LCG-framleiðslu á jöfnum hendingum** við
- **Innbyggða `runif()` fallið í R** sem notar nútíma slembitalnaframleiðara (*Mersenne Twister*).

![Samanburður á rétthyrndri dreifingu](figs/uniform_comparison.jpg)

Myndin sýnir *samanburð á stöplariti LCG og `runif()`* með yfirlagðri rauðri línu sem
sýnir fræðilega rétthyrnda dreifingu.

---

## Veldisdreifing (exponential distribution)

Veldisdreifing er algeng í hermun og lýsir sér þannig að *líkur á ákveðnum tíma milli atburða
minnka með stærð gildisins*.

Til að umbreyta jöfnum hendingum í veldisdreifingu er hægt að nota andhverfu-hlutafalls-aðferðina:

$$
X = -\frac{\ln U}{\lambda}
$$

Þar sem:

- $$U$$ er jafndreifð hending á bilinu $$[0,1]$$,
- $$\lambda$$ er hraða stikinn (rate parameter).

R hefur innbyggt fall, `rexp()`, sem býr til veldisdreifð gögn. Til samanburðar var **LCG hendingum
umbreytt í veldisdreifingu og borin saman við `rexp()`**.

![Samanburður á veldisdreifingu](expon_comparison.jpg)

Myndin sýnir *samanburð á stöplariti LCG og `rexp()`*, þar sem rauða línan táknar
fræðilega veldisdreifingu.


---

## Tímabil og mikilvægi góðrar stillingar

- Ef LCG er illa valinn endurtekur hann sig of snemma.
- Gott val á $$m$$, $$a$$ og $$c$$ tryggir löng tímabil.
- Notað í tölfræðilegum prófunum til að tryggja gæði.

### Heimildir

- Law (2007), kafli 7.2.
