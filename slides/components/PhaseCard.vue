<script setup lang="ts">
defineProps<{
  /** Fasenummer, mono + sky */
  n: string
  title: string
  /** Varighet, f.eks. «2 uker» */
  duration: string
  deliverables: string[]
}>()
</script>

<!-- Ett prosesskort på tidslinja. Leveransene ligger nederst under en hairline. -->
<template>
  <article class="card min-h-0 min-w-0 flex flex-col overflow-hidden">
    <div class="shrink-0 flex items-baseline justify-between gap-4">
      <div class="tabular font-mono text-[12px] tracking-[0.16em] text-sky">{{ n }}</div>
      <div class="font-mono text-[11px] tracking-[0.12em] text-paper/60">{{ duration }}</div>
    </div>

    <div class="shrink-0 mt-8 text-[26px] leading-[1.15] font-500 tracking-[-0.02em]">
      {{ title }}
    </div>

    <div class="shrink-0 mt-auto pt-10">
      <div class="h-px bg-paper/10" />
      <!-- mt-4 ligger på wrapperen: margin på ul/ol/p nullstilles av style.css -->
      <div class="mt-4">
      <ul class="flex flex-col gap-2.5">
        <li
          v-for="d in deliverables"
          :key="d"
          class="min-h-0 min-w-0 flex items-baseline gap-3 text-[14px] leading-[1.4] text-paper/75"
        >
          <span class="shrink-0 w-1 h-1 rounded-full bg-sky translate-y-[-3px]" />
          <span class="min-w-0">{{ d }}</span>
        </li>
      </ul>
      </div>
    </div>
  </article>
</template>
