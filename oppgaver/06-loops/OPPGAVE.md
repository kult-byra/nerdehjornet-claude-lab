# Øvelse 6 — Loops 🔁

**Konseptet:** Claude jobber i en sløyfe: tenk → verktøy → resultat → tenk igjen. Med `/goal` bestemmer **du** når sløyfa får lov til å stoppe.

**Tid:** 5 minutter. Dette er den mest tilfredsstillende øvelsen. Ta den til slutt.

---

## Gjør dette

### 1. Se at det er ødelagt
```bash
./oppgaver/06-loops/tester.sh
```
Tre tester feiler.

### 2. Sett målet — ikke oppgaven
I Claude:
```
/goal ./oppgaver/06-loops/tester.sh kjører og skriver "ALLE TESTER PASSERTE"
```
Så:
```
fiks feilene i oppgaver/06-loops/kalkulator.sh
```

**Se etter:** Den fikser, kjører testene, ser at noe fortsatt feiler, fikser igjen — **uten at du sier «prøv igjen»**.
Etter hver vending vurderer en liten rask modell om målet er nådd. Ikke nådd → den jobber videre.

### 3. Prøv å lure den
Når den er ferdig, ødelegg en funksjon igjen selv og skriv `fortsett`. Målet står fortsatt.

```
/goal          → status på målet
/goal clear    → nullstill
```

---

## Hva dette beviser

Uten `/goal` stopper Claude når *den* synes den er ferdig. Med `/goal` stopper den når **betingelsen din** er sann.

**Viktig:** evaluatoren kjører ikke verktøy — den dømmer bare det som står i samtalen. Skriv derfor mål
Claudes egen output kan bevise: «testene skriver ALLE TESTER PASSERTE», ikke «koden er bra».

---

## Workflows — når én sløyfe ikke rekker

En **workflow** er et JavaScript-script som orkestrerer titalls subagenter. Du skriver det ikke selv —
Claude skriver det, og en runtime kjører det i bakgrunnen. Planen flytter fra Claudes hode og inn i kode,
og derfor skalerer det.

Prøv den innebygde:
```
/deep-research hva er forskjellen på en Claude Code-skill og en subagent?
```
eller trigg en selv med nøkkelordet:
```
ultracode: gå gjennom alle øvelsene i dette repoet og finn skrivefeil
```
`/workflows` viser kjøringene mens de går.

> **Rydd opp etterpå:** `git checkout oppgaver/06-loops/`
