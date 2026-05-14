<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import Details from "$lib/components/Details.svelte";
	import Legend from "$lib/components/Legend.svelte";
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";

	const {
		class: klass,
		legendClass,
		name,
		children
	}: {
		class: string;
		legendClass: Record<string, string>;
		name: string;
		children?: Snippet;
	} = $props();
</script>

<Card class={twMerge("has-[summary:hover]:border-l-4", klass)}>
	<Details {name} class="flex flex-col items-center gap-2">
		<Legend class={legendClass} />
		<div class="grid w-full grid-cols-1 gap-1 sm:grid-cols-2">
			{#if children}
				{@render children()}
			{/if}
		</div>
	</Details>
</Card>
