<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import { cn } from "$lib/utils";
	import type { Snippet } from "svelte";

	const {
		name,
		href,
		class: klass = "",
		children
	}: {
		name: string;
		href?: string;
		class?: string;
		children?: Snippet;
	} = $props();
</script>

<Card {href} class={cn("border-l-white hover:[&_>_h3]:font-semibold", klass)}>
	<h3>{name}</h3>
	<p class="text-sm">
		{#if children}
			{@render children()}
		{/if}
	</p>
</Card>
