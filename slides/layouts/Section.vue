<!--
  Section — seksjonsskille. Stort nummer, tittel, undertittel.
-->
<template>
  <div class="slidev-layout section-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 flex flex-col justify-center px-30">
      <div class="min-h-0 kicker">
        <slot name="kicker" />
      </div>
      <div class="min-h-0 mt-8 display text-[64px] leading-[1.1]">
        <slot />
      </div>
      <div class="min-h-0 lead mt-7 max-w-[900px] text-[22px] leading-[1.5] text-paper/80">
        <slot name="subtitle" />
      </div>
    </div>
    <div class="shrink-0 px-30 pb-14">
      <div class="h-px bg-paper/10" />
      <div class="mt-5 font-label text-[13px] tracking-[1px] uppercase text-paper/55">
        <slot name="meta" />
      </div>
    </div>
  </div>
</template>
