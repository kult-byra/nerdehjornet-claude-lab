---
theme: default
title: Claude-verktøy — Nerdehjørnet 21.08.2026
colorSchema: dark
highlighter: shiki
canvasWidth: 1280
aspectRatio: 16/9
fonts:
  sans: Inter
  mono: JetBrains Mono
  weights: '300,400,500,600,700'
  italic: true
  provider: google
drawings:
  persist: false
layout: Cover
---

<h1>Claude-verktøy</h1>

::badge::

NERDEHJØRNET · 21. AUGUST 2026

::subtitle::

<div>Det er ikke ett verktøy. Det er en boks med klosser — og du setter dem sammen selv.</div>

<div class="mt-10 flex items-end gap-4">
  <Brick label="CLAUDE.md" color="bg-sky" :w="3" />
  <Brick label="Skill" color="bg-emerald" :w="2" />
  <Brick label="Hook" color="bg-sky" :w="2" />
  <Brick label="Subagent" color="bg-emerald" :w="3" />
  <Brick label="Workflow" color="bg-sky" :w="3" />
  <span class="pb-3 text-[28px] font-300 text-paper/40">…</span>
</div>

::meta::

<div>Vilde Brunvoll</div>
<div class="w-px h-3 bg-paper/10"></div>
<div>Kult</div>
<div class="w-px h-3 bg-paper/10"></div>
<div>Hands-on — ta fram maskinen</div>

<!--
Poenget med klossene: ingen av dem er imponerende alene. Verdien er at du kombinerer dem til noe DU trenger.
I dag: først en time med klosser, så bygger dere deres egne greier.
-->

---
layout: Content
---

::kicker::

DISPOSISJON

::title::

Det vi skal gjennom

<div class="min-h-0 grid grid-cols-2 gap-x-16 gap-y-6">
  <ul class="flex flex-col gap-6">
    <NumList n="01" title="Kontekst">CLAUDE.md, rules, minne, kontekstbudsjett</NumList>
    <NumList n="02" title="Skills">progressiv avsløring, triggere, bundlede script</NumList>
    <NumList n="03" title="Determinisme">hooks, guards, permissions: garantier, ikke håp</NumList>
    <NumList n="04" title="Verktøy">MCP mot script i en skill</NumList>
    <NumList n="05" title="Delegering">subagenter og agentteam</NumList>
  </ul>
  <ul class="flex flex-col gap-6">
    <NumList n="06" title="Loops & workflows">sløyfen som gjør Claude til en agent</NumList>
    <NumList n="07" title="Pakking">plugins og marketplaces</NumList>
    <NumList n="08" title="Utenfor terminalen">headless, CI, Agent SDK</NumList>
    <NumList n="09" title="ClaudeFast">skal vi kjøpe? Kort svar: nei</NumList>
    <li class="min-h-0 mt-2 border-l-2 border-emerald pl-6">
      <span class="block text-[17px] leading-[1.4] font-400 text-emerald">Og til slutt: åpen byggetid.</span>
      <span class="block mt-1 text-[15px] leading-[1.45] font-300 text-paper/60">Ta et problem du faktisk har. Velg en kloss. Bygg.</span>
    </li>
  </ul>
</div>

::foot::

Hver del har minst ett «test dette nå» — repoet er klont, du kan kjøre alt underveis

<!--
Ikke lov at vi rekker alt like dypt. Si at det er ni klosser og at de skal velge sine egne favoritter.
-->

---
layout: Content
---

::kicker::

RAMMEVERKET

::title::

Alt henger på ett spørsmål

<div class="min-h-0 flex flex-col justify-center">
  <div class="text-[34px] leading-[1.25] font-500 tracking-[-0.02em] max-w-[980px]">
    Skal Claude <span class="text-sky">bestemme</span> at dette skjer —
    eller skal koden <span class="text-emerald">garantere</span> at det skjer?
  </div>

  <div class="mt-11 grid grid-cols-3 gap-6">
    <div class="card">
      <div class="font-mono text-xs tracking-[0.18em] text-sky">1</div>
      <div class="mt-3 text-[22px] leading-[1.25] font-600 tracking-[-0.01em]">Instruks</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/70">CLAUDE.md, rules, skills. Claude leser det og velger selv. Fleksibelt, men kan overses.</div>
    </div>
    <div class="card">
      <div class="font-mono text-xs tracking-[0.18em] text-emerald">2</div>
      <div class="mt-3 text-[22px] leading-[1.25] font-600 tracking-[-0.01em]">Garanti</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/70">Hooks, permissions, script. Kjører uansett hva modellen mener. Stivt, men sant hver gang.</div>
    </div>
    <div class="card">
      <div class="font-mono text-xs tracking-[0.18em] text-sky">3</div>
      <div class="mt-3 text-[22px] leading-[1.25] font-600 tracking-[-0.01em]">Delegering</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/70">Subagenter og workflows. Egne kontekstvinduer, egne mandater, parallelt arbeid.</div>
    </div>
  </div>
</div>

::foot::

Nesten alt vi ser på i dag er én av disse tre. Feilen folk gjør er å skrive instrukser der de trengte en garanti.

<!--
Dette er den ene sliden de skal huske etter tre timer. Bruk tid. Spør: hvor mange har skrevet en regel i CLAUDE.md som Claude glemte?
-->

---
layout: Section
---

::kicker::

DEL 1 AV 9

# Kontekst

::subtitle::

Hva Claude vet før du har sagt et ord. Alt annet i dag bygger på dette — en kloss som mangler kontekst, gjør feil ting raskt.

::meta::

CLAUDE.md · rules · minne · /context · /compact

---
layout: Content
---

::kicker::

KONTEKST · 1

::title::

Fire lag med instrukser

