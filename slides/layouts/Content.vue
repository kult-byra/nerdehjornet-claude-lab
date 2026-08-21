<!--
  Content — kicker + tittel + fritt innholdsområde.

  Overflow-kontrakt (samme som de andre layoutene):
  - rot: h-full flex flex-col (+ !p-0, layouten eier padding selv)
  - innholdsregionen: flex-1 min-h-0 overflow-hidden
-->
<template>
  <div class="slidev-layout content-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="shrink-0 px-24 pt-14">
      <div class="kicker">
        <slot name="kicker" />
      </div>
      <div class="title-slot mt-4 text-[42px] leading-[1.1]">
        <slot name="title" />
      </div>
    </div>

    <div class="flex-1 min-h-0 px-24 py-10 overflow-hidden flex flex-col justify-center">
      <slot />
    </div>

    <div class="shrink-0 px-24 pb-10 text-[14px] text-paper/55">
      <slot name="foot" />
    </div>
  </div>
</template>
