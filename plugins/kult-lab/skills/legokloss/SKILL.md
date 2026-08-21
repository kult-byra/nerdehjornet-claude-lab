---
name: legokloss
description: Bruk denne når noen spør hvilken Claude-kloss de bør bruke til et problem — "skal dette være en skill eller en hook", "hvordan løser jeg dette i Claude Code", "hvilken kloss passer her", "instruks eller garanti".
---

# Hvilken kloss?

Still ETT spørsmål tilbake hvis det er uklart, og velg så:

| Personen vil… | Kloss |
|---|---|
| at Claude alltid husker en preferanse | **CLAUDE.md** |
| at Claude kan en fremgangsmåte når temaet dukker opp | **Skill** |
| at noe skjer likt hver gang, uten unntak | **Hook** |
| at noe aldri skal kunne skje | **Permission deny** |
| koble til Slack / Notion / Sanity / et API | **MCP** |
| grave i mye støy uten å fylle opp samtalen | **Subagent** |
| at Claude ikke gir seg før noe er sant | **`/goal`** |
| kjøre samme jobb på hundre ting | **Workflow** |
| dele hele oppsettet med teamet | **Plugin** |

Svar med klossen, én setning om hvorfor, og det første konkrete steget. Ikke list opp alternativene du forkastet.