<div class="min-h-0">
  <div class="text-[17px] leading-[1.5] font-300 text-paper/70 max-w-[900px]">
    Alle lastes hver økt, i denne rekkefølgen — bredest scope først. De overstyrer ikke hverandre, de stables i konteksten.
  </div>

  <div class="mt-8 grid grid-cols-4 gap-4">
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Managed</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">/Library/Application Support/<wbr />ClaudeCode/CLAUDE.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Policy IT setter. Kan ikke ekskluderes av noen.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">User</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">~/.claude/CLAUDE.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Dine preferanser på tvers av alle prosjekter.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Project</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">./CLAUDE.md eller<br />./.claude/CLAUDE.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Arkitektur, byggkommandoer, teamstandarder. I git.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Local</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">./CLAUDE.local.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Din egen sandkasse. Gitignorert.</div>
    </div>
  </div>

  <div class="mt-8 border-l-2 border-emerald pl-6 max-w-[900px]">
    <div class="text-[19px] leading-[1.4] font-500 text-emerald">Fila ER oppførselen.</div>
    <div class="mt-1 text-[16px] leading-[1.45] font-300 text-paper/70">Ikke noe magisk minne. Du kan lese den, endre den, slette den — og oppførselen endrer seg med.</div>
  </div>
</div>

<!--
Vis din egen ~/.claude/CLAUDE.md i to sekunder. Folk skjønner det med én gang de ser at det bare er en tekstfil.
-->

---
layout: Content
---

::kicker::

KONTEKST · 2

::title::

Kontekstbudsjettet — og hva `/compact` faktisk tar fra deg

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Overlever compaction</div>
    <ul class="mt-4 flex flex-col gap-[10px] text-[16px] leading-[1.4] font-300 text-paper/80">
      <li class="flex gap-3"><span class="shrink-0 text-emerald">✓</span><span>Systemprompt og output style — ligger utenfor meldingshistorikken</span></li>
      <li class="flex gap-3"><span class="shrink-0 text-emerald">✓</span><span>Prosjekt-rotas CLAUDE.md og uskopede regler — gjeninjiseres fra disk</span></li>
      <li class="flex gap-3"><span class="shrink-0 text-emerald">✓</span><span>Auto-minne — gjeninjiseres fra disk</span></li>
      <li class="flex gap-3"><span class="shrink-0 text-emerald">✓</span><span>Skills du faktisk brukte — men kuttet ved 5 000 tokens hver, 25 000 totalt</span></li>
    </ul>
  </div>
  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Forsvinner</div>
    <ul class="mt-4 flex flex-col gap-[10px] text-[16px] leading-[1.4] font-300 text-paper/80">
      <li class="flex gap-3"><span class="shrink-0 text-paper/35">✕</span><span>Regler med <code class="font-mono text-[14px] text-paper/60">paths:</code>-frontmatter — til en fil som matcher leses igjen</span></li>
      <li class="flex gap-3"><span class="shrink-0 text-paper/35">✕</span><span>CLAUDE.md i underkataloger — til en fil der leses igjen</span></li>
      <li class="flex gap-3"><span class="shrink-0 text-paper/35">✕</span><span><strong class="font-500 text-paper">Lista over skills du IKKE har brukt</strong> — den er borte etter compact</span></li>
    </ul>
    <div class="mt-7 border-l-2 border-emerald pl-5">
      <div class="text-[16px] leading-[1.45] font-300 text-paper/85">Skal en regel overleve? Dropp <code class="font-mono text-[14px]">paths:</code>, eller flytt den til prosjekt-rotas CLAUDE.md.</div>
    </div>
  </div>
</div>

::foot::

`/clear` mellom urelaterte oppgaver · `/compact` bare når du MÅ beholde tråden · `/context` viser regninga

<!--
Den skumleste: skill-lista forsvinner. Etter compact «finnes» ikke skillen din lenger før du kaller den med /navn.
Det er derfor /clear ofte er riktigere enn /compact.
-->

---
layout: Content
---

::kicker::

KONTEKST · 3

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/01-kontekst/">
      Legg en rar regel i <code class="font-mono text-[14px]">CLAUDE.md</code> — «alle funksjoner skal navngis på norsk».
      Be Claude skrive en funksjon. Den lystrer.
      Slett regelen, <code class="font-mono text-[14px]">/clear</code>, samme prompt igjen. Den gjør det ikke.
      <div class="mt-3 text-emerald">Du har nettopp bevist at fila er oppførselen.</div>
    </TryNow>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Kjør også</div>
      <div class="mt-3 font-mono text-[15px] leading-[1.7] text-paper/80">
        /context<br />
        # denne linja går rett i CLAUDE.md
      </div>
    </div>
  </div>

  <Ideas>
    <Idea>Legg kundens tone of voice i prosjektets CLAUDE.md, så slipper du å lime den inn hver gang</Idea>
    <Idea>Skriv byggkommandoene i CLAUDE.md — «dev kjøres med portless, aldri bart»</Idea>
    <Idea>Legg Sanity-konvensjonene våre i en rule, så nye schemas blir riktige uten at du sier fra</Idea>
    <Idea>Ha en CLAUDE.local.md med dine egne snarveier som ikke skal i git</Idea>
    <Idea>Bruk <code class="font-mono text-[14px]">#</code> foran en melding når du korrigerer Claude på noe den bør huske</Idea>
    <Idea>Se på <code class="font-mono text-[14px]">/context</code> etter en lang økt — du blir overrasket over hva som spiser plassen</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 2 AV 9

# Skills

::subtitle::

En mappe med en markdown-fil. Claude leser navnet og beskrivelsen ved oppstart, og henter resten først når den trenger den.

::meta::

progressiv avsløring · triggere · bundlede script

---
layout: Content
---

::kicker::

SKILLS · 1

::title::

Progressiv avsløring — derfor tåler du mange skills

<div class="min-h-0 grid grid-cols-3 gap-6">
  <div class="card">
    <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Ved oppstart</div>
    <div class="mt-3 text-[17px] leading-[1.4] font-500">Bare navn + beskrivelse</div>
    <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Alle skills du har, som én liste. Billig. Beskrivelsen er det eneste Claude har å velge ut fra — så den er triggeren.</div>
  </div>
  <div class="card">
    <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Ved invokering</div>
    <div class="mt-3 text-[17px] leading-[1.4] font-500">Hele SKILL.md lastes</div>
    <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Og blir liggende i konteksten <strong class="font-500 text-paper">resten av økta</strong>. Hver linje koster igjen og igjen. Hold den kort.</div>
  </div>
  <div class="card">
    <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Ved trengsel</div>
    <div class="mt-3 text-[17px] leading-[1.4] font-500">Lista har 1 % budsjett</div>
    <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Renner den over, forkortes beskrivelsene — sjeldnest brukte først. <code class="font-mono text-[14px]">/context</code> viser hvor stor lista er.</div>
  </div>
