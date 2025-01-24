---
description: >-
  Sýnidæmi með sauðakóða sem lýsir hvernig stakræn hermun er notuð til að greina og líkja eftir 
  þjónustuflæði í háskólamötuneyti, þar sem gögn um atburðartíma eru nýtt til að skapa líkön sem 
  mæla hegðun kerfisins.
---

# Hermun á háskólamötuneyti

## Vandamál og gögn

Við ætlum að lýsa og herma ferli þar sem nemendur mæta í háskólamötuneyti með Poisson ferli.
Ferlið er eftirfarandi:

1. Nemendur koma inn í mötuneytið með slembnum millibilum.
2. Þeir taka mismunandi ákvarðanir:
    - Fá sér heitan mat.
    - Fá sér eitthvað úr kæli.    
3. Að lokum velja þeir þann kassa sem hefur styttri biðröð (tveir kassar eru í boði).
4. Eftir afgreiðslu við kassa yfirgefa þeir kerfið.

Við höfum tímamælingar fyrir alla þessa atburði: tímasetningu þegar viðskiptavinir koma inn, velja
mat, kæli, og þegar þeir ljúka afgreiðslu við kassa. Markmið okkar er að nota þessi gögn til að
herma ferlið og safna tölfræði sem lýsir hegðun kerfisins.

---

## Grunnhugtök

- **`simtime`**: Tímastimpill sem heldur utan um núverandi tíma í hermun. Allir atburðir eru
  raðaðir í tíma miðað við `simtime`, og hermunin keyrir þar til `simtime` nær hámarkstíma.
  Athugið, að `simtime` er tímastimpill eftir að búið er að varpa honum yfir í strjálan tíma.
- **Biðraðir `$Q$`**: Geyma fjölda viðskiptavina sem bíða við hverja stöð, t.d. fyrir mat, kæli,
  eða kassa.
- **Vinnustöðvar `$B$`**: Halda utan um stöðu hverrar vinnustöðvar (laus eða upptekin).
- **Millikomutímar**: Tíminn á milli þess að viðskiptavinir koma í kerfið. Þetta er oft áætlað
  með veldisdreifingu.
- **Atburðir**: Við höfum þrjár megintegundir atburða:
    - `Nýr kúnni`: Þegar viðskiptavinur kemur í kerfið.
    - `Koma`: Þegar viðskiptavinur fer inn í biðröð eða vinnustöð.
    - `Fara`: Þegar viðskiptavinur yfirgefur vinnustöð eða biðröð.

---

## Forvinnsla gagna

### Skilgreining og hlutverk

- **Inntak**: Slóð að Excel-skrá `file_path`.
- **Úttak**:
    - Orðabók `$real_events$` með millikomutímum fyrir hvern atburð.
    - Meðaltalstímar milli atburða `$mean_values$` (verður notað fyrir stika á veldisdreifingu).
    - Líkindi fyrir innkomu `$incoming_prob$`.

Forvinnsla gagna snýst um að umbreyta hráum tímatengdum gögnum í gagnlegt form fyrir stakræna
hermun. Þetta felur í sér:

1. Reikna **millikomutíma** með því að vinna úr tímatöflu atburða.
2. Áætla **meðaltalstíma** milli atburða til að meta dreifingu þeirra (gerum ráð fyrir
   veldisdreifingu).
3. Finna **líkindi fyrir upphafsatburði** með því að greina tíðni þeirra í gögnum.

### Ferli

1. **Lesa og undirbúa gögn**:
    - Lesa Excel-skrá með dálkum fyrir atburðategundir og tímasetningar.
    - Umbreyta tímasetningum í sekúndur eða mínútur eftir þörfum.

2. **Reikna millikomutíma**:
    - Nota tímastimpla yfir atburði til að reikna tímabil.
    - Halda utan um tímabundna geymslu (`events`) fyrir skráningu á upphafstímum.

3. **Meta meðaltöl og líkindi**:
    - Finna væntigildi fyrir hverja atburðategund.
    - Reikna tíðni hvers upphafsatburðar og áætla líkindi þeirra.

### Reiknirit

1. Lesa Excel-gögn frá `file_path`.
2. Upphafsstilla `$real_events$` sem orðabók fyrir atburðategundir:
    - Lyklar: `Nýr kúnni`, `Heitur matur`, `Kælir`, `Kassi1`, `Kassi2`.
3. Upphafsstilla `$events$` fyrir tímabundna geymslu, t.d.:
   ```python
   events = {}
   ```
