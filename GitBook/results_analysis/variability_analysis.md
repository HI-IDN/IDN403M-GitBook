---
description: >-
  Greining á vali líkindadreifinga fyrir hermilíkön, aðferðir til að meta breytileika
  og samanburður á fræðilegum og raunmældum dreifingum.
---

# Mat á breytileika fyrir hermilíkön

Í hermun er mikilvægt að skilja hvaða breytur eru slembnar og hvernig þær dreifast.
Kafli 6. í Law (2007) fjallar um val á inntaksdreifingum, aðferðir til að meta þær og 
samanburð milli fræðilegra og raunmældra dreifinga.

## Inntak, virkni og frálag í hermun

- **Ílag hermilíkana:** Hvaða slembibreytur stýra hegðun kerfisins?
- **Virkni hermilíkana:** Hvernig eru slembibreyturnar notaðar í líkaninu?
- **Frálag hermilíkana:** Hvernig túlka niðurstöður hermunarinnar og hvaða áhrif hefur val á
  dreifingum?

---

## Val á inntaks líkindadreifingum

Til að framkvæma hermun þarf að skilgreina slembibreytur sem inntak. Þessar slembibreytur fylgja
einhverri líkindadreifingu sem getur verið valin á grundvelli mælinga eða eftir eðli
viðfangsefnisins.

> **Dæmi:** Framleiðslukerfi gæti haft slembibreytur eins og vinnslutíma og bilanatíðni, en
> flutningskerfi gæti innihaldið millikomutíma farþega og lestunartíma skips.

### Algengar uppsprettur slembibreyta

| Tegund kerfis | Uppspretta hendingar                                   |
|---------------|--------------------------------------------------------|
| Framleiðsla   | Vinnslutími, bilanatíðni véla, viðgerðatími véla       |
| Fjarskipti    | Millikomutími skilaboða, tegund skeytis, lengd skeytis |
| Flutningur    | Lestunartími skips, millikomutími farþega              |

Það er nauðsynlegt að lýsa hverri hendingu með **dreifingu**, en ekki einungis með meðaltali.

---

## Aðferðir til að tilgreina líkindadreifingu

Til að velja rétta dreifingu fyrir hermun er hægt að nota nokkrar aðferðir:

1. **Söguleg gögn (raunmælingar):**
    - Notað þegar nægileg gögn eru til staðar.
    - Getur verið erfitt ef gögn eru takmörkuð, en gagnlegt fyrir sannprófun á hermunarlíkani.

2. **Raundreifingarfall (empirical distribution function):**
    - Svipað og notkun sögulegra gagna en gerir kleift að mynda fleiri gervimælingar innan
      mælibilsins.

3. **Aðlögun fræðilegs dreififalls að mælingum:**
    - Velja fræðilega dreifingu eins og veldisdreifingu eða Poisson-dreifingu ef hún lýsir gögnum
      vel.
    - Notað þegar fræðileg rök styðja slíka nálgun.

> **Hvaða aðferð er best?** Ef mælingar eru nægar, þá er raundreifing skynsamleg. Ef kerfið fylgir
> fræðilegum rökum (t.d. M/M/1 líkan) þá er fræðileg dreifing æskileg.

---

## Fræðilegar vs. raunmældar dreifingar

| Samanburður                        | Fræðilegar dreifingar      | Raundreifingar                  |
|------------------------------------|----------------------------|---------------------------------|
| Jafnar út sveiflur?                | Já                         | Nei, sérstaklega ef gögn eru fá |
| Getur myndað gildi utan mælisviðs? | Já                         | Nei                             |
| Hentug þegar gögn vantar?          | Já                         | Nei                             |
| Hægt að nota fyrir öfgagildi?      | Já, með stýfðum dreifingum | Nei                             |

> **Dæmi:** Ef unnið er með þjónustutíma í afgreiðslukerfi og hámarkstíminn er 15 mínútur, þá getur
> fræðileg dreifing (t.d. normaldreifing) gefið óraunhæf gildi. Í slíku tilviki er betra að nota
> stýfða dreifingu (truncated distribution).

Stýfð dreifing er reiknuð sem:

$$
f^*(x) = \frac{f(x)}{F(b)}, \quad 0 \leq x \leq b
$$

þar sem $$F(b) = \int_0^b f(x)dx < 1$$ takmarkar hæstu mögulegu gildin.

---

## Niðurstaða

Val á líkindadreifingu skiptir miklu máli í hermun. Með því að velja rétta dreifingu fyrir inntak,
tryggjum við að hermunarlíkanið endurspegli raunveruleikann eins nákvæmlega og mögulegt er.

> **Góð regla:** Ef mælingar eru til, prófaðu fyrst að nota raunmælda dreifingu. Ef þær passa illa
> við fyrri þekkingu á kerfinu, prófaðu aðlögun við fræðilega dreifingu.