</div>

<div class="mt-8 grid grid-cols-2 gap-6 max-w-[1000px]">
  <div class="border-l-2 border-emerald pl-5">
    <div class="text-[16px] leading-[1.45] font-300 text-paper/85">Blir kroppen kuttet, beholdes <strong class="font-500 text-paper">starten</strong> av fila. Legg det viktigste øverst i SKILL.md.</div>
  </div>
  <div class="border-l-2 border-paper/20 pl-5">
    <div class="text-[16px] leading-[1.45] font-300 text-paper/70">Vil du at den bare skal kunne kalles manuelt: <code class="font-mono text-[14px]">disable-model-invocation: true</code> holder beskrivelsen helt ute av konteksten.</div>
  </div>
</div>

<!--
Poeng: en skill er ikke «mer instruks». Det er instruks som VENTER til den trengs. Derfor kan du ha femti.
-->

---
layout: Content
---

::kicker::

SKILLS · 2

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/02-skills/">
      Repoet har en ferdig skill. Skriv «lag en statusrapport» — helt naturlig, ingen skråstrek — og se den slå inn.
      Åpne så <code class="font-mono text-[14px]">SKILL.md</code>, endre <code class="font-mono text-[14px]">description</code>, start ny økt og prøv igjen.
      <div class="mt-3 text-emerald">Triggeren flyttet seg. Beskrivelsen ER triggeren.</div>
    </TryNow>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Anatomi</div>
      <div class="mt-3 font-mono text-[14px] leading-[1.7] text-paper/80">
        .claude/skills/statusrapport/<br />
        &nbsp;&nbsp;SKILL.md&nbsp;&nbsp;<span class="text-paper/40"># navn, description, innhold</span><br />
        &nbsp;&nbsp;mal.md&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-paper/40"># filer skillen kan peke på</span>
      </div>
    </div>
  </div>

  <Ideas>
    <Idea>En skill som skriver ukesoppdateringen til kunde i din tone</Idea>
    <Idea>En skill som gjør møtenotater om til ClickUp-tasks med riktig format</Idea>
    <Idea>En skill som sjekker et Sanity-schema mot Kults konvensjoner</Idea>
    <Idea>En skill for tilbudsbrev: struktur, tone, hva som alltid mangler</Idea>
    <Idea>En skill som kvalitetssikrer alt-tekster og overskriftshierarki før levering</Idea>
    <Idea>En skill som forklarer en teknisk endring for en ikke-teknisk kunde</Idea>
    <Idea>En skill som gjør en Figma-flyt om til en punktliste med akseptansekriterier</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 3 AV 9

# Determinisme

::subtitle::

Hooks, guards og permissions. Her slutter du å håpe at modellen husker det — og gjør det til noe som bare skjer.

::meta::

Dette er den viktigste delen i dag

---
layout: Content
---

::kicker::

DETERMINISME · 1

::title::

En hook er kode som kjører på et tidspunkt

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Fem typer å kjøre</div>
    <ul class="mt-4 flex flex-col gap-[9px] text-[16px] leading-[1.4] font-300 text-paper/80">
      <li class="flex gap-3"><code class="shrink-0 font-mono text-[14px] text-emerald w-[92px]">command</code><span>shell-kommando, får JSON på stdin</span></li>
      <li class="flex gap-3"><code class="shrink-0 font-mono text-[14px] text-emerald w-[92px]">http</code><span>POST til en URL, svar i samme JSON-format</span></li>
      <li class="flex gap-3"><code class="shrink-0 font-mono text-[14px] text-emerald w-[92px]">mcp_tool</code><span>kaller et MCP-verktøy</span></li>
      <li class="flex gap-3"><code class="shrink-0 font-mono text-[14px] text-emerald w-[92px]">prompt</code><span>én-vendings modellvurdering</span></li>
      <li class="flex gap-3"><code class="shrink-0 font-mono text-[14px] text-emerald w-[92px]">agent</code><span>en hel subagent — eksperimentell</span></li>
    </ul>

    <div class="mt-7 text-[16px] leading-[1.5] font-300 text-paper/70">
      Og <strong class="font-500 text-paper">31 hendelser</strong> å henge dem på — fra <code class="font-mono text-[14px]">SessionStart</code> og <code class="font-mono text-[14px]">UserPromptSubmit</code> til <code class="font-mono text-[14px]">PreToolUse</code>, <code class="font-mono text-[14px]">FileChanged</code>, <code class="font-mono text-[14px]">SubagentStop</code> og <code class="font-mono text-[14px]">PreCompact</code>.
    </div>
  </div>

  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Slik ser et nei ut</div>
    <div class="mt-4 card">
      <div class="font-mono text-[13px] leading-[1.65] text-paper/85 whitespace-pre">{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "…"
  }
}</div>
    </div>
    <div class="mt-5 text-[15px] leading-[1.5] font-300 text-paper/65">
      <code class="font-mono text-[13px]">allow</code> · <code class="font-mono text-[13px]">deny</code> · <code class="font-mono text-[13px]">ask</code> · <code class="font-mono text-[13px]">defer</code>.
      Ved <code class="font-mono text-[13px]">deny</code> ser Claude begrunnelsen. Exit code 2 blokkerer uansett hva JSON-en sier.
    </div>
  </div>
</div>

::foot::

Fallgruve: `if`-feltet på en hook er best-effort og feiler ÅPENT. Harde grenser hører hjemme i permissions, ikke i en hook.

<!--
Dette er poenget med hele dagen, konkretisert: hooken bryr seg ikke om hva modellen mener. Den bare kjører.
-->

---
layout: Content
---

::kicker::

DETERMINISME · 2

::title::

