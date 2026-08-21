# Verifisert fakta — fasit for slides og øvelser

> Verifisert 21.08.2026 av claude-code-guide-agenten mot offisiell dokumentasjon (code.claude.com, hentet i dag). Dette er FASITEN — alt merket [VERIFISER] i slides rettes mot denne fila. Vildes CLI er 2.1.238, så alle versjonskrav under er oppfylt lokalt.

## TL;DR for slide-arbeidet

Ingenting i research-dumpen var oppdiktet — men **tre halvsannheter må rettes før de går på skjerm**:

1. **Auto mode** — «uten tillatelses-stopp» er FEIL. Deny- og ask-regler går foran klassifisereren, og klassifisereren er en synkron port med latenskostnad, ikke en bakgrunnssjekk.
2. **`CLAUDE_CODE_GOAL_CHECKIN_MINUTES`** — finnes, men styrer innsjekk på bakgrunnsarbeid, ikke evalueringsintervallet. Målevaluering skjer hver vending, alltid.
3. **Agent teams** — eksperimentelt og AV som standard. Uten `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` skjer ingenting — en demo uten den faller flatt.

Fire steder dumpen var ufullstendig (slida blir bedre av påfyllet): hook-lista (31 hendelser, ikke 11) · plugin-komponenter (mangler monitors og themes) · workflow-primitivene (`phase()` manglet) · `--bare` for CI.

## Loops

**1. `/goal` og goal-loopen — SANT**
`/goal <betingelse>` finnes. Etter hver vending sender Claude Code betingelsen + samtalen til en liten, rask modell (Haiku som standard på Claude API). Tre dommer: **Not yet met** (jobber videre, begrunnelsen styrer neste vending), **Met** (nullstilles, loggført oppnådd), **Impossible** (nullstilles, loggført mislykket).

Slide-trygge presiseringer:
- Ett mål per sesjon. `/goal` uten argument = status, `/goal clear` = nullstill.
- Teknisk: en innpakning rundt en sesjons-scopet prompt-basert **Stop-hook**.
- Evaluatoren **kjører ikke verktøy** og leser ikke filer — den dømmer kun det som ligger i samtalen. Skriv betingelser Claudes egen output kan bevise («npm test exits 0»).
- Betingelse opptil 4 000 tegn.
- `/goal` endrer ikke tillatelsesmodus — uten auto mode spør Claude fortsatt før verktøykall.

**2. Auto mode — DELVIS (rettet formulering under)**
Auto mode og klassifiseringen finnes, men:
- **Ikke «uten tillatelses-stopp»:** `permissions.deny` og eksplisitte `ask`-regler evalueres **før** klassifisereren og blokkerer/spør uansett.
- **Ikke «bakgrunns»-klassifiserer:** synkron port i tillatelseskjeden; hver shell-kommando er et klassifiseringskall (dokumentert latens-kostnad).

Korrekt formulering: *Auto mode ruter verktøykall gjennom en klassifiserer som blokkerer det som er irreversibelt, destruktivt eller rettet ut av miljøet ditt. Deny- og ask-regler går foran klassifisereren.* Konfigureres med `autoMode`-blokka (`environment`, `allow`, `soft_deny`, `hard_deny`, `classifyAllShell`) i **brukerinnstillinger eller managed settings** — leser bevisst *ikke* `autoMode` fra repoets `.claude/settings.json`. Inspiser: `claude auto-mode config` / `defaults` / `critique`.

Auto mode starter ikke en ny vending — den godkjenner verktøykall innen én vending. `/goal` og auto mode er komplementære.

**3. PermissionDenied-hook og retry — SANT**
Payload: `{"hookSpecificOutput": {"hookEventName": "PermissionDenied", "retry": true}}`

Presiseringer (ellers læres noe misvisende bort):
- Fyrer **kun i auto mode**, når klassifisereren avslår. Ikke ved manuelt avslag, ikke ved PreToolUse-blokk, ikke ved deny-regel.
- `retry: true` reverserer ikke avslaget — den legger en melding i samtalen om at modellen *kan* prøve igjen.
- Ignoreres når klassifisereren ikke ga noen dom.

**4. Nesting av subagenter — SANT, tallet er 3**
Subagenter kan spawne subagenter, som standard **opptil tre lag under hovedsamtalen**. På dybdegrensen holdes Agent-verktøyet tilbake (unntatt fork). Styres med `CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH`; `1` slår nesting av. Krever v2.1.219+. Kontrast: **teammates kan ikke spawne teammates** — ingen nøstede team.

