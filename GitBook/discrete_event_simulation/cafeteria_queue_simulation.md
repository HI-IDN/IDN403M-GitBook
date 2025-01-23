---
description: >-
  Sýnidæmi með auðakóði lýsir hvernig stakræn hermun er notuð til að greina og líkja eftir 
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
    - Fá sér samloku.
    - Fara beint að kaupa sér drykk.
3. Ef þeir fá sér heitan mat eða samloku, velja þeir einnig drykk.
4. Að lokum velja þeir þann kassa sem hefur styttri biðröð (tveir kassar eru í boði).
5. Eftir afgreiðslu við kassa yfirgefa þeir kerfið.

Við höfum tímamælingar fyrir alla þessa atburði: tímasetningu þegar viðskiptavinir koma inn, velja
mat, samloku, eða drykk, og þegar þeir ljúka afgreiðslu við kassa. Markmið okkar er að nota þessi
gögn til að herma ferlið og safna tölfræði sem lýsir hegðun kerfisins.

---

## Grunnhugtök

- **`simtime`**: Tímastimpill sem heldur utan um núverandi tíma í hermun. Allir atburðir eru
  raðaðir í tíma miðað við `simtime`, og hermunin keyrir þar til `simtime` nær hámarkstíma.
- **Biðraðir `$Q$`**: Geyma fjölda viðskiptavina sem bíða við hverja stöð, t.d. fyrir mat, drykk,
  eða kassa.- > **Vinnustöðvar `$B$`**: Halda utan um stöðu hverrar vinnustöðvar (laus eða
  upptekin).
- **Millikomutímar**: Tíminn á milli þess að viðskiptavinir koma í kerfið. Þetta er oft áætlað
  með veldisdreifingu.
- **Atburðir**: Við höfum þrjár megintegundir atburða:
    - `Koma`: Þegar viðskiptavinur kemur í kerfið.
    - `Inn`: Þegar viðskiptavinur fer inn í biðröð eða vinnustöð.
    - `Ut`: Þegar viðskiptavinur yfirgefur vinnustöð eða biðröð.

---

## Forvinnsla gagna

### Skilgreining og hlutverk

- **Inntak**: Slóð að CSV skrá `file_path`.
- **Úttak**:
    - Orðabók `$real_events$` með millikomutímum fyrir hvern atburð.
    - Meðaltalstímar milli atburða `$mean_values$`.
    - Líkindi fyrir innkomu `$incoming_prob$`.

Forvinnsla gagna snýst um að umbreyta hráum tímatengdum gögnum í gagnlegt form fyrir stakræna
hermun. Þetta felur í sér:

1. Reikna **millikomutíma** með því að vinna úr tímatöflu atburða.
2. Áætla **meðaltalstíma** milli atburða til að meta dreifingu þeirra (gerum ráð fyrir
   veldisdreifingu).
3. Finna **líkindi fyrir upphafsatburði** með því að greina tíðni þeirra í gögnum.

### Ferli

1. **Lesa og undirbúa gögn**:
    - Lesa CSV skrá með dálkum fyrir atburðategundir og tímasetningar.
    - Umbreyta tímasetningum í klukkustundir, mínútur og sekúndur.

2. **Reikna millikomutíma**:
    - Nota tímastimpla fyrir `Upphaf` og `Endir` atburði til að reikna tímabil.
    - Halda utan um tímabundna geymslu (`events`) fyrir skráningu á upphafstímum.

3. **Meta meðaltöl og líkindi**:
    - Finna væntigildi fyrir hverja atburðategund.
    - Reikna tíðni hvers upphafsatburðar og áætla líkindi þeirra.

### Reiknirit

1. Lesa CSV gögn frá `file_path`.
2. Upphafsstilla `$real_events$` sem orðabók fyrir atburðategundir:
    - Lyklar: `Koma`, `Matur`, `Samloka`, `Drykkur`, `Kassi1`, `Kassi2`.