Test dette nå — instruks mot garanti, side om side

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/03-determinisme/">
      Samme regel finnes to steder i repoet: som setning i <code class="font-mono text-[14px]">CLAUDE.md</code> («rør aldri hemmelig.md»), og som <code class="font-mono text-[14px]">PreToolUse</code>-hook.
      Be Claude lese fila. Fyll så økta med støy og be igjen.
      <div class="mt-3 text-emerald">Instruksen glipper av og til. Hooken glipper aldri.</div>
    </TryNow>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Kommandoer</div>
      <div class="mt-3 font-mono text-[15px] leading-[1.7] text-paper/80">
        /hooks&nbsp;&nbsp;<span class="text-paper/40"># se og lag hooks</span><br />
        /permissions&nbsp;&nbsp;<span class="text-paper/40"># harde grenser</span>
      </div>
    </div>
  </div>

  <Ideas>
    <Idea>Blokkér commit direkte til <code class="font-mono text-[14px]">main</code></Idea>
    <Idea>Kjør prettier automatisk etter hver eneste edit</Idea>
    <Idea>Nekt Claude å åpne <code class="font-mono text-[14px]">.env</code>, uansett hvor pent den spør</Idea>
    <Idea>Tving norsk språk i alt som skal til kunde</Idea>
    <Idea>Kjør testene automatisk før Claude får lov til å si seg ferdig</Idea>
    <Idea>Legg dagens kontekst inn ved <code class="font-mono text-[14px]">SessionStart</code> — dato, hvem du er, hva som haster</Idea>
    <Idea>Send en varsling til deg selv når en lang kjøring er ferdig</Idea>
    <Idea>Loggfør hver gang noen rører produksjonsdatasettet</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 4 AV 9

# Verktøy

::subtitle::

MCP kobler Claude til et system. En skill forteller hvordan systemet skal brukes hos oss. De løser ikke det samme problemet.

::meta::

MCP mot script i en skill

---
layout: Split
---

::left::

<div class="kicker">MCP</div>
<div class="min-h-0 mt-6 text-[19px] leading-[1.45] font-500">En kobling til et system utenfor</div>
<div class="min-h-0 mt-5 text-[16px] leading-[1.55] font-300 text-paper/75">
Slack, Notion, Sanity, Figma, kalenderen. Serveren tilbyr verktøy Claude kan kalle — den vet alt om <em>hva</em> som er mulig, og ingenting om hvordan dere gjør ting.
</div>
<div class="min-h-0 mt-7 card">
  <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Kostnaden — mindre enn du tror</div>
  <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Med <strong class="font-500 text-paper">tool search</strong> (på som standard) lastes bare verktøynavn og server-instruksjoner ved oppstart. Selve definisjonene hentes når Claude trenger dem — samme idé som progressiv avsløring i skills.</div>
</div>

::right::

<div class="kicker">Script i en skill</div>
<div class="min-h-0 mt-6 text-[19px] leading-[1.45] font-500">Kode som gjør nøyaktig én ting riktig</div>
<div class="min-h-0 mt-5 text-[16px] leading-[1.55] font-300 text-paper/75">
Skillen sier <em>når</em>, scriptet gjør <em>hva</em>. Ingen tolkning, ingen variasjon mellom kjøringer, ingen tokens brukt på å forklare framgangsmåten på nytt.
</div>
<div class="min-h-0 mt-7 border-l-2 border-emerald pl-6">
  <div class="text-[19px] leading-[1.35] font-500 text-emerald">Et script i en skill slår en instruks om hvordan man skriver scriptet.</div>
</div>

<!--
Regelen: kan du skrive det som kode, skriv det som kode. Bruk modellen på det som faktisk krever skjønn.
Hos oss: Slack- og Notion-MCP er koblingen; skillene våre er husreglene oppå.
-->

---
layout: Content
---

::kicker::

VERKTØY · 2

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/04-verktoy/">
      Samme oppgave to ganger: én gang forklart med ord, én gang gjennom en skill med et bundlet script.
      Sammenlign resultatene — og sammenlign hvor mange runder det tok.
      <div class="mt-3 text-emerald">Kode slår forklaring når svaret alltid skal være likt.</div>
    </TryNow>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Tommelfingerregel</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/80">Krever oppgaven skjønn? → la modellen gjøre den.<br />Er svaret alltid det samme? → skriv et script.</div>
    </div>
  </div>

  <Ideas>
    <Idea>Et script som henter siste ukes Timely-timer og formaterer dem likt hver gang</Idea>
    <Idea>Et script som lager en ny prosjektmappe med riktig struktur og navn</Idea>
    <Idea>Et script som eksporterer alle ikoner fra Figma i tre størrelser</Idea>
    <Idea>Et script som sjekker en URL for døde lenker før levering</Idea>
    <Idea>MCP mot Slack for å finne igjen tråden kunden nevnte i går</Idea>
    <Idea>MCP mot Sanity for å spørre «hvilke sider mangler meta-beskrivelse?»</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 5 AV 9

# Delegering

::subtitle::

En subagent er ikke raskere. Den har sitt eget kontekstvindu — den kan lese seg gjennom noe stort og gi deg bare svaret tilbake.

::meta::

subagenter · agent teams

---
layout: Split
---

::left::

<div class="kicker">Subagenter — vertikalt</div>
<div class="min-h-0 mt-6 text-[16px] leading-[1.55] font-300 text-paper/75">
Egen kontekst, eget mandat. Rapporterer tilbake til deg og snakker aldri med hverandre. Defineres som markdown med YAML-frontmatter i <code class="font-mono text-[14px]">.claude/agents/</code>.
</div>
<ul class="min-h-0 mt-6 flex flex-col gap-[9px] text-[15px] leading-[1.45] font-300 text-paper/75">
  <li class="flex gap-3"><span class="shrink-0 text-emerald">→</span><span><code class="font-mono text-[13px]">name</code> og <code class="font-mono text-[13px]">description</code> er påkrevd — resten er valgfritt</span></li>
  <li class="flex gap-3"><span class="shrink-0 text-emerald">→</span><span><code class="font-mono text-[13px]">tools</code>, <code class="font-mono text-[13px]">model</code>, <code class="font-mono text-[13px]">maxTurns</code>, <code class="font-mono text-[13px]">permissionMode</code> …</span></li>
  <li class="flex gap-3"><span class="shrink-0 text-emerald">→</span><span><code class="font-mono text-[13px]">isolation: worktree</code> gir den sin egen git-worktree, forgrenet fra default branch</span></li>
  <li class="flex gap-3"><span class="shrink-0 text-emerald">→</span><span>De kan spawne egne subagenter — tre lag ned som standard</span></li>
</ul>

::right::

