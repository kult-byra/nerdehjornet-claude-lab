<!--
  Brick — én legokloss. Brukes til byggekloss-metaforen på forsiden
  og som markør i heuristikk-slidene.
-->
<script setup lang="ts">
defineProps<{ color?: string; w?: number; label?: string }>()
</script>

<template>
  <div class="inline-flex flex-col items-center">
    <div class="flex gap-[6px] mb-[-2px] pl-[2px]">
      <span
        v-for="i in (w ?? 2)"
        :key="i"
        class="block w-[14px] h-[7px] rounded-t-[3px]"
        :class="color ?? 'bg-sky'"
      />
    </div>
    <div
      class="rounded-[5px] border border-paper/15 flex items-center justify-center px-4 h-[42px]"
      :class="color ?? 'bg-sky'"
    >
      <span class="font-mono text-[11px] tracking-[0.1em] uppercase text-ink font-600">
        {{ label }}
      </span>
    </div>
  </div>
</template>
