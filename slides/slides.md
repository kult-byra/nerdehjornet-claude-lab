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
