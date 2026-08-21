# Claude-verktøy — lekegrind 🧱

Lab-repoet for Nerdehjørnet 21.08. Klon, kjør, lek. Alle øvelser tar under 5 minutter.

---

## Fra ingenting til kjørende (Camilla-testen)

Har du aldri installert Claude Code? Kjør disse fire, i rekkefølge. Åpne Terminal (⌘+mellomrom → skriv «Terminal»).

**1. Installer**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```
Ta en slurk kaffe. Når den er ferdig: **lukk terminalvinduet og åpne et nytt.**

**2. Hent repoet**
```bash
git clone https://github.com/kult-byra/nerdehjornet-claude-lab.git
cd nerdehjornet-claude-lab
```

**3. Start Claude**
```bash
claude
```
Første gang åpnes nettleseren og du logger inn med **@kult.design**-kontoen din. Velg tema, si ja til å stole på mappa.

**4. Si hei**
```
hei, hvem er du?
```
Får du et svar? Da er du klar. 🎉

> **Sier den «command not found: claude»?** Du glemte å åpne nytt terminalvindu. Gjør det, prøv igjen.
> **Sier den «git: command not found»?** Kjør `xcode-select --install`, godta, vent, prøv igjen.
> **Står den og spør om hooks/settings?** Svar ja — det er repoets egne øvelser (se oppgave 03).

---

## Velg én øvelse

**Du skal ikke gjøre alle.** Velg den som svarer på noe du faktisk lurer på. Hver tar under fem minutter, og de er uavhengige av hverandre — start hvor du vil.

| Lurer du på… | Gjør | Du finner ut |
|---|---|---|
| «Hvordan får jeg Claude til å huske hvordan *jeg* vil ha ting?» | [1 · Kontekst](oppgaver/01-kontekst/OPPGAVE.md) | at fila **er** oppførselen |
| «Kan den lære en fremgangsmåte og bruke den av seg selv?» | [2 · Skills](oppgaver/02-skills/OPPGAVE.md) | at beskrivelsen er avtrekkeren |
| «Hvordan hindrer jeg at den gjør noe dumt?» | [3 · Determinisme](oppgaver/03-determinisme/OPPGAVE.md) | at garanti slår instruks |
| «Kan den slutte å gjette og bare regne det ut?» | [4 · Verktøy](oppgaver/04-verktoy/OPPGAVE.md) | at kode slår forklaring |
| «Hvorfor blir den dummere jo lenger jeg holder på?» | [5 · Delegering](oppgaver/05-delegering/OPPGAVE.md) | at subagenter er isolering, ikke fart |
| «Kan den fortsette til noe faktisk er ferdig?» | [6 · Loops](oppgaver/06-loops/OPPGAVE.md) | at du bestemmer når den får stoppe |
| «Hvordan gir jeg oppsettet mitt til resten av Kult?» | [7 · Pakking](oppgaver/07-pakking/OPPGAVE.md) | at alt går i én plugin |
| «Kan den jobbe uten at jeg sitter her?» | [8 · Utenfor terminalen](oppgaver/08-utenfor-terminalen/OPPGAVE.md) | at `claude` bare er en kommando |

**Vet du ikke hva du lurer på?** Ta 1, så 3. De to viser hele poenget: instruks kan overses, garanti kan ikke.

**Er du utvikler og har dårlig tid?** Ta 6. Den er mest tilfredsstillende.

## Så: bygg noe eget 🛠️

Øvelsene er oppvarming. Hovedretten er **ditt eget problem**.

Tenk på noe irriterende du gjør ofte — en tekst du alltid skriver om, en sjekk du alltid glemmer, et skjema du alltid fyller likt. Velg en kloss:

- **Instruks** (CLAUDE.md / skill) — Claude leser det og velger selv
- **Garanti** (hook / permission / script) — kjører uansett hva modellen mener
- **Delegering** (subagent / workflow) — eget kontekstvindu, eget mandat

Kopier malen og bygg:
```bash
cp din-egen/MAL.md din-egen/fornavn-hva-det-er.md
```

Vi viser fram på slutten. Det som ikke funket er like interessant som det som funket.

---

## Jukselapp — kommandoer i Claude

| Kommando | Hva den gjør |
|---|---|
| `/clear` | Tømmer samtalen. Bruk mellom urelaterte oppgaver. |
| `/context` | Viser hva som spiser kontekstvinduet akkurat nå |
| `/compact` | Komprimerer samtalen når du MÅ beholde tråden |
| `/agents` | Se og lag subagenter |
| `/hooks` | Se og lag hooks |
| `/goal <betingelse>` | Sett et mål — Claude gir seg ikke før det er nådd |
| `/plugin` | Installer plugins fra en marketplace |
| Esc | Avbryt Claude midt i noe |
| Esc Esc | Hopp tilbake i samtalen |
| `#` foran en melding | Skriv den rett inn i CLAUDE.md |
| ⇧+Tab | Bytt modus (plan / auto) |
