# Øvelse 1 — Kontekst 🧠

**Konseptet:** Claude leser `CLAUDE.md` ved oppstart, hver gang, uten at du ber om det. Fila **er** oppførselen.

**Tid:** 3 minutter.

---

## Gjør dette

### 1. Åpne repoet med Claude
```bash
claude
```

### 2. Be om noe helt vanlig
```
skriv en liten javascript-funksjon som regner ut mva av et beløp
```

**Se etter:** Svaret starter med 🧱. Funksjonen heter noe norsk. Den kaller deg byggmester.
Du ba aldri om noe av det. Det står i [`CLAUDE.md`](../../CLAUDE.md).

### 3. Se hva som faktisk ligger i hodet på den
```
/context
```
Systemprompt, CLAUDE.md, skill-beskrivelser, verktøy — alt spiser plass **før** du har skrevet ett ord.
Det er derfor kontekst er en ressurs du bruker opp, ikke en gratis bakgrunn.

### 4. Ta bort regelen
Åpne `CLAUDE.md` og slett linja om at alle funksjoner skal ha norske navn.

### 5. Ny start — dette er poenget
```
/clear
```
Så samme prompt som i steg 2 igjen.

**Se etter:** Fortsatt 🧱 (den regelen står jo der), men navnet er engelsk igjen.

---

## Hva dette beviser

Du programmerer ikke Claude med prompts — du programmerer den med **filer**. Endre fila, endre oppførselen.

## Bonus (30 sekunder)

Skriv dette i Claude, med `#` foran:
```
# svar alltid på nynorsk i dette repoet
```
Se hva som skjedde med `CLAUDE.md`. `#` skriver rett inn i minnet.

> **Rydd opp etterpå:** `git checkout CLAUDE.md` setter fila tilbake slik den var.