4. Fyrir hverja línu í gögnunum:
    - Reikna `simtime` út frá tímasetningu atburðar.
    - Ef atburður er af taginu `Koma`, skrá `simtime` í `events`.
    - Ef atburður er af taginu `Fara`:
        - Reikna tímabil með `simtime - events`.
        - Bæta tímabili í `real_events`.
5. Meta meðaltalstíma milli atburða (`mean_values`).
6. Reikna líkindi fyrir upphafsatburði (`incoming_prob`).
7. Skila `real_events`, `mean_values`, og `incoming_prob`.

> Þó við notum `real_events` ekki áfram í hermunarferlinu, getum við teiknað það upp og borið
> saman hvort það stemmi við okkar upplifun af raunverulegu ferlinu. Þetta hjálpar til við að
> sannreyna gögn og grunnhugmyndir áður en hermunin er útfærð.

> Beinagrind að kóða í Python má finna [hér](code/simulation_data_processor.py).

---

## Hermunarferli

### Skilgreining og hlutverk

- **Inntak**:
    - Væntigildi `mean_values` (notað til að búa til nýja atburði).
    - Líkindi fyrir upphafsatburði `incoming_prob`.
    - Hámarkstími hermunar `max_time`.
- **Úttak**: Tölfræði `stats` sem lýsir hegðun kerfisins.

Hermunin byggir á stakrænum atburðum þar sem:

> **`simtime`** táknar núverandi tímastimpil hermunar. Það heldur utan um framvindu kerfisins og
> ákvarðar hvenær næsti atburður á sér stað. Allir atburðir eru raðaðir í tíma miðað við `simtime`, og
> hermunin keyrir þar til `simtime` nær hámarkstíma.

- **Biðraðir `Q`**: Geyma fjölda viðskiptavina sem bíða við hverja stöð, t.d. fyrir mat, kæli,
  eða kassa.
- **Vinnustöðvar `B`**: Halda utan um stöðu hverrar vinnustöðvar (laus eða upptekin).

Hermunin keyrir þar til hámarkstími (`max_time`) hefur verið náð.

### Ferli

1. **Upphafsstilla hermun**:
    - Búa til tóman lista `events` fyrir skipulagningu atburða.
    - Upphafsstilla `Q` og `B` sem orðabækur fyrir biðraðir og vinnustöðvar.
    - Hafa „warmup“ tímabil þar sem kerfið er komið í jafnvægi.

2. **Framvinda hermunar**:
    - Velja næsta atburð úr `events` miðað við `simtime`.
    - Uppfæra tölfræði fyrir `Q` og `B`.
    - Útfæra atburði:
        - `Nýr kúnni`: Velja upphafsatburð út frá líkindum, skipuleggja viðeigandi `Koma` atburði.
        - `Koma`: Stjórna biðröð eða vinnustöð (ef laus, skipuleggja `Fara`).
        - `Fara`: Ljúka þjónustu, færa næsta viðskiptavin í biðröð eða vinnustöð.

3. **Endurtaka hermun**:
    - Keyra margar tilraunir þar sem hver hermun notar nýja slembni.
    - Reikna meðaltöl og staðalfrávik fyrir allar keyrslur.

4. **Skila tölfræði**:
    - Staðla fjölda í `Q` og nýtingu `B` miðað við heildartíma hermunar.
    - Bjóða upp á samantekt á mörgum keyrslum.

### Reiknirit

1. Upphafsstilla `Q` og `B` sem orðabækur með núllgildum fyrir hverja tegund.
2. Hafa „warmup“ tímabil þar sem kerfið er komið í jafnvægi.
3. Setja fyrsta `Nýr kúnni` atburð í `events` með slembitíma byggt á `mean_values`.
4. Á meðan `simtime < max_time` og `events` er ekki tómur:
    - Taka næsta atburð úr `events`.
    - Uppfæra tölfræði fyrir `Q` og `B` miðað við núverandi `simtime`.
    - Keyra viðeigandi ferli fyrir tegund atburðar (`Nýr kúnni`, `Koma`, `Fara`).
5. Endurtaka fyrir margar keyrslur:
    - Safna meðaltölum og staðalfrávikum yfir keyrslur.
6. Skila niðurstöðum með samantekt yfir fjölda viðskiptavina og nýtingu kerfisins.

> Beinagrind að kóða í Python má finna [hér][code/simulation_process.py]