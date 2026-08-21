# Øvelse 4 — Verktøy 🔧

**Konseptet:** En skill kan ha med seg **kode**, ikke bare tekst. Da slutter Claude å gjette og begynner å kjøre.

**Tid:** 3 minutter.

---

## Gjør dette

### 1. Be om noe der gjetting er fristende
```
lag URL-slugs av disse tre: "Ærlig talt: Blåbærsyltetøy & Co. (2026)", "Nytt kontor på Grünerløkka!", "Design & Teknologi — 10 år"
```

**Se etter:** Den kjørte `lag-slug.sh` i stedet for å finne på slugs selv. Åpne
[`.claude/skills/lenkenavn/`](../../.claude/skills/lenkenavn/) og se hvorfor: `SKILL.md` sier bare
«ikke gjett, kjør scriptet» — resten er 8 linjer bash.

### 2. Test at det faktisk er deterministisk
Kjør samme prompt tre ganger med `/clear` mellom. Samme svar hver gang, tegn for tegn.
Prøv så å be Claude lage slugs **uten** scriptet (`ikke bruk scriptet, gjør det selv`). Sammenlign æ/ø/å-håndteringen.

---

## Hva dette beviser

**Script i en skill slår instrukser om script.** Alt som skal bli likt hver gang bør være kode Claude kjører — ikke regler Claude følger.

---

## MCP — når verktøyet bor et annet sted

Et script virker på din maskin. En **MCP-server** kobler Claude til noe utenfor: Slack, Notion, Figma,
Sanity, en database, et internt API.

Legg en `.mcp.json` i repo-rota, så får alle som kloner det samme koblingen:

```json
{
  "mcpServers": {
    "kult-docs": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/Users/deg/Developer"]
    }
  }
}
```

Sjekk hva du har koblet til akkurat nå:
```
/mcp
```

**Tommelfingerregel:** MCP **kobler**, en skill **dokumenterer bruken**. Har du en MCP med 40 verktøy,
skriv en skill som sier «for å gjøre X, bruk verktøy Y slik» — ellers spiser verktøybeskrivelsene kontekst
uten at noen vet når de skal brukes.

## Idébank

- Sanity-MCP + en skill som kan Kults innholdsmodell
- Slack-MCP + en skill som oppsummerer en kanal i ditt format
- Et bash-script i en skill som sjekker at bildene i et repo er under 200 kB
