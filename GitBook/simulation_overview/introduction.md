---
description: >-
  Inngangur að hermun og hvernig líkön eru notuð til að skilja og bæta flókin kerfi.
---

# Heimsmynd hermunar

Heimurinn er flókið fyrirbæri og það er verk okkar að bæta hann. Þessar umbætur krefjast fyrst að
við skiljum vandamálið og síðan að við getum prófað lausnir á því. Mjög oft er erfitt að gera
tilraunir með raunveruleg kerfi til þess að finna góða lausn, að byggja, eyðileggja og breyta er
hreinlega of dýrt, hættulegt eða jafnvel ómögulegt. Í þessum tilfellum getum við byggt líkan af
raunheimi til að leysa vandamálið í líkanaheimi fyrst. Til að komast úr raunheimi og inn í
líkanaheim þurfum við einföldunarstig (e. abstraction), þar sem einungis þau atriði sem teljast
mikilvæg til að leysa vandamálið eru meðtekin og önnur atriði skilin eftir. Líkan af raunheimum er
því alltaf einfaldara en upphaflega kerfið.

![Raunheimur og líkanaheimur - þýðing höfundar úr [Borshchev, 2013](#heimildir)](figs/Likanaheimur-raunheimur.jpg)

Þessi einfalda mynd leggur upp í fimm grundvallarspurningar:

1. Hvernig lýsum við vandamálinu sem er til staðar í raunheimum?
2. Hvernig drögum við aðalatriði út úr vandamálinu til að færa fyrir í líkanaheima?
3. Hvernig gerum við líkan í líkanaheimi?
4. Hvernig prófum við og metum lausnir í líkanaheimi?
5. Hvernig framkvæmum við breytingu í raunheimi?

> Myndin lýsir því hvernig raunheimi er breytt með aðstoð líkanaheims. Vandamál í raunheimi eru
> einfölduð og sett fram í áhættulausan líkanaheim. Þar er ódýrt og öruggt að gera tilraunir, breyta
> og prófa lausnir. Þegar viðunandi lausn er fundin er hún yfirfærð til raunheims. Mikilvægt er að
> gera ekki breytingar beint í raunheimi án prófana, eins og bannmerkið á myndinni sýnir.

Það er markmið þessa kvers að kynna aðalatriði í hermun með því að fara í gegnum fyrstu fjóra
punktana. Síðast punkturinn verður að bíða betri tíma. Fasar líkanagerðar sem fást við að ná
raunheimi inn í líkanaheim (spurningar 1 til 3), val á stigi (e. abstraction level) og að velja
hermunaraðferð eru allar óformlegri en ferlið við að nota líkön til að leysa vandamál. Í raun eru
þeir fasar meira list en vísindi.

Líkanagerð (e. modelling) fjallar um að finna leiðir til að leysa vandamál í gegnum áhættulausan
heim þar sem okkur leyfist að gera mistök, hætta við, fara aftur á bak í tíma og byrja upp á nýtt.
Líkön eru ekki öll eins; það eru raunveruleg líkön, stærðfræðileg líkön sem aftur bjóða upp á bæði
nákvæmar lausnir sem og hermun.

![Tilraunir á kerfi: kerfið sjálft vs. líkan - þýðing höfundar úr [Law, 2007](#heimildir)](figs/study_system.png)

# Uppbygging kvers

Markmiðið með þessu kveri er að kynna hermun, gagnsemi hennar og hvernig á að framkvæma hana. Í raun
þarf að fara í gegnum alla fjóra heima sem lýst er í heimildum [Mitroff, 1974](#heimildir) sem og
allar sex aðgerðirnar. Þar sem þetta er inngangur er þetta kver takmarkað við þrjá heima (hugtaka-,
vísinda- og lausnarheima) og þrjár aðgerðir (hugtakamótun, líkanagerð og líkanalausn).

Til að hermun sem lausnaraðferð sé skiljanleg þarf að byrja á að útskýra hvernig vísindalíkan lítur
út og virkar.

> Næsti kafli fjallar um 
> [stakræna atburðahermun](../discrete_event_simulation/discrete_event_components.md) og hvernig sá
> heimur virkar. Restin af þessu kveri fjallar að mestu leyti um stakræna atburðahermun, sem er 
> helsta áhersla námskeiðsins. [Eindalíkön](../agent_models/agent_based_models.md) og
> [kvik kerfislíkön](../system_dynamics/system_dynamics.md) verða einnig kynnt, en aðeins lauslega
> til að veita nemendum innsýn í þessar aðferðir og hvernig þær tengjast hermun almennt.
> Aðaláherslan verður hins vegar á stakræna atburðahermun og tengdar aðferðir.

## Heimildir

- **Borshchev, A.** (2013). *The Big Book of Simulation Modeling: Multimethod Modeling with Anylogic
  6*. AnyLogic North America. ISBN: 978-0989573177.
- **Law, A. M.** (2007). *Simulation Modeling and Analysis* (4th ed.). McGraw-Hill.
- **Mitroff, I. I., Betz, F., Pondy, L. R., & Sagasti, F.** (1974). *On managing science in the
  systems age: two schemas for the study of science as a whole systems phenomenon*.                
  Interfaces, 4 (3), 46–58. ISSN: 00922102.
