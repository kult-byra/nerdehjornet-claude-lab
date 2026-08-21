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
git clone https://github.com/kultbyra/nerdehjornet-claude-lab.git
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

## Øvelsene

Én ting per øvelse. Under 5 minutter hver. Gjør dem i rekkefølge første gang.

| # | Mappe | Handler om | Du beviser |
|---|---|---|---|
| 1 | [`oppgaver/01-kontekst`](oppgaver/01-kontekst/OPPGAVE.md) | CLAUDE.md, `/clear`, `/context` | Fila **er** oppførselen |
| 2 | [`oppgaver/02-skills`](oppgaver/02-skills/OPPGAVE.md) | Skills og triggere | Beskrivelsen styrer når den slår inn |
| 3 | [`oppgaver/03-determinisme`](oppgaver/03-determinisme/OPPGAVE.md) | Hooks og guards | Garanti slår instruks |
| 4 | [`oppgaver/04-verktoy`](oppgaver/04-verktoy/OPPGAVE.md) | Script i skill vs. MCP | Kode slår forklaring |
| 5 | [`oppgaver/05-delegering`](oppgaver/05-delegering/OPPGAVE.md) | Subagenter | Isolering, ikke fart |
| 6 | [`oppgaver/06-loops`](oppgaver/06-loops/OPPGAVE.md) | `/goal` og loopen | Den gir seg ikke før den er i mål |
| 7 | [`oppgaver/07-pakking`](oppgaver/07-pakking/OPPGAVE.md) | Plugins og marketplace | Alt over i én pakke |
| 8 | [`oppgaver/08-utenfor-terminalen`](oppgaver/08-utenfor-terminalen/OPPGAVE.md) | `claude -p`, headless | Claude som del av et script |

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