<div class="kicker">Agent teams — horisontalt</div>
<div class="min-h-0 mt-6 text-[16px] leading-[1.55] font-300 text-paper/75">
Hver teammate har sin egen fulle sesjon, de deler en oppgaveliste, claimer arbeid og melder <strong class="font-500 text-paper">direkte til hverandre</strong>. Du kan snakke med én av dem uten å gå via lead.
</div>
<div class="min-h-0 mt-7 card">
  <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Før du demonstrerer dette</div>
  <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/80">Eksperimentelt og <strong class="font-500 text-paper">av som standard</strong>. Uten <code class="font-mono text-[13px]">CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1</code> skjer ingenting.</div>
  <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/60">Virker ikke i <code class="font-mono text-[13px]">-p</code>. Ett team per sesjon. Ingen nøstede team. Kostnaden vokser lineært — start med 3–5.</div>
</div>

<!--
Den vanligste misforståelsen: at subagenter er en fartsknapp. De er en kontekstknapp. Si det rett ut.
-->

---
layout: Content
---

::kicker::

DELEGERING · 2

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/05-delegering/">
      Repoet har ~50 plantede filer. Be Claude saumfare dem direkte, kjør <code class="font-mono text-[14px]">/context</code>.
      Så: <code class="font-mono text-[14px]">/clear</code>, samme oppgave via en subagent, <code class="font-mono text-[14px]">/context</code> igjen.
      <div class="mt-3 text-emerald">Sammenlign tallene. Det er isolering, ikke fart.</div>
    </TryNow>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Kommando</div>
      <div class="mt-3 font-mono text-[15px] leading-[1.7] text-paper/80">
        /agents&nbsp;&nbsp;<span class="text-paper/40"># se og lag subagenter</span>
      </div>
    </div>
  </div>

  <Ideas>
    <Idea>En subagent som QA-er teksten din mot Kults stilkjerne før du sender</Idea>
    <Idea>En review-agent som leser diffen din før du pusher</Idea>
    <Idea>En agent som leser hele et gammelt prosjekt og svarer «hvor er logikken for X?»</Idea>
    <Idea>En agent som går gjennom et møtereferat og finner alt som ligner en oppgave</Idea>
    <Idea>En agent som sjekker tilgjengelighet på en side og bare rapporterer funnene</Idea>
    <Idea>En agent som leser kundens gamle nettside og oppsummerer tonen deres</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 6 AV 9

# Loops & workflows

::subtitle::

Det som gjør Claude til en agent og ikke en chat: den kjører i sløyfe til noe er sant. Spørsmålet er hvem som bestemmer når den er ferdig.

::meta::

agentic loop · /goal · auto mode · dynamiske workflows

---
layout: Content
---

::kicker::

LOOPS · 1

::title::

Kjernesløyfen — og de tre knappene på den

<div class="min-h-0">
  <div class="flex items-center gap-4 font-mono text-[15px] text-paper/70">
    <span class="card !py-3 !px-5">resonnér</span><span class="text-emerald">→</span>
    <span class="card !py-3 !px-5">kall verktøy</span><span class="text-emerald">→</span>
    <span class="card !py-3 !px-5">les resultat</span><span class="text-emerald">→</span>
    <span class="card !py-3 !px-5">neste steg</span>
    <span class="text-emerald text-[20px]">↺</span>
  </div>

  <div class="mt-9 grid grid-cols-3 gap-6">
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Hvem stopper den</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Du</div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Standard. Claude spør før verktøykall, og gir seg når den mener den er ferdig.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Hvem stopper den</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Et mål — <code class="font-mono text-[17px] text-emerald">/goal</code></div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Etter hver vending dømmer en rask modell: <strong class="font-500 text-paper">Met</strong>, <strong class="font-500 text-paper">Not yet met</strong> eller <strong class="font-500 text-paper">Impossible</strong>. Ikke i mål = jobb videre.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Hvem slipper den fram</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Auto mode</div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Ruter hvert verktøykall gjennom en klassifiserer som stopper det irreversible, destruktive eller utadrettede.</div>
    </div>
  </div>

  <div class="mt-8 grid grid-cols-2 gap-6">
    <div class="border-l-2 border-emerald pl-5">
      <div class="text-[16px] leading-[1.45] font-300 text-paper/85">Evaluatoren <strong class="font-500 text-paper">kjører ikke verktøy og leser ikke filer</strong> — den dømmer bare det som står i samtalen. Skriv derfor mål Claudes egen output kan bevise: «npm test exits 0».</div>
    </div>
    <div class="border-l-2 border-paper/20 pl-5">
      <div class="text-[16px] leading-[1.45] font-300 text-paper/70">Auto mode er ikke «ingen stopp»: dine <code class="font-mono text-[14px]">deny</code>- og <code class="font-mono text-[14px]">ask</code>-regler evalueres <strong class="font-500 text-paper">før</strong> klassifisereren og vinner alltid.</div>
    </div>
  </div>
</div>

::foot::

Ett mål per sesjon · `/goal` uten argument = status · `/goal clear` = nullstill · endrer ikke tillatelsesmodus

<!--
/goal er teknisk sett bare en Stop-hook med en dommer på. Si det — da skjønner de at klossene er de samme hele veien.
-->

---
layout: Content
---

::kicker::

LOOPS · 2

::title::

