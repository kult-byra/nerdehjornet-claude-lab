<!--
  Section — seksjonsskille. Stort nummer, tittel, undertittel.
-->
<template>
  <div class="slidev-layout section-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 flex flex-col justify-center px-20">
      <div class="min-h-0 font-mono text-xs tracking-[0.18em] uppercase text-sky">
        <slot name="kicker" />
      </div>
      <div class="min-h-0 mt-8 text-[68px] leading-[1.05] font-600 tracking-[-0.035em]">
        <slot />
      </div>
      <div class="min-h-0 mt-7 max-w-[820px] text-[22px] leading-[1.45] font-300 text-paper/70">
        <slot name="subtitle" />
      </div>
    </div>
    <div class="shrink-0 px-20 pb-14">
      <div class="h-px bg-paper/10" />
      <div class="mt-5 font-mono text-xs tracking-[0.12em] text-paper/60">
        <slot name="meta" />
      </div>
    </div>
  </div>
</template>
