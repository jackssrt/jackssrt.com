<script lang="ts">
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";

	const {
		href,
		class: klass = "",
		children
	}: { href: string; class?: string; children?: Snippet } = $props();
</script>

<a
	class={twMerge("transition-all hover:font-semibold", klass)}
	{href}
	rel="external noopener noreferrer"
>
	{#if children}
		{@render children()}
	{/if}
</a>
