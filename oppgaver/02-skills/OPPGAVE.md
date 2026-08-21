# Øvelse 2 — Skills 🎯

**Konseptet:** En skill er en mappe med en `SKILL.md`. Claude ser bare **navnet og beskrivelsen** ved oppstart — resten lastes først når den trengs. Beskrivelsen er avtrekkeren.

**Tid:** 4 minutter.

---

## Gjør dette

### 1. Se hvilke skills som finnes
I Claude:
```
/help
```
eller bare spør: `hvilke skills har du her?`

Repoet har to: `statusrapport` og `fredagsrim`. Se på dem: [`.claude/skills/`](../../.claude/skills/)

### 2. Trigg en uten å nevne den
Skriv helt naturlig:
```
lag en statusrapport for nettsideprosjektet vårt — vi ble ferdig med forsiden, jobber med artikkelsidene, og venter på tekst fra kunden
```

**Se etter:** Du sa aldri «skill». Du sa aldri «bruk formatet». Den fant den selv, på ordet «statusrapport», og fulgte malen på slaget.

### 3. Flytt avtrekkeren — dette er poenget
Åpne [`.claude/skills/fredagsrim/SKILL.md`](../../.claude/skills/fredagsrim/SKILL.md).

Bytt ut hele `description:`-linja med:
```yaml
description: Bruk denne når noen nevner kaffe, kaffemaskinen, kaffepause eller spør om det er kaffe igjen.
```

Så, i Claude:
```
/clear
```
og:
```
er det kaffe igjen?
```

**Se etter:** Du får et rim. Ordet «fredag» ble aldri nevnt. Du flyttet avtrekkeren ved å endre én linje tekst.

---

## Hva dette beviser

`description` er ikke dokumentasjon — det er **koden som bestemmer når skillen kjører**. Skriv den som en liste over det brukeren faktisk sier, ikke som en pen forklaring.

## Idébank — skills du kunne laget i dag

- En skill som skriver ukesoppdateringen din i din tone
- En skill som gjør møtenotater om til ClickUp-tasks
- En skill som sjekker en Sanity-schema mot Kults konvensjoner
- En skill som svarer på tilbudsforespørsler med riktig struktur
- En skill som gjør en Figma-lenke om til en utviklerbrief

> **Rydd opp etterpå:** `git checkout .claude/skills/`
