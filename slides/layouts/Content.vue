<!--
  Content — kicker + tittel + fritt innholdsområde.

  Overflow-kontrakt (samme som de andre layoutene):
  - rot: h-full flex flex-col (+ !p-0, layouten eier padding selv)
  - innholdsregionen: flex-1 min-h-0 overflow-hidden
-->
<template>
  <div class="slidev-layout content-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="shrink-0 px-20 pt-14">
      <div class="font-mono text-xs tracking-[0.18em] uppercase text-sky">
        <slot name="kicker" />
      </div>
      <div class="mt-4 text-[42px] leading-[1.15] font-600 tracking-[-0.03em]">
        <slot name="title" />
      </div>
    </div>

    <div class="flex-1 min-h-0 px-20 py-10 overflow-hidden flex flex-col justify-center">
      <slot />
    </div>

    <div class="shrink-0 px-20 pb-10 font-mono text-xs tracking-[0.12em] text-paper/50">
      <slot name="foot" />
    </div>
  </div>
</template>
