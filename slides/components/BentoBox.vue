<script setup lang="ts">
defineProps<{
  /** Nummer, mono + sky */
  n: string
  title: string
  /** Meta-linje nederst, mono + muted */
  meta: string
  /** Den store boksen (boks 1) får egen typeskala */
  large?: boolean
}>()
</script>

<!--
  En bento-boks. min-h-0/min-w-0 er det som hindrer at et langt ord eller en
  lang setning presser grid-cella ut over slidehøyden.
-->
<template>
  <article class="card min-h-0 min-w-0 flex flex-col overflow-hidden">
    <div class="shrink-0 tabular font-mono text-[11px] tracking-[0.16em] text-sky">
      {{ n }}
    </div>

    <div
      class="shrink-0 mt-4 font-500 tracking-[-0.015em]"
      :class="large ? 'text-[30px] leading-[1.12]' : 'text-[19px] leading-[1.2]'"
    >
      {{ title }}
    </div>

    <div
      class="min-h-0 mt-3 font-300 text-paper/75"
      :class="large ? 'text-[19px] leading-[1.5] max-w-[430px]' : 'text-[14px] leading-[1.45]'"
    >
      <slot />
    </div>

    <div class="shrink-0 mt-auto pt-5">
      <div class="h-px bg-paper/10" />
      <div class="mt-3 font-mono text-[11px] tracking-[0.1em] text-paper/60">
        {{ meta }}
      </div>
    </div>
  </article>
</template>