3. Upphafsstilla `$events$` fyrir tímabundna geymslu, t.d.:
   ```python
   events = { "MaturInn": -1, "SamlokaInn": -1, "DrykkurInn": -1, "Kassi1Inn": -1, "Kassi2Inn": -1 }
   ```
4. Fyrir hverja línu í gögnunum:
    - Reikna `simtime` út frá tímasetningu atburðar.
    - Ef atburður er af taginu `Inn`, skrá `simtime` í `events`.
    - Ef atburður er af taginu `Ut`:
        - Reikna tímabil með `simtime - events`.
        - Bæta tímabili í `real_events`.
5. Meta meðaltalstíma milli atburða (`mean_values`).
6. Reikna líkindi fyrir upphafsatburði (`incoming_prob`).
7. Skila `real_events`, `mean_values`, og `incoming_prob`.

> Þó við notum `real_events` ekki áfram í hermunarferlinu, getum við teiknað það upp og borið
> saman hvort það stemmi við okkar upplifun af raunverulegu ferlinu. Þetta hjálpar til við að
> sannreyna gögn og grunnhugmyndir áður en hermunin er útfærð. Eða við getum notað það til að
> bera saman við niðurstöður hermunar.

---

## Hermunarferli

### Skilgreining og hlutverk

- **Inntak**:
    - Meðaltalsgildi `mean_values` (notað til að búa til nýja atburði).
    - Líkindi fyrir upphafsatburði `incoming_prob`.
    - Hámarkstími hermunar `max_time`.
- **Úttak**: Tölfræði `stats` sem lýsir hegðun kerfisins.

Hermunin byggir á stakrænum atburðum þar sem:

> **`simtime`** táknar núverandi tímastimpil hermunar. Það heldur utan um framvindu kerfisins og
> ákvarðar hvenær næsti atburður á sér stað. Allir atburðir eru raðaðir í tíma miðað við `simtime`, og
> hermunin keyrir þar til `simtime` nær hámarkstíma.

- **Biðraðir `Q`**: Geyma fjölda viðskiptavina sem bíða við hverja stöð, t.d. fyrir mat, drykk,
  eða kassa.
- **Vinnustöðvar `B`**: Halda utan um stöðu hverrar vinnustöðvar (laus eða upptekin).

Hermunin keyrir þar til hámarkstími (`max_time`) hefur verið náð.

### Ferli

1. **Upphafsstilla hermun**:
    - Búa til tóman lista `events` fyrir skipulagningu atburða.
    - Upphafsstilla `Q` og `B` sem orðabækur fyrir biðraðir og vinnustöðvar.

2. **Framvinda hermunar**:
    - Velja næsta atburð úr `events` miðað við `simtime`.
    - Uppfæra tölfræði fyrir `Q` og `B`.
    - Útfæra atburði:
        - `Koma`: Velja upphafsatburð, skipuleggja viðeigandi `Inn` atburði.
        - `Inn`: Stjórna biðröð eða vinnustöð (ef laus, skipuleggja `Ut`).
        - `Ut`: Ljúka þjónustu, færa næsta viðskiptavin í biðröð eða vinnustöð.

3. **Skila tölfræði**:
    - Staðla fjölda í `Q` og nýtingu `B` miðað við heildartíma hermunar.

### Reiknirit

1. Upphafsstilla `Q` og `B` sem orðabækur með núllgildum fyrir hverja tegund.
2. Setja fyrsta `Koma` atburð í `events` með slembitíma byggt á `mean_values`.
3. Á meðan `simtime < max_time` og `events` er ekki tómur:
    - Taka næsta atburð úr `events`.
    - Uppfæra tölfræði fyrir `Q` og `B` miðað við núverandi `simtime`.
    - Keyra viðeigandi ferli fyrir tegund atburðar (`Koma`, `Inn`, `Ut`).
4. Skila tölfræði `stats`:
    - Meðalfjölda í `Q`.
    - Nýtingu í `B`.
    - Heildarfjölda viðskiptavina.
