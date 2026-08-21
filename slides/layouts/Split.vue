<!--
  Split — to kolonner delt av en vertikal hairline.

  Ingen slide-header: SHARED-SPEC gir ikke overskriftstekst for denne sliden,
  og kolonneoverskriftene ligger i innholdet.

  Overflow-kontrakt:
  - rot: h-full flex flex-col (+ !p-0, layouten eier padding selv)
  - kolonneregion: flex-1 min-h-0
  - hver kolonne: min-h-0 min-w-0
-->
<template>
  <div class="slidev-layout split-nk !p-0 h-full flex flex-col overflow-hidden">
    <div class="flex-1 min-h-0 px-24 py-16 grid grid-cols-2">
      <section class="min-h-0 min-w-0 pr-14 flex flex-col justify-center">
        <slot name="left" />
      </section>
      <section class="min-h-0 min-w-0 pl-14 border-l border-paper/10 flex flex-col justify-center">
        <slot name="right" />
      </section>
    </div>
  </div>
</template>
