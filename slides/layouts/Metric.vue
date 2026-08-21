<!--
  Metric — hero-tall med etikett/kilde, hairline, og redaksjonelt sitat.

  Overflow-kontrakt:
  - rot: h-full flex flex-col (+ !p-0)
  - innholdsregion: flex-1 min-h-0
  - hero-tallet er shrink-0 + whitespace-nowrap; sitatblokka er min-h-0
-->
<template>
  <div class="slidev-layout metric-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 px-20 py-16 flex flex-col justify-center">
      <div class="shrink-0 flex items-end gap-10">
        <div
          class="tabular whitespace-nowrap text-emerald text-[180px] leading-[1.02] font-600 tracking-[-0.05em]"
        >
          <slot name="metric" />
        </div>
        <div class="min-w-0 pb-5">
          <div class="text-[26px] leading-[1.2] font-400">
            <slot name="label" />
          </div>
          <div class="mt-3 max-w-[400px] font-mono text-[12.5px] leading-[1.5] text-paper/60">
            <slot name="source" />
          </div>
        </div>
      </div>

      <div class="shrink-0 h-px bg-paper/10 my-13" />

      <div class="min-h-0 border-l border-paper/10 pl-9">
        <div
          class="max-w-[900px] text-[31px] leading-[1.38] font-300 italic tracking-[-0.01em] text-paper/95"
        >
          <slot name="quote" />
        </div>
        <div class="mt-7 font-mono text-xs tracking-[0.12em] text-paper/60">
          <slot name="attribution" />
        </div>
      </div>
    </div>
  </div>
</template>
