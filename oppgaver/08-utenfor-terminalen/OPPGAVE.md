# Øvelse 8 — Utenfor terminalen 🚀

**Konseptet:** `claude` er ikke bare en chat. Den er en kommando. Alt som kan kjøre en kommando kan kjøre Claude.

**Tid:** 2 minutter.

---

## Gjør dette

Avslutt Claude (`/exit` eller Ctrl+C to ganger). Så, rett i terminalen:

### 1. Ett spørsmål, ett svar, ferdig
```bash
claude -p "oppsummer README.md i tre punkter"
```

### 2. Rett i en fil
```bash
claude -p "oppsummer README.md i tre punkter" > notat.md && cat notat.md
```

### 3. Koblet på noe annet
```bash
git log --oneline -20 | claude -p "skriv en ukesoppdatering på norsk basert på disse commit-meldingene"
```

**Se etter:** Ingen chat, ingen meny. Claude er et ledd i en pipe, som `grep` eller `sort`.

---

## Hva dette beviser

Alt du gjør i chatten kan gjøres uten deg til stede. `-p` er inngangen til cron-jobber, CI-bygg,
Slack-bots og alt annet som skal skje mens du sover.

## Idébank

- En cron-jobb som oppsummerer en Slack-kanal hver fredag kl. 15
- Et build-script som lar Claude skrive release-notatene fra git-loggen
- En GitHub Action som kommenterer på pull requests
- Et Raycast-script som gjør utklippstavla om til en ClickUp-task

## Videre

- `claude -p "..." --output-format json` — når noe annet skal lese svaret
- **Agent SDK** — bygg Claude inn i din egen app (Python/TypeScript)
- **Claude Code i skyen** — claude.ai/code, kjører uten maskinen din

> **Rydd opp:** `rm -f notat.md`