Workflows: når planen skal ut av kontekstvinduet

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0">
    <div class="text-[17px] leading-[1.55] font-300 text-paper/75">
      Et JavaScript-script som orkestrerer subagenter. Claude skriver scriptet, en runtime kjører det i bakgrunnen. Primitivene er <code class="font-mono text-[15px] text-emerald">agent()</code>, <code class="font-mono text-[15px] text-emerald">parallel()</code>, <code class="font-mono text-[15px] text-emerald">pipeline()</code> og <code class="font-mono text-[15px] text-emerald">phase()</code>.
    </div>
    <div class="mt-6 border-l-2 border-emerald pl-6">
      <div class="text-[19px] leading-[1.35] font-500 text-emerald">Mellomresultatene lever i script-variabler, ikke i Claudes kontekstvindu.</div>
      <div class="mt-2 text-[15px] leading-[1.45] font-300 text-paper/70">Derfor skalerer det til titalls agenter uten at noe drukner.</div>
    </div>
    <div class="mt-6 text-[15px] leading-[1.5] font-300 text-paper/60">
      Maks 16 samtidige, 1 000 per kjøring. Ingen brukerinput underveis. Prøv den innebygde <code class="font-mono text-[14px]">/deep-research</code> først.
    </div>
  </div>

  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Hvem holder planen</div>
    <div class="mt-4 flex flex-col gap-3">
      <div class="card !py-4">
        <div class="flex items-baseline justify-between gap-4">
          <span class="text-[17px] font-500">Skills &amp; subagenter</span>
          <span class="font-mono text-[13px] text-paper/50">noen få per vending</span>
        </div>
        <div class="mt-1 text-[15px] font-300 text-paper/65">Claude, vending for vending</div>
      </div>
      <div class="card !py-4">
        <div class="flex items-baseline justify-between gap-4">
          <span class="text-[17px] font-500">Agent teams</span>
          <span class="font-mono text-[13px] text-paper/50">en håndfull peers</span>
        </div>
        <div class="mt-1 text-[15px] font-300 text-paper/65">Lead-agenten, vending for vending</div>
      </div>
      <div class="card !py-4 border-emerald/40 bg-emerald/5">
        <div class="flex items-baseline justify-between gap-4">
          <span class="text-[17px] font-500 text-emerald">Workflows</span>
          <span class="font-mono text-[13px] text-emerald/80">titalls til hundrevis</span>
        </div>
        <div class="mt-1 text-[15px] font-300 text-paper/70">Scriptet</div>
      </div>
    </div>
  </div>
</div>

---
layout: Content
---

::kicker::

LOOPS · 3

::title::

Test dette nå — den beste demoen i repoet

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/06-loops/">
      Mappa har tre bevisst ødelagte tester. Kjør:
      <div class="mt-3 font-mono text-[15px] leading-[1.6] text-paper">/goal npm test exits 0</div>
      <div class="mt-2">…og så: «få testene grønne». Len deg tilbake.
      <div class="mt-3 text-emerald">Den gir seg ikke før betingelsen er sann.</div></div>
    </TryNow>
    <div class="card border-emerald/30">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-emerald">Konkurranse</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/85">Første grønne kjøring vinner. Og: klarer du å skrive et mål som Claude ikke klarer å jukse seg forbi?</div>
    </div>
  </div>

  <Ideas>
    <Idea><code class="font-mono text-[14px]">/goal</code> «alle lenker i dokumentet svarer 200»</Idea>
    <Idea><code class="font-mono text-[14px]">/goal</code> «ingen TypeScript-feil igjen i prosjektet»</Idea>
    <Idea><code class="font-mono text-[14px]">/goal</code> «alle bilder har alt-tekst»</Idea>
    <Idea>En workflow som leser 40 kundesider og finner alle som bryter én regel</Idea>
    <Idea>En workflow som gjør research på et tema fra mange kilder samtidig</Idea>
    <Idea>Auto mode på et opprydningsoppdrag du ikke gidder å klikke deg gjennom</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 7 AV 9

# Pakking

::subtitle::

Alt vi har sett på i dag — skills, agenter, hooks, MCP — kan legges i én mappe og deles med hele byrået.

::meta::

plugins · marketplaces

---
layout: Content
---

::kicker::

PAKKING · 1

::title::

En plugin er alle klossene i én eske

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Kan inneholde</div>
    <div class="mt-4 grid grid-cols-2 gap-x-8 gap-y-[10px] text-[16px] leading-[1.4] font-300 text-paper/80">
      <div class="flex gap-3"><span class="text-emerald">→</span>skills</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>agents</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>hooks</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>MCP-servere</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>LSP-servere</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>monitors</div>
      <div class="flex gap-3"><span class="text-emerald">→</span>themes</div>
    </div>

    <div class="mt-8 text-[16px] leading-[1.55] font-300 text-paper/70">
      Skills fra en plugin får navnerom: <code class="font-mono text-[15px] text-emerald">/mitt-plugin:review</code>. De kolliderer aldri med dine egne.
    </div>
  </div>

  <div class="min-w-0">
    <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Hvorfor det betyr noe hos oss</div>
    <div class="mt-4 text-[17px] leading-[1.5] font-300 text-paper/80">
      Akkurat nå bor de gode oppsettene på hver sin maskin. En plugin er forskjellen på at <em>du</em> har en god hook, og at <strong class="font-500 text-paper">Kult</strong> har den.
    </div>
    <div class="mt-7 border-l-2 border-emerald pl-6">
      <div class="text-[18px] leading-[1.4] font-500 text-emerald">Lab-repoet du sitter i er sin egen marketplace.</div>
      <div class="mt-2 text-[15px] leading-[1.45] font-300 text-paper/70">Du kan installere en plugin fra det, akkurat nå.</div>
    </div>
  </div>
</div>

---
layout: Content
---

::kicker::

PAKKING · 2

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/07-pakking/">
      Kjør <code class="font-mono text-[14px]">/plugin</code>, legg til dette repoet som marketplace og installer plugin-en som ligger i det.
      Se skillen dukke opp med navnerom foran.
      <div class="mt-3 text-emerald">Det du bygde i dag kan være installert hos alle i morgen.</div>
    </TryNow>
  </div>

  <Ideas>
    <Idea>En Kult-plugin med tone of voice, tilbudsmal og kundekommunikasjons-skills</Idea>
    <Idea>En Next.js + Sanity-plugin med våre konvensjoner, hooks og en review-agent</Idea>
    <Idea>En onboarding-plugin: alt en ny kollega trenger, installert på ett minutt</Idea>
    <Idea>En prosjektleder-plugin: statusrapport, referat, ClickUp-formatering</Idea>
    <Idea>En designer-plugin: alt-tekst-sjekk, kontrastsjekk, eksportrutiner</Idea>
  </Ideas>
</div>

---
layout: Section
---

::kicker::

DEL 8 AV 9

# Utenfor terminalen

::subtitle::

Claude uten chat. Ett kall, ett svar, videre i scriptet — samme motor som Agent SDK-pakkene i Python og TypeScript.

::meta::

claude -p · CI · Agent SDK

---
layout: Content
---

::kicker::

UTENFOR TERMINALEN · 1

::title::

