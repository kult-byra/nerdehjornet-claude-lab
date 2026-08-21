# Øvelse 5 — Delegering 👥

**Konseptet:** En subagent er ikke raskere. Den har sitt **eget kontekstvindu** — den leser møkka, du får svaret.

**Tid:** 5 minutter. Denne har en før/etter du kan måle i tall.

---

## Gjør dette

I mappa [`arkiv/`](arkiv/) ligger 60 møtenotater. Ett av dem inneholder en faktisk beslutning. Resten er støy.

### 1. Mål utgangspunktet
```
/clear
```
så
```
/context
```
Noter tallet: hvor mye av vinduet er i bruk?

### 2. Let selv — den dyre måten
```
finn ut hvor kaffemaskinen skal stå. Svaret ligger i ett av notatene i oppgaver/05-delegering/arkiv/
```
Når den svarer:
```
/context
```
**Se etter:** Tallet har hoppet. Alle de 59 ubrukelige notatene ligger nå i samtalen din, for alltid.

### 3. Deleger — den billige måten
```
/clear
```
så
```
be arkivgraver-subagenten finne ut hvor kaffemaskinen skal stå. Svaret ligger i oppgaver/05-delegering/arkiv/
```
Og igjen:
```
/context
```

**Se etter:** Du fikk samme svar. Vinduet ditt er nesten urørt. Subagenten leste 60 filer i *sitt* vindu, og
det vinduet finnes ikke lenger.

---

## Hva dette beviser

**Subagenter er kontekstisolering, ikke fart.** Deleger når oppgaven produserer mye søppel og lite svar:
søk, research, «les gjennom alt dette og fortell meg om noe er galt».

Subagenten bor i [`.claude/agents/arkivgraver.md`](../../.claude/agents/arkivgraver.md) — markdown med
frontmatter. Lag din egen med `/agents`.

## Tre nivåer, når du vokser ut av én subagent

| | Hvem holder planen | Skala |
|---|---|---|
| **Subagent** | Claude, vending for vending | Noen få om gangen |
| **Agent team** | Lead-agenten (peers som snakker sammen) | En håndfull. Eksperimentelt — krever `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` |
| **Workflow** | **Et script du ikke trenger å skrive selv** | Titalls til hundrevis |

Se øvelse 6 for workflows.

## Idébank

- En subagent som QA-er teksten din mot Kult-stilkjernen
- En review-agent som leser diffen din før du pusher
- En «finn alle steder vi bruker gammel logo»-agent
- En som leser et helt møtereferat og bare gir deg dine egne action points
