<script lang="ts">
	import Card from "#lib/components/Card.svelte";
	import clsx from "clsx";
	import type { Snippet } from "svelte";

	const {
		children,
		icon,
		title,
		buttons,
		gradientClass,
		class: klass
	}: {
		children: Snippet;
		title: string | Snippet;
		icon?: Snippet;
		class?: string;
		gradientClass?: string;
		buttons?: Snippet;
	} = $props();
</script>

<Card class={clsx("relative flex flex-col gap-2", klass)} {gradientClass}>
	{#if icon}
		<div class="absolute top-0 right-0 w-6">
			{@render icon()}
		</div>
	{/if}
	{#if typeof title === "string"}
		<h2 class="text-lg font-bold">{title}</h2>
	{:else}
		{@render title()}
	{/if}
	{@render children()}

	{#if buttons}
		<div class="grid grid-cols-1 gap-1 lg:grid-cols-2">
			{@render buttons()}
		</div>
	{/if}
</Card>
