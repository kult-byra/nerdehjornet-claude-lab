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
    Alle lastes hver økt, og de stables. Dette er «systemprompten» din for prosjektet.
    <Verify /> <span class="text-paper/45">stiene under er fra fjorårets dekk, ikke kryssjekket i dag</span>
  </div>

  <div class="mt-8 grid grid-cols-4 gap-4">
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Managed</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">/etc/claude-code/CLAUDE.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Policy IT setter. Kan ikke overstyres.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">User</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">~/.claude/CLAUDE.md</div>
      <div class="mt-3 text-[15px] leading-[1.45] font-300 text-paper/75">Dine preferanser på tvers av alle prosjekter.</div>
    </div>
    <div class="card">
      <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Project</div>
      <div class="mt-2 font-mono text-[12px] text-paper/50 break-all">./CLAUDE.md</div>
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
  <div class="font-mono text-[11px] tracking-[0.14em] uppercase text-sky">Kostnaden</div>
  <div class="mt-3 text-[15px] leading-[1.5] font-300 text-paper/70">Verktøyskjemaene tar plass i kontekstvinduet. Mange servere med mange verktøy = mindre plass til jobben. <Verify /> <span class="text-paper/45">mekanikken varierer med versjon</span></div>
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
