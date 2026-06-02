<script lang="ts">
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";

	const {
		href,
		class: klass = "",
		rel = "",
		children
	}: { href: string; class?: string; rel?: string; children?: Snippet } = $props();
</script>

<a
	class={twMerge("transition-all hover:font-semibold", klass)}
	// already marked as external, linter can't catch it
	// eslint-disable-next-line svelte/no-navigation-without-resolve
	{href}
	rel={`external noopener noreferrer ${rel}`}
>
	{#if children}
		{@render children()}
	{/if}
</a>