`claude -p` er Agent SDK-et, bare fra kommandolinja

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0">
    <div class="card">
      <div class="font-mono text-[14px] leading-[1.75] text-paper/85 whitespace-pre-wrap">claude -p "oppsummer README til tre punkter" &gt; notat.md</div>
    </div>
    <div class="mt-6 font-mono text-[11px] tracking-[0.18em] uppercase text-sky">Flagg du kommer til å trenge</div>
    <ul class="mt-4 flex flex-col gap-[8px] font-mono text-[14px] leading-[1.45] text-paper/75">
      <li>--output-format text | json | stream-json</li>
      <li>--json-schema</li>
      <li>--allowedTools "Bash,Read,Edit"</li>
      <li>--permission-mode dontAsk</li>
      <li>--continue / --resume &lt;id&gt;</li>
      <li>--append-system-prompt</li>
    </ul>
  </div>

  <div class="min-w-0">
    <div class="card border-emerald/30 bg-emerald/5">
      <div class="font-mono text-[11px] tracking-[0.18em] uppercase text-emerald">Det viktigste flagget i CI</div>
      <div class="mt-3 font-mono text-[17px] text-paper">--bare</div>
      <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/85">
        Hopper over auto-oppdagelse av hooks, skills, subagenter, plugins, MCP, auto-minne og CLAUDE.md.
        <strong class="font-500 text-paper"> Samme resultat på hver maskin.</strong>
      </div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/65">
        Uten den kjører <code class="font-mono text-[13px]">-p</code> hooks fra prosjektets <code class="font-mono text-[13px]">.claude/settings.json</code> — og <code class="font-mono text-[13px]">-p</code> spør aldri om du stoler på mappa.
      </div>
    </div>
    <div class="mt-6 text-[15px] leading-[1.5] font-300 text-paper/60">
      Låst CI: <code class="font-mono text-[14px]">--permission-mode dontAsk</code>. Exit 0 ved suksess, 143 ved SIGTERM.
    </div>
  </div>
</div>

---
layout: Content
---

::kicker::

UTENFOR TERMINALEN · 2

::title::

Test dette nå

<div class="min-h-0 grid grid-cols-2 gap-12">
  <div class="min-w-0 flex flex-col gap-6">
    <TryNow path="oppgaver/08-utenfor-terminalen/">
      Ut av Claude. I ditt vanlige terminalvindu:
      <div class="mt-3 font-mono text-[15px] leading-[1.6] text-paper">claude -p "oppsummer README til tre punkter" &gt; notat.md</div>
      <div class="mt-3 text-emerald">Åpne notat.md. Ingen chat, bare et svar i en fil.</div>
    </TryNow>
  </div>

  <Ideas>
    <Idea>En cron som oppsummerer #kultprat hver fredag og legger det i en note</Idea>
    <Idea><code class="font-mono text-[14px]">claude -p</code> i et build-script som skriver release notes fra git-loggen</Idea>
    <Idea>En GitHub Action som kommenterer på PR-er som mangler tester</Idea>
    <Idea>Et script som lager alt-tekster for alle bilder i en mappe</Idea>
    <Idea>Et script som sjekker om en kundetekst bryter språkreglene våre, og feiler bygget hvis den gjør det</Idea>
    <Idea>En ukesrapport som genereres av seg selv mandag morgen</Idea>
  </Ideas>
</div>

---
layout: Content
---

::kicker::

DEL 9 AV 9

::title::

ClaudeFast — skal vi kjøpe?

<div class="min-h-0 flex flex-col justify-center">
  <div class="text-[92px] leading-[1] font-600 tracking-[-0.04em] text-emerald">Nei.</div>
  <div class="mt-8 max-w-[900px] text-[21px] leading-[1.5] font-300 text-paper/75">
    Konklusjonen står fra forrige gjennomgang, og ingenting siden har endret den. Flaskehalsen vår er ikke hvor fort modellen skriver — det er hvor godt den er satt opp.
  </div>
  <div class="mt-9 border-l-2 border-emerald pl-6 max-w-[900px]">
    <div class="text-[22px] leading-[1.35] font-500 text-emerald">Én time på en hook du faktisk trenger, slår all fart i verden.</div>
  </div>
</div>

::foot::

Ta det opp igjen hvis noen har et konkret tilfelle der ventetid — ikke oppsett — er problemet

<!--
Kort slide med vilje. Ikke argumentér mot noen som ikke er i rommet — pek på hva vi heller bør bruke timen på.
-->

---
layout: Content
---

::kicker::

HEURISTIKKER · 1 AV 2

::title::

Jeg vil X → bruk Y

<div class="min-h-0 grid grid-cols-2 gap-x-14 gap-y-0">
  <div class="min-w-0">
    <div class="grid grid-cols-[1fr_auto] gap-x-6 gap-y-[13px] text-[16px] leading-[1.35]">
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1">Jeg vil…</div>
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1 text-right">Bruk</div>
      <div class="font-300 text-paper/80">Instrukser alle alltid trenger</div><div class="font-mono text-[14px] text-emerald text-right">CLAUDE.md</div>
      <div class="font-300 text-paper/80">Regler som bare gjelder visse filer</div><div class="font-mono text-[14px] text-emerald text-right">rules + paths</div>
      <div class="font-300 text-paper/80">En arbeidsflyt jeg gjentar</div><div class="font-mono text-[14px] text-emerald text-right">Skill</div>
      <div class="font-300 text-paper/80">Et oppslagsverk Claude kan slå i</div><div class="font-mono text-[14px] text-emerald text-right">Skill med filer</div>
      <div class="font-300 text-paper/80">Noe som har ett riktig svar</div><div class="font-mono text-[14px] text-emerald text-right">Script i en skill</div>
      <div class="font-300 text-paper/80">Koble til Slack, Sanity, Notion</div><div class="font-mono text-[14px] text-emerald text-right">MCP</div>
    </div>
  </div>

  <div class="min-w-0">
    <div class="grid grid-cols-[1fr_auto] gap-x-6 gap-y-[13px] text-[16px] leading-[1.35]">
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1">Jeg vil…</div>
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1 text-right">Bruk</div>
      <div class="font-300 text-paper/80">Blokkere en farlig kommando</div><div class="font-mono text-[14px] text-emerald text-right">PreToolUse-hook</div>
      <div class="font-300 text-paper/80">Formatere etter hver endring</div><div class="font-mono text-[14px] text-emerald text-right">PostToolUse-hook</div>
      <div class="font-300 text-paper/80">Nekte «ferdig» før testene er grønne</div><div class="font-mono text-[14px] text-emerald text-right">Stop-hook / /goal</div>
      <div class="font-300 text-paper/80">Gi Claude dagens dato som fakta</div><div class="font-mono text-[14px] text-emerald text-right">UserPromptSubmit-hook</div>
      <div class="font-300 text-paper/80">Hindre lesing av hemmeligheter</div><div class="font-mono text-[14px] text-emerald text-right">permissions.deny</div>
      <div class="font-300 text-paper/80">Menneske i loopen før publisering</div><div class="font-mono text-[14px] text-emerald text-right">permissions.ask</div>
    </div>
  </div>
