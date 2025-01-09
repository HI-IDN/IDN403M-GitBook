---
description: >-
  Kynning á þremur aðferðum hermilíkana: stakrænir atburðir, eindalíkön og kvik kerfi.
---

# Hermilíkanaaðferðir

Nútíma hermunarlíkön notast við þrjár aðferðir:

- **Stakræn atburðahermun** (e. discrete-event simulation)
- **Eindalíkön** (e. agent-based modelling)
- **Kvik kerfislíkön** (e. system dynamics simulation)

![3 líkanaaðferðir](figs/3_leidir_hermunar-abstractions.jpg "Mynd: 3 líkanaaðferðir - þýðing 
höfundar úr [Borshchev, 2013](#refs)")

## Stakræn atburðahermun (e. Discrete-event simulation)
Stakræn atburðahermun (SAL) byggir á orsakasamhengi sem lýsir kerfi sem röð atburða. Í þessum aðferðum:
- Kerfið hefur einingar sem flæða í gegnum vinnustöðvar.
- Atburðir, eins og breytingar í stöðu kerfis, gerast á stökum tímum.
- Tími sem fer í vinnslu er oft breytilegur, stjórnað af dreifingu.
- Lausnir eru því oft tölfræðidreifingar.

Biðraðir og vinnustöðvar eru lykilatriði í stakrænni hermun, og stýribreytur eru oft mældar til að hámarka skilvirkni.

## Eindalíkön (e. Agent-based modelling)
Eindalíkön beinast að hegðun einstakra einda (e. agents), svo sem:
- Fólks, heimila, fyrirtækja eða farartækja.
- Tengsl milli einda og hegðun þeirra eru skilgreind.
- Umhverfi og skorður eru skilgreindar sem hluti af kerfinu.

Eindalíkön veita sveigjanleika þegar lítið er vitað um nákvæm orsakasambönd kerfis en nægar upplýsingar eru til um hegðun hluta þess.

## Kvik kerfislíkön (e. System Dynamics simulation)
Kvik kerfislíkön (KKL) byggja á kerfishugsun (e. system thinking):
- Kerfið er lýst sem flæði og uppsöfnun (e. stocks and flows).
- Orsakasamhengi er lýst með orsakaritum (e. causal-loop diagrams).
- Flæði stjórnast af breytum og tímaseinkunum.

KKL eru oft notuð til að greina stefnumótun, með áherslu á hvernig orsakasamhengi hefur áhrif á kerfi í heild.

![Val á líkanaaðferð](figs/3_leidir_hermunar.png "Mynd: Val á líkanaaðferð - þýðing höfundar úr 
[Borshchev, 2013](#refs)")

## Notkunarsvið og val á aðferð
Val á aðferð ræðst af:
1. Markmiðum líkanagerðar.
2. Þekkingu á kerfinu og tengslum innan þess.
3. Viðeigandi óhlutbundleikastigi (e. abstraction level).

Margtækni líkan (e. multi-method model) getur einnig verið notað þegar viðfangsefni krefst notkunar margra aðferða samtímis. Þetta getur sameinað styrkleika mismunandi aðferða fyrir betri niðurstöður.
