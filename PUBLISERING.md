<!--
  IKKE KJØRT ENNÅ. Vilde godkjenner og kjører selv.

  gh repo create kult-byra/nerdehjornet-claude-lab \
    --public \
    --source=. \
    --remote=origin \
    --description "Lekegrind for Nerdehjørnet: Claude Code-klosser du kan teste på fem minutter hver" \
    --push

  Bytt --public til --private hvis det skal være internt — men da må alle være
  medlem av kult-byra-orgen på GitHub for å kunne klone, og det tar tid i en økt.
  Public er raskere for en workshop. Repoet inneholder ingen hemmeligheter.
-->

# Publisering

## Før du kjører kommandoen over

- [ ] `git status` er ren
- [ ] `hemmelig.md` inneholder fortsatt bare kaffemaskinkoden (den er en spøk, ikke en hemmelighet)
- [ ] URL-en i README stemmer med orgen du publiserer til

## Etterpå

Sjekk at Camilla-testen faktisk går, fra en tom mappe:

```bash
cd /tmp && rm -rf klonetest && \
git clone https://github.com/kult-byra/nerdehjornet-claude-lab.git klonetest && \
cd klonetest && claude -p "hei, hvem er du?"
```

Svaret skal starte med 🧱. Da vet du at `CLAUDE.md` følger med i klonen.

## Slides

`slides/` eies av en annen chat. Hvis den mappa ikke er ferdig når du publiserer, går det fint —
øvelsene står på egne bein.
