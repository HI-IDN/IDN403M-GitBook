---
description: >-
  Inngangur að stakrænni atburðahermun og hvernig hún er notuð til að greina og bæta flæði í kerfum.
---

# Stakræn atburðahermun

Stakræn atburðahermun er tegund hermunar þar sem orsakasamhengi er þekkt, hægt er að lýsa kerfinu
sem ferli, og ástandsbreytur kerfis breytast skyndilega vegna atburða (e. events) sem eiga sér stað
á endanlegum fjölda tímapunkta.

> **Tilgangur hermunar**: Greina flæði og samskipti í kerfum þar sem tími og atburðir skipta lykilmáli.

Einfalt dæmi um slíkt kerfi er biðraðakerfi með einn þjón og eina biðröð. Viðskiptavinir koma í röðina
með tíðni sem fylgir ákveðinni dreifingu, og þjónustutími er einnig háður dreifingu. Spurningar sem
slík hermun gæti svarað eru t.d.:
- Hver er meðalbiðtími í röð (án þjónustutíma)?
- Hver er nýtni þjóns?

![Einföld biðröð (M/M/1)](figs/Einfold_MM1.jpg)

---

## Grunnatriði M/M/1 kerfa

Kerfi sem hafa _Poisson_ dreifingu fyrir komu viðskiptavina (þ.e. veldisdreifingu á millikomutíma) og
veldisdreifingu fyrir þjónustutíma eru kölluð `M/M/1`. Hér eru skilgreiningar á táknum í Kendall
nafnagiftinni:

- Fyrsta `M`: Dreifing komu viðskiptavina (_Markovian_, þ.e. veldisdreifing).
- Annað `M`: Dreifing þjónustutíma (_Markovian_, þ.e. veldisdreifing).
- `1`: Fjöldi þjóna (t.d. `M/M/1/∞` ef röðin er með óendanlega lengd).

Þessi nafnagift á biðraðakerfum, kölluð _Kendall notation_, býður einnig upp á:
- `G`: Almenn dreifing (e. general).
- `D`: Löggeng dreifing (e. deterministic).
- Fjöldi þjóna má tákna sem `K`.

Hægt er að gera nákvæma greiningu á `M/M/1` kerfum.

![Nákvæm greining á M/M/1](figs/Einfold_MM1_reikn.jpg)

---

## Tafla: Kendall kerfi og lausnir

| Kendall   | Koma viðskiptavina | Röð | Fjöldi þjóna | Þjónustutími   | Nákvæm lausn |
|-----------|--------------------|-----|--------------|----------------|--------------|
| `M/M/1`   | Poisson            | 1   | 1            | Veldisdreifing | Já           |
| `M/G/1`   | Poisson            | 1   | 1            | Almenn         | Já           |
| `M/M/K`   | Poisson            | 1   | K            | Veldisdreifing | Já           |
| `M/G/K`   | Poisson            | 1   | K            | Almenn         | Nei          |
| `G/G/1`   | Almenn             | 1   | 1            | Almenn         | Nei          |
| `D/M/1`   | Löggeng            | 1   | 1            | Veldisdreifing | ?            |
| `M/D/1`   | Poisson            | 1   | 1            | Löggeng        | ?            |

---

## Þættir stakrænna atburðahermilíkana

Stakræn hermun skoðar líkan af raunheimi á ákveðnum tímapunktum. Samfelldum tíma raunheims er varpað
í stakrænan tíma þar sem atburðir eru skoðaðir. 

> **Lykilatriði**: Allar breytingar í kerfinu tengjast atburðum sem eru stakir og óháðir hver öðrum.

| Lykilhugtök | Lýsing |
|-------------|--------|
| **Einingar (e. entities)** | Það sem flæðir í gegnum kerfið, t.d. viðskiptavinir eða hlutar. |
| **Vinnustöðvar (e. servers)** | Staðir þar sem einingar fá þjónustu. |
| **Atburðir (e. events)** | Breytingar í kerfinu sem eiga sér stað á ákveðnum tímapunktum. |
| **Tími (e. time)** | Stakrænn í hermun, þar sem rauntími er brotinn niður í discrete units. |

