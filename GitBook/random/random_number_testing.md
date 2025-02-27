---
description: >-
   Aðferðir til að meta gæði slembitöluframleiðslu. Fjallað er um tölfræðilegar prófanir, svo sem samræmipróf og sjálfstæðispróf.
---

# Prófun á slembitölum

## **Af hverju þurfum við að prófa slembitölur?**
- Slembitölur þurfa að vera *jafn dreifðar* og *ósamhengdar*.
- Lélegir slembitöluframleiðendur skapa mynstur og skekkja hermilíkön.

## **1. Samræmipróf**
- Skiptir bilinu [0,1] í hólf og telur hversu oft gildi lenda í hverju.
- Notar **Chi-square próf** til að sjá hvort dreifingin sé jöfn.

## **2. Sjálfstæðispróf**
- Athugar hvort næstu tölur í röð tengjast.
- **Runs test**: Telur hversu oft gildin hækka/lækka í röð.
- **Autocorrelation test**: Mælir fylgni á milli töluhópa.

## **3. Spectral test (Línustrúktúrpróf)**
- Sérstakt próf fyrir LCG.
- Skoðar hvernig punkta úr $(U_i, U_{i+1})$ dreifast í einingafleti.
- Slæmur LCG mun mynda línuleg mynstur í 2D rými.


