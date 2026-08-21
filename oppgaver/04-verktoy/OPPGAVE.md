# Øvelse 4 — Verktøy 🔧

**Konseptet:** En skill kan ha med seg **kode**, ikke bare tekst. Da slutter Claude å gjette og begynner å kjøre.

**Tid:** 3 minutter.

---

## Gjør dette

### 1. Be om noe der gjetting er fristende
```
lag URL-slugs av disse tre: "Ærlig talt: Blåbærsyltetøy & Co. (2026)", "Nytt kontor på Grünerløkka!", "Design & Teknologi — 10 år"
```

Se på svaret. **To ting kan skje:**

- **Den kjørte `lag-slug.sh`.** Da fikk du samme svar som alle andre i rommet, tegn for tegn.
- **Den gjettet selv.** Da fikk du noe som *ser* riktig ut — og som blir litt annerledes neste gang.

Begge deler er et funn. Sammenlign med sidemannen: har dere nøyaktig samme slugs?

### 2. Tving fram scriptet
```
bruk lenkenavn-skillen og kjør scriptet — ikke gjett
```

Kjør så samme prompt tre ganger med `/clear` mellom. **Se etter:** identisk svar hver gang.

### 3. Se hvorfor
Åpne [`.claude/skills/lenkenavn/`](../../.claude/skills/lenkenavn/). `SKILL.md` er fire linjer som sier
«ikke gjett, kjør scriptet». Resten er 8 linjer bash i `lag-slug.sh`.

---

## Hva dette beviser

**Script i en skill slår instrukser om script — men bare når skillen faktisk trigges.**
Derfor er `description` og «ikke gjett»-linja like viktige som koden. Alt som skal bli likt hver gang
bør være kode Claude *kjører*, ikke regler Claude *følger*.

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
