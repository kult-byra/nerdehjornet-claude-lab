<!--
  TryNow — «test dette nå»-boks. Alltid emerald, alltid nederst til høyre i en seksjon,
  så folk lærer å lete etter samme signal hver gang.
-->
<script setup lang="ts">
defineProps<{ path?: string }>()
</script>

<template>
  <div class="card border-emerald/30 bg-emerald/5">
    <div class="flex items-baseline gap-3">
      <span class="font-mono text-[11px] tracking-[0.18em] uppercase text-emerald">Test dette nå</span>
      <span v-if="path" class="font-mono text-[11px] text-paper/40">{{ path }}</span>
    </div>
    <div class="mt-3 text-[16px] leading-[1.5] font-300 text-paper/85">
      <slot />
    </div>
  </div>
</template>