</div>

::foot::

Merk hvor mange av linjene til høyre er garantier — og hvor ofte vi i dag løser dem med en setning i en prompt

---
layout: Content
---

::kicker::

HEURISTIKKER · 2 AV 2

::title::

Jeg vil X → bruk Y

<div class="min-h-0 grid grid-cols-2 gap-x-14">
  <div class="min-w-0">
    <div class="grid grid-cols-[1fr_auto] gap-x-6 gap-y-[13px] text-[16px] leading-[1.35]">
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1">Jeg vil…</div>
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1 text-right">Bruk</div>
      <div class="font-300 text-paper/80">Auto-godkjenne trygge handlinger</div><div class="font-mono text-[14px] text-emerald text-right">auto mode</div>
      <div class="font-300 text-paper/80">Lese 60 filer for å svare på ett spørsmål</div><div class="font-mono text-[14px] text-emerald text-right">Subagent</div>
      <div class="font-300 text-paper/80">Vurdering fra noen uten min kontekst</div><div class="font-mono text-[14px] text-emerald text-right">Subagent, flere</div>
      <div class="font-300 text-paper/80">La den jobbe til noe faktisk er sant</div><div class="font-mono text-[14px] text-emerald text-right">/goal</div>
    </div>
  </div>

  <div class="min-w-0">
    <div class="grid grid-cols-[1fr_auto] gap-x-6 gap-y-[13px] text-[16px] leading-[1.35]">
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1">Jeg vil…</div>
      <div class="font-mono text-[11px] tracking-[0.16em] uppercase text-sky pb-1 text-right">Bruk</div>
      <div class="font-300 text-paper/80">Styre rekkefølgen på mange agenter</div><div class="font-mono text-[14px] text-emerald text-right">Workflow</div>
      <div class="font-300 text-paper/80">Dele oppsettet med teamet</div><div class="font-mono text-[14px] text-emerald text-right">Plugin</div>
      <div class="font-300 text-paper/80">Kjøre det uten meg til stede</div><div class="font-mono text-[14px] text-emerald text-right">claude -p i CI</div>
      <div class="font-300 text-paper/80">Gjøre det til en tjeneste</div><div class="font-mono text-[14px] text-emerald text-right">Agent SDK</div>
    </div>
  </div>
</div>

<div class="mt-10 border-l-2 border-emerald pl-6 max-w-[1000px]">
  <div class="text-[24px] leading-[1.35] font-500 text-emerald">«ALLTID» er en hook.</div>
  <div class="mt-2 text-[17px] leading-[1.45] font-300 text-paper/75">Hver gang en instruks sier ALLTID eller SKAL ALDRI, har noen skrevet et håp der de trengte en garanti.</div>
</div>

---
layout: Content
---

::kicker::

RESTEN AV ØKTA

::title::

Nå bygger dere noe eget

<div class="min-h-0">
  <div class="grid grid-cols-3 gap-6">
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Steg 1</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Finn irritasjonen</div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Noe du gjør ofte og alltid gjør litt ulikt. En tekst du skriver om. En sjekk du glemmer. Et skjema du fyller likt hver gang.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Steg 2</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Velg klossen</div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Skal Claude <span class="text-sky">bestemme</span> at det skjer, eller skal koden <span class="text-emerald">garantere</span> det? Instruks, garanti eller delegering.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Steg 3</div>
      <div class="mt-3 text-[19px] leading-[1.3] font-600">Bygg i ~30 min</div>
      <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Det trenger ikke funke. Det som ikke funket er like interessant å vise fram som det som funket.</div>
    </div>
  </div>

  <div class="mt-9 flex items-center gap-8">
    <div class="card !py-4 !px-6">
      <div class="font-mono text-[15px] text-paper/85">cp din-egen/MAL.md din-egen/fornavn-hva-det-er.md</div>
    </div>
    <div class="text-[17px] leading-[1.4] font-300 text-paper/70">Tre spørsmål i malen: <span class="text-paper">problemet mitt</span> · <span class="text-paper">klossen jeg valgte</span> · <span class="text-paper">funket det?</span></div>
  </div>
</div>

::foot::

Show & tell til slutt — to minutter hver, ingen forberedelse

---
layout: Cover
---

<h1>Takk 🧱</h1>

::badge::

TA MED VIDERE

::subtitle::

<div class="flex flex-col gap-5 text-[19px] leading-[1.45] max-w-[900px]">
  <div class="flex gap-5"><span class="shrink-0 font-mono text-[13px] text-sky pt-[6px]">01</span><span><strong class="font-500 text-paper">«ALLTID» er en hook.</strong> Skriver du en regel som må holde hver gang, hører den ikke hjemme i en prompt.</span></div>
  <div class="flex gap-5"><span class="shrink-0 font-mono text-[13px] text-sky pt-[6px]">02</span><span><strong class="font-500 text-paper">Vi mangler ikke skills.</strong> Vi mangler hooks, subagenter og målinger. Neste steg er ikke mer prompt.</span></div>
  <div class="flex gap-5"><span class="shrink-0 font-mono text-[13px] text-sky pt-[6px]">03</span><span><strong class="font-500 text-paper">Plattformen spiser triksene.</strong> Det som var et smart oppsett i fjor er en innebygd funksjon i år — og derfor kjøper vi ikke ClaudeFast.</span></div>
</div>

::meta::

<div>Repoet blir liggende — lek videre</div>
<div class="w-px h-3 bg-paper/10"></div>
<div>Neste gang: vi bygger publiseringsguarden live</div>
