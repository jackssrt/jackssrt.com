<script lang="ts">
	import ChevronDown from "@iconify-svelte/lucide/chevron-down";
	import ChevronUp from "@iconify-svelte/lucide/chevron-up";
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";

	const {
		name,
		children,
		class: klass = ""
	}: { name: string; children?: Snippet; class?: string } = $props();
</script>

<details class="group">
	<summary class="group select-none marker:content-[''] hover:font-semibold">
		<span>{name}</span>
		<ChevronDown class="inline-block w-4 in-open:hidden" />
		<ChevronUp class="hidden w-4 in-open:inline-block" />
	</summary>
	<div class={twMerge("mt-2", klass)}>
			{@render children?.()}

	</div>
</details>
