<!--
  Bento — asymmetrisk 4-kolonners grid over 2 rader.

  Vekting (bevisst asymmetrisk; boks 1 spenner 2 kolonner og er størst):
    ┌───────────────┬───────────────┐
    │               │       2       │
    │       1       ├───────┬───────┤
    │               │   3   │   4   │
    └───────────────┴───────┴───────┘

  Ingen slide-header: SHARED-SPEC gir ikke overskriftstekst for denne sliden.

  Overflow-kontrakt:
  - rot: h-full flex flex-col (+ !p-0)
  - gridregion: flex-1 min-h-0
  - hver celle setter min-h-0/min-w-0 selv (se BentoBox)
-->
<template>
  <div class="slidev-layout bento-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 px-20 py-16">
      <div class="h-full grid grid-cols-4 grid-rows-2 gap-5">
        <slot />
      </div>
    </div>
  </div>
</template>