**5. `CLAUDE_CODE_GOAL_CHECKIN_MINUTES` — finnes, men gjør ikke det navnet antyder**
Default `30`, `0` slår av, maks `10080`, hele minutter. Krever v2.1.234+. Styrer **ikke** evalueringsintervallet (evaluering skjer hver vending) — den styrer hvor lenge *bakgrunnsarbeid* (subagent/bakgrunns-shell) får holde et mål ventende før Claude bes sjekke. Etter første innsjekk dobles idle-intervallet, opp til 4× intervallet (idle-innsjekker krever v2.1.236+).

## Hooks

**6. Hook-hendelser — alle dumpens navn er ekte; totalen er 31**
`SessionStart` · `Setup` · `InstructionsLoaded` · `UserPromptSubmit` · `UserPromptExpansion` · `MessageDisplay` · `PreToolUse` · `PermissionRequest` · `PostToolUse` · `PostToolUseFailure` · `PostToolBatch` · `PermissionDenied` · `Notification` · `SubagentStart` · `SubagentStop` · `TaskCreated` · `TaskCompleted` · `Stop` · `StopFailure` · `TeammateIdle` · `ConfigChange` · `CwdChanged` · `DirectoryAdded` · `FileChanged` · `WorktreeCreate` · `WorktreeRemove` · `PreCompact` · `PostCompact` · `SessionEnd` · `Elicitation` · `ElicitationResult`

**7. Fem eksekveringstyper — SANT**
`type` tar nøyaktig: `"command"` (shell, JSON på stdin), `"http"` (POST, svar i samme JSON-format), `"mcp_tool"`, `"prompt"` (én-vendings modellvurdering), `"agent"` (subagent med verktøytilgang — **eksperimentell**).
Bonus: `if`-feltet filtrerer på tillatelsesregel-syntaks (`"Bash(git *)"`) men er best-effort og feiler åpent — bruk tillatelsessystemet, ikke en hook, for harde grenser.

