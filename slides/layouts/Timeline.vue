<!--
  Timeline — tre prosesskort i rad, koblet av en tynn sky-linje, med avslutt-
  linje under.

  Prikkene ligger i et grid med samme geometri som kortene (grid-cols-3 gap-6),
  så de treffer kortsentrene eksakt. Linja er ett absolutt element som starter
  og slutter i første/siste kortsenter — left/right = (100% - 2*gap) / 6 — slik
  at den blir sammenhengende uten å skape overflow i raden.

  Overflow-kontrakt:
  - rot: h-full flex flex-col (+ !p-0)
  - kortregion: flex-1 min-h-0
  - avslutt-linja: shrink-0
-->
<template>
  <div class="slidev-layout timeline-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 px-20 pt-16 flex flex-col justify-center">
      <div class="shrink-0 relative h-2">
        <div
          class="absolute top-1/2 h-px bg-sky/40 left-[calc((100%-48px)/6)] right-[calc((100%-48px)/6)]"
        />
        <div class="relative h-full grid grid-cols-3 gap-6">
          <div v-for="i in 3" :key="i" class="flex items-center justify-center">
            <div class="w-1.5 h-1.5 rounded-full bg-sky" />
          </div>
        </div>
      </div>

      <div class="min-h-0 mt-7 grid grid-cols-3 gap-6 items-stretch">
        <slot />
      </div>
    </div>

    <footer class="shrink-0 px-20 pt-10 pb-14">
      <div class="h-px bg-paper/10" />
      <div class="mt-5 font-mono text-xs tracking-[0.12em] text-paper/60">
        <slot name="footer" />
      </div>
    </footer>
  </div>
</template>
