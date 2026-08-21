<!--
  NumList — nummerert liste med monospace-teller i aksentfarge.
  Brukes på oversiktssliden og i seksjonene.
-->
<script setup lang="ts">
defineProps<{ n: string; title: string }>()
</script>

<template>
  <li class="min-h-0 min-w-0 flex gap-5">
    <span class="shrink-0 tabular font-mono text-[13px] leading-[1.5] pt-[6px] text-sky">{{ n }}</span>
    <span class="min-w-0">
      <span class="block text-[21px] leading-[1.3] font-500 tracking-[-0.01em]">{{ title }}</span>
      <span class="block mt-1 text-[15px] leading-[1.45] font-300 text-paper/60"><slot /></span>
    </span>
  </li>
</template>