**8. Deny-payload — SANT, hører til PreToolUse**
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Destructive command blocked by hook"
  }
}
```
`permissionDecision` tar `allow` / `deny` / `ask` / `defer`. Ved `deny` vises begrunnelsen til Claude; ved `allow`/`ask` til brukeren. Topp-nivå `decision`/`reason` er deprecated for PreToolUse (fortsatt gjeldende for PostToolUse og Stop). Exit code 2 blokkerer uansett — selv JSON `"allow"` overstyrer den ikke.

## Subagenter og delegering

**9. Frontmatter og `isolation: worktree` — SANT**
Markdown + YAML i `.claude/agents/` (prosjekt), `~/.claude/agents/` (bruker), plugin-ens `agents/`, eller `--agents`-flagget. Felter: `name` og `description` (påkrevd), `tools`, `disallowedTools`, `model`, `permissionMode`, `maxTurns`, `skills`, `mcpServers`, `hooks`, `memory`, `background`, `isolation`, `color`, `initialPrompt`, `effort`.
`isolation: worktree`: midlertidig git-worktree forgrenet fra **default branch** (ikke foreldresesjonens HEAD); ryddes automatisk uten endringer.
Fallgruve: `skills` og `mcpServers` i definisjonen **gjelder ikke** når den kjører som teammate.

**10. Agent teams vs. subagenter — mekanikken stemmer; viktigste opplysning manglet**
Subagenter: vertikalt — rapporterer kun tilbake, snakker aldri sammen. Teammates: hver sin fulle sesjon, delt oppgaveliste, claimer arbeid, melder **direkte til hverandre** via mailbox. Du kan snakke med en enkelt teammate uten å gå via lead.
**På slida: eksperimentelt og AV som standard — krever `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`.**
Begrensninger: virker ikke i `-p`/Agent SDK · ett team per sesjon · ingen nøstede team · lead kan ikke byttes · `/resume`/`/rewind` gjenoppretter ikke in-process teammates · token-kostnad lineær med antall — start med 3–5.
Advarsel: med teams på blir en subagent Claude *navngir* automatisk teammate → idle-varsling uten output i stedet for subagent-resultat.

**11. Workflows — SANT, offisielt navn «dynamiske workflows»**
JavaScript-script som orkestrerer subagenter i stor skala; Claude skriver scriptet, en runtime kjører det i bakgrunnen. Krever v2.1.154+. Primitiver: `agent()`, `parallel()`, `pipeline()` **og `phase()`**. Scriptet starter med `export const meta = { name, description }`.

Når bruke hva (slide-klar tabell):

| | Hvem holder planen | Skala |
|---|---|---|
| Subagenter | Claude, vending for vending | Noen få per vending |
| Skills | Claude, følger prompten | Samme som subagenter |
| Agent teams | Lead-agenten, vending for vending | En håndfull langtkjørende peers |
| **Workflows** | **Scriptet** | **Titalls til hundrevis per kjøring** |

Poenget: planen flyttes inn i kode — mellomresultater lever i script-variabler, ikke i Claudes kontekstvindu. Derfor skalerer det.
Praktisk: start med `/deep-research` (innebygd). Trigg med nøkkelordet `ultracode` eller «bruk en workflow». `/workflows` viser kjøringer; `s` lagrer en kjøring som gjenbrukbar `/kommando`. Grenser: maks 16 samtidige agenter, 1 000 per kjøring, ingen `import()`, ingen bruker-input midt i. Workflow-subagenter kjører alltid i `acceptEdits`.

## Kontekst og compact

**12. Hva som overlever `/compact` — dumpen stemte punkt for punkt**

| Mekanisme | Etter compaction |
|---|---|
| Systemprompt og output style | Uendret; utenfor meldingshistorikken |
| Prosjekt-rot CLAUDE.md og uskopede regler | Gjeninjiseres fra disk |
| Auto-minne | Gjeninjiseres fra disk |
| Regler med `paths:`-frontmatter | **Tapt** til en matchende fil leses igjen |
| Nested CLAUDE.md i underkataloger | **Tapt** til en fil i den katalogen leses igjen |
| Invokerte skill-kropper | Gjeninjiseres; tak 5 000 tokens per skill, 25 000 totalt, eldste droppes først |
| Hooks | Ikke relevant — kjører som kode, ikke kontekst |

To ekstra poeng verdt hver sin slide:
- **Skill-listinga (navn + beskrivelser) gjeninjiseres IKKE etter `/compact`** — kun skills du faktisk invokerte bevares. Eneste unntak fra «oppstartsinnhold lastes på nytt».
- Trunkering av skill-kropper beholder **starten** av fila → legg det viktigste øverst i `SKILL.md`.

Praktisk råd: skal en regel overleve compaction — dropp `paths:`-frontmatteren eller flytt den til prosjekt-rotas CLAUDE.md.

**13. Progressiv avsløring i skills — SANT, med to detaljer til**
Ved oppstart lastes en listing av skill-navn + beskrivelser; full kropp først ved invokering. Mangler i dumpen:
- **Kroppen blir liggende i konteksten resten av sesjonen** — hver linje er gjentakende token-kostnad; hold `SKILL.md` kort.
- Listinga har **budsjett på 1 % av kontekstvinduet** — renner det over, forkortes beskrivelser (sjeldnest invokerte først). `/context`-radens «Skills» viser størrelsen.
Unntak: `disable-model-invocation: true` holder beskrivelsen helt ute av konteksten (kun `/navn` virker). Subagenter med `skills:` får **full skill-tekst injisert ved oppstart** — motsatt av vanlig oppførsel.

## Pakking og diverse

**14. Plugins — navnerommet er `plugin-navn:skill-navn`**
Invokert som `/mitt-plugin:review` (`my-plugin/skills/review/SKILL.md` → `/my-plugin:review`) — kolliderer aldri med prosjekt-/brukerskills. En plugin kan inneholde: **skills** (`skills/` eller `commands/`, eller én `SKILL.md` i rota), **agents**, **hooks**, **MCP-servere**, **LSP-servere** (`.lsp.json`), **monitors** og **themes** (de to siste manglet i dumpen).

**15. Headless / CI — `claude -p` ER Agent SDK (CLI-flata av den)**
Python-/TypeScript-pakkene er samme motor — ikke to konkurrerende måter.
Viktigst for CI, manglet i dumpen: **`--bare`** — hopper over auto-oppdagelse av hooks, skills, subagenter, plugins, MCP, auto-minne og CLAUDE.md → samme resultat på hver maskin. Uten den kjører `claude -p` hooks fra prosjektets `.claude/settings.json` selv i en utrustet mappe (`-p` viser ingen trust-dialog). `--bare` blir default for `-p` i en framtidig versjon; krever `ANTHROPIC_API_KEY`.
Flagg for slida: `--output-format text|json|stream-json` · `--json-schema` · `--allowedTools "Bash,Read,Edit"` · `--permission-mode auto|dontAsk|acceptEdits` · `--continue` / `--resume <id>` · `--append-system-prompt`. Låst CI: `--permission-mode dontAsk`. Exit 0 ved suksess, 143 ved SIGTERM.

## Kilder

`/goal` https://code.claude.com/docs/en/goal.md · hooks https://code.claude.com/docs/en/hooks.md · subagenter https://code.claude.com/docs/en/sub-agents.md · agent teams https://code.claude.com/docs/en/agent-teams.md · workflows https://code.claude.com/docs/en/workflows.md · skills https://code.claude.com/docs/en/skills.md · kontekst https://code.claude.com/docs/en/context-window.md · plugins https://code.claude.com/docs/en/plugins-reference.md · headless https://code.claude.com/docs/en/headless.md · auto mode https://code.claude.com/docs/en/auto-mode-config.md · env-vars https://code.claude.com/docs/en/env-vars.md