Til að skilja kerfið er mikilvægt að skoða hvernig atburðir raðast á tímaskala og hvernig einingar flæða.

---

### Tímavörpun

Í stakrænni atburðahermun er raunverulegur heimur túlkaður í atburði sem eiga sér stað á tilteknum tímapunktum.

![Meðhöndlun tíma í stakrænni hermun](figs/TimiogStakraenHermun.jpg)

Hermivél (e. simulation engine) raðar atburðum í rétta röð með því að fylgja atburðalista. Þessi nálgun gerir það að verkum að tími breytist úr samfelldum í strjálan tíma.

---

### Áskoranir í stakrænni hermun

Til að framkvæma hermun á líkani þarf að halda utan um:
1. **Einingar**: Upplýsingar um stöðu og eiginleika eininga.
2. **Vinnustöðvar og aðföng**: Skilgreina hvernig einingar fá þjónustu.
3. **Árangurstiki**: Mælingar á frammistöðu, svo sem meðalbiðtími eða nýtni þjóns.

---

## Ílagsgögn og dreifingar

Gögn sem notuð eru í stakrænni atburðahermun þarf að safna og greina. Þetta felur í sér:

1. **Mæling á rauntíma**: Tími milli atburða eða lengd þjónustutíma.
2. **Tölfræðileg greining**: Finna líklegustu dreifinguna (t.d. Poisson eða Gaussian).
3. **Tímavigrar**: Nota slembiframkallara til að búa til röð millitíma sem endurspegla raungögn.

![Biðraðakerfi með ílagi](figs/Einfold_MM1_dreifingar.jpg)

---

### Vinnsla hermivélar

Hermivélin framkvæmir stýringu á tímapunktum, atburðum og frálagi með eftirfarandi grunnþáttum:

| Íslenska         | Lýsing                                                  | Enska               |
|------------------|---------------------------------------------------------|---------------------|
| **Stöðubreyta**  | Safn stöðubreytna sem lýsa kerfi á ákveðnum tímapunkti. | System state        |
| **Ræsir**        | Núllstillir hermilíkan og setur upphafsstöðu.           | Initialization      |
| **Hermiklukka**  | Breyta sem gefur ástand hermiklukku.                    | Simulation clock    |
| **Atburðalisti** | Listi sem inniheldur næsta tíma þegar atburður á sér stað. | Event list          |
| **Tölfræðiteljarar** | Breytur sem halda utan um tölfræðilegar upplýsingar. | Statistical counters |
| **Tímastjórn**   | Ákvarðar næsta atburð í atburðalista og færir hermiklukku að þeim tíma þegar atburður á sér stað. | Time routine        |
| **Atburðastjórn**| Uppfærir stöðubreytur og bætir nýjum atburðum við lista. | Event routine       |
| **Slembuframkallarar** | Framkalla slembnar stærðir með líkindadreifingum.  | Generate random variates |
| **Útskrift**     | Gefur tölfræðilegar upplýsingar um breytur sem við höfum skilgreint. | Output reports      |
| **Stöðvunarregla** | Skilyrði um hvernig og hvenær á að stöðva hermun.      | Termination rule    |

---

### Ferli hermivélar

Ferli sem hermivél fer í gegnum má sjá í eftirfarandi skrefum:

1. **Upphafsstilling**: Hermilíkan er núllstillt og upphafsgögn sett.
2. **Atburðaskráning**: Atburðir eru skráðir og raðaðir í atburðalista.
3. **Tímastjórn**: Hermiklukka er færð að næsta atburði.
4. **Framkvæmd atburða**: Atburðir eru framkvæmdir í réttri röð.
5. **Útskrift og stöðvun**: Þegar stöðvunarreglu er náð, eru niðurstöður skráðar og túlkaðar.

![Ferli stakrænnar atburðahermunar í hermivél](figs/flow_control.jpg)
