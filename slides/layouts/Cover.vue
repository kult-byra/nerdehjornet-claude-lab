<!--
  Cover — badge, tittel, undertittel, metadata-rad.

  Overflow-kontrakt:
  - rot: h-full flex flex-col (+ !p-0, layouten eier padding selv)
  - midtregionen: flex-1 min-h-0
  - metadata-raden: shrink-0
-->
<template>
  <div class="slidev-layout cover-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 flex flex-col justify-center px-20">
      <div class="min-h-0 font-mono text-xs tracking-[0.18em] uppercase text-sky">
        <slot name="badge" />
      </div>

      <div class="min-h-0 mt-9 text-[76px] leading-[1.1] font-600 tracking-[-0.035em]">
        <slot />
      </div>

      <div class="min-h-0 mt-7 max-w-[760px] text-[23px] leading-[1.45] font-300 text-paper/70">
        <slot name="subtitle" />
      </div>
    </div>

    <div class="shrink-0 px-20 pb-14">
      <div class="h-px bg-paper/10" />
      <div class="mt-5 flex items-center gap-5 font-mono text-xs tracking-[0.12em] text-paper/60">
        <slot name="meta" />
      </div>
    </div>
  </div>
</template>
