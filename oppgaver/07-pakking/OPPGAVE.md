# Øvelse 7 — Pakking 📦

**Konseptet:** En plugin er alle klossene i én mappe: skills, subagenter, hooks, MCP-koblinger, kommandoer. Én installasjon, hele oppsettet.

**Tid:** 3 minutter.

---

## Gjør dette

Dette repoet er sin egen markedsplass. Se: [`.claude-plugin/marketplace.json`](../../.claude-plugin/marketplace.json)

### 1. Legg til markedsplassen
I Claude:
```
/plugin marketplace add .
```

### 2. Installer plugin-en
```
/plugin install kult-lab@nerdehjornet
```

### 3. Bruk den
```
jeg vil at Claude aldri skal kunne pushe til main. Hvilken kloss bør jeg bruke?
```

**Se etter:** `legokloss`-skillen svarer — og den kom ikke fra `.claude/skills/`, den kom fra plugin-en.
Med `/plugin` kan du slå den av og på uten å røre en eneste fil i repoet.

Plugin-en tok også med seg en subagent: `korrekturleser`. Sjekk `/agents`.

---

## Hva dette beviser

**Plugins er distribusjon.** Har du bygget noe som funker for deg, er en plugin måten resten av Kult får det på —
uten copy-paste, uten «hvor var det du la den fila?».

Innholdet i en plugin: `skills/` · `agents/` · `commands/` · `hooks/` · `.mcp.json` · og mer.

## Idébank

- En `kult-stil`-plugin: tone of voice-skill + korrekturagent + hook som blokkerer engelske ord i kundetekst
- En `sanity`-plugin: MCP-kobling + skill som kan Kults innholdsmodell
- En `prosjektstart`-plugin: alt du alltid setter opp i et nytt kundeprosjekt
