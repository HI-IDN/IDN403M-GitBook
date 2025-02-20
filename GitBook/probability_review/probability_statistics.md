---
description: >-
  Inngangur að líkindafræði og tölfræði í hermun, með áherslu á mikilvægi þeirra fyrir 
  líkanagerð, úttaksgreiningu og hönnun hermitilrauna.
---

# Líkinda- og tölfræðigrunnur fyrir hermun

Hermun byggir ekki eingöngu á flæðiritum, atburðamyndum eða forritun. Það nægir ekki að keyra
forritið nokkrum sinnum til að fá trúverðugar niðurstöður. **Líkindi og tölfræði eru nauðsynlegir
verkfæraþættir í hermun** til að tryggja að líkön séu rétt skilgreind og úttak þeirra rétt túlkað.

> **Af hverju skiptir tölfræði máli í hermun?**
>
> Tölfræði er notuð til að skilja hegðun líkana, sannreyna líkön og greina úttaksgögn. Hún tryggir
> að hermun veiti raunhæfar niðurstöður sem hægt er að nota til ákvarðanatöku.

# Notkun líkindafræði og tölfræði í hermun

Líkindi og tölfræði eru nýtt á mismunandi stigum hermunar:

- **Hönnun líkansins**:
  Nauðsynlegt til að skilja hvernig á að byggja líkan af líkindafræðilegu kerfi (probabilistic
  system).
  (Sjá einnig kafla 4.7)
- **Staðfesting og sannprófun líkansins**:
  Notað til að sannreyna að líkanið endurspegli raunveruleikann á réttan hátt.
  (Sjá einnig kafla 5)
- **Val á inntaksdreifingum**:
  Mikilvægt að velja viðeigandi líkindadreifingar fyrir inntaksbreytur líkana.
  (Sjá einnig kafla 6)
- **Myndun slembiúrtaka**: Nauðsynlegt að búa til slembigögn með tilteknum dreifingum fyrir hermun.
  (Sjá einnig kafla 7 og 8)
- **Úttaksgreining hermilíkans**:
  Tölfræðileg greining úttaksgagna er lykilatriði til að meta árangur hermilíkans.
  (Sjá einnig kafla 9 og 10)
- **Hönnun hermitilrauna**:
  Viðfangsefni eins og tilraunahönnun og greining gagna eru lykilatriði í því að fá áreiðanlegar
  niðurstöður úr hermun.
  (Sjá einnig kafla 11 og 12)

---

# Háð gögn og áskoranir í tölfræði hermunar

Í hefðbundinni tölfræði er oft gert ráð fyrir að athuganir séu óháðar (e. independent). Í hermun er
þetta yfirleitt ekki raunin þar sem gögnin eru tímaröðuð og háð fyrri stöðum líkansins.

> **Mikilvægt!**
> Hefðbundnar tölfræðiaðferðir sem gera ráð fyrir óháðum athugunum eiga oft _ekki_ við í hermun.
> Það þarf sérstakar aðferðir til að meta og greina úttaksgögn sem eru háð fyrri niðurstöðum.

Til að tryggja að tölfræðileg greining sé rétt, er nauðsynlegt að:

- Nota viðeigandi líkindadreifingar sem endurspegla raunveruleikann.
- Framkvæma næmniathuganir á inntaksgögnum.
- Nota aðferðir sem taka mið af háðum mælingum.
