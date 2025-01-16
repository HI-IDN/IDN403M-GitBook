---
description: >-
  Kynning á þremur aðferðum hermilíkana: stakrænir atburðir, eindalíkön og kvik kerfi.
---

# Hermilíkanaaðferðir

Nútíma hermunarlíkön byggja á þremur megin aðferðum:

- **Stakræn atburðahermun** (e. discrete-event simulation): Aðferð sem lýsir ferlum í kerfi þar sem
  atburðir eiga sér stað á tilteknum tímapunktum.
- **Eindalíkön** (e. agent-based modelling): Aðferð sem beinir sjónum að hegðun einstaklinga í 
  kerfi og samskiptum þeirra.
- **Kvik kerfislíkön** (e. system dynamics simulation): Aðferð sem fjallar um flæði og uppsöfnun 
  innan kerfa með áherslu á kerfishugsun og orsakasamhengi.

Hver aðferð er hugsuð sem rammi til að kortleggja flókin kerfi í líkanaheimi. Aðferðirnar henta
mismunandi stigum óhlutbundleika (abstraction levels).

- **Kvik kerfislíkön** henta oft vel þegar unnið er með háu óhlutbundleikastigi, t.d. við
  stefnumótun
  (e. strategic modelling).
- **Stakræn atburðahermun** styður bæði meðal og lágt óhlutbundleikastig.
- **Eindalíkön** sveigjast á milli, allt frá mjög nákvæmum smáatriðum upp í líkön sem fást við
  stórar einingar, eins og fyrirtæki eða ríkisstjórnir.

![Þrjár líkanaaðferðir - þýðing höfundar úr [Borshchev, 2013](#heimildir)](figs/3_leidir_hermunar-abstractions.jpg)

Hægt er að líta á þessar aðferðir sem verkfæri sem velja má eftir því hvað hentar markmiðum og eðli
verkefnisins. Meðal þess sem skiptir máli er hversu nákvæmt líkanið þarf að vera og hvaða
upplýsingar eru tiltækar til að lýsa kerfinu.

## Notkunarsvið og val á aðferð

Val á aðferð við líkanagerð fer eftir ýmsum þáttum, svo sem:

1. **Markmiðum líkanagerðar** – Hvað á að ná fram með líkaninu?
2. **Þekkingu á kerfinu** – Hve vel eru tengsl og hegðun innan kerfisins þekkt?
3. **Viðeigandi óhlutbundleikastigi** (e. abstraction level) – Hve mikið af smáatriðum þarf að 
   taka inn í líkanið?

Aðferðina þarf alltaf að velja í samhengi við kerfið sem á að gera líkan af og þau markmið sem
stefnt er að. Myndin hér að neðan sýnir hvernig mismunandi aðferðir geta nýst við gerð líkans fyrir
einfalt dæmi eins og búð.

Það væri til dæmis hægt að:

- **Nota ferlalíkan**, þar sem viðskiptavinir og starfsmenn eru auðlindir sem flæða í gegnum kerfið.
- **Nota eindalíkan**, þar sem viðskiptavinir eru skilgreindir sem eindir (e. agents) sem verða
  fyrir áhrifum frá auglýsingum, samskiptum og hegðun starfsmanna.
- **Nota kvikt kerfislíkan**, þar sem endurgjafarskipulag er skoðað, t.d. hvernig sölur tengjast
  auglýsingum, þjónustugæðum, verði og viðskiptatryggð.

Ef kerfið er flókið og krefst mismunandi nálgana getur verið árangursríkt að nota margtækni líkan
(e. multi-method model), sem sameinar styrkleika allra aðferða, [Borshchev, 2013](#heimildir).

![Val á líkanaaðferð - þýðing höfundar úr [Borshchev, 2013](#heimildir)](figs/3_leidir_hermunar.png)

## Stakræn atburðahermun (e. Discrete-event simulation)

> Stakræn atburðahermun byggir á kerfi þar sem einingar flæða milli vinnustöðva. Atburðir gerast á
> stökum tímum, og niðurstöður eru framsettar sem tölfræðidreifingar.

Stakræn atburðahermun (SAL) er aðferð sem byggir á skýru orsakasamhengi innan kerfa. Í þessari
aðferð:

- **Kerfið hefur einingar:** Þetta eru hlutar sem ferðast milli vinnustöðva innan kerfisins.
- **Atburðir gerast á stökum tímum:** Breytingar í stöðu kerfisins eiga sér stað á afmörkuðum
  tímabilum.
- **Breytilegur tími:** Vinnslutími og millibili eru stjórnað af dreifingum, oft byggðar á
  tölfræðilegum líkum.
- **Biðraðir og takmarkanir:** Einfaldir eða óendanlegir biðlistar geta myndast fyrir framan
  vinnustöðvar, þar sem vinnsluhraði er takmarkaður af aðföngum eða öðrum kerfisbreytum.

Þessi aðferð er notuð til að hámarka skilvirkni kerfa og greina áhrif breytinga á ferli kerfisins,
t.d. í framleiðslu- eða þjónustukerfum.

## Eindalíkön (e. Agent-based modelling)

> Eindalíkön beinast að hegðun einstakra einda innan kerfis og tengslum þeirra, sem gerir þau
> sveigjanleg þegar lítið er vitað um kerfi sem heild.

Eindalíkön (EL) einblína á hegðun einstakra einda sem kallast eindir (e. agents). Eindirnar geta
verið fjölbreyttar:

- **Dæmi um eindir:** Einstaklingar, heimili, fyrirtæki, farartæki, vörur eða aðrar einingar sem
  taka þátt í kerfinu.
- **Tengsl og hegðun:** Eindir eru forritaðar með hegðunarmynstri og eiga í samskiptum við aðrar
  eindir.
- **Umhverfi og skorður:** Eindir vinna innan skilgreinds umhverfis með ákveðnum reglum og skorðum.

Þessi aðferð hentar sérstaklega vel þegar nákvæmar upplýsingar um orsakasamhengi eru takmarkaðar en
nægar upplýsingar eru til um hegðun hluta kerfisins. Hún er notuð í rannsóknum á samfélagshegðun,
markaðsvirkni og dreifikerfum.

## Kvik kerfislíkön (e. System Dynamics simulation)

> Kvik kerfislíkön nýta sér kerfishugsun til að lýsa heildarkerfum með orsakasamhengi, flæði og
> uppsöfnun.

Kvik kerfislíkön (KKL) nota kerfishugsun til að greina heildarvirkni kerfa og áhrif orsakasamhengis:

- **Kerfishugsun:** Hugsun sem lýsir kerfum sem heildrænum einingum frekar en röð einstakra atburða.
- **Flæði og uppsöfnun:** Kerfið er lýst sem flæði (e. flows) og birgðir (e. stocks). Þetta getur
  táknað t.d. fjárstreymi, birgðir eða mannfjölda.
- **Orsakasamhengi:** Skýrt framsett með orsakaritum (e. causal-loop diagrams), sem sýna hvernig
  mismunandi þættir kerfisins tengjast og hafa áhrif hver á annan.

KKL eru gjarnan notuð í stefnumótun, stjórnun auðlinda og greiningu á langtímaáhrifum breytinga í
kerfum. Þau henta vel þar sem markmiðið er að greina hvernig kerfi bregst við breytingum yfir tíma.

# Heimildir

- **Borshchev, A.** (2013). *The Big Book of Simulation Modeling: Multimethod Modeling with Anylogic
  6*. AnyLogic North America. ISBN: 978-0989573177.
 