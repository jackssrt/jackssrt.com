<script lang="ts">
	import type { Component, Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";
	import ExternalLink from "./ExternalLink.svelte";
	import InternalLink from "./InternalLink.svelte";

	const {
		children,
		class: klass,
		href,
		rel,
		...rest
	}: { children?: Snippet; class: string; href?: string; rel?: string } = $props();
	const ComponentToRender = $derived(
		href?.startsWith("/") ? InternalLink : ExternalLink
	) as Component<{ class: string; href: string; rel?: string; children: Snippet }>;
</script>

{#if href}
	<ComponentToRender
		class={twMerge(
			// add 2px of invisible right border to prevent content shifting when hovering
			"border-l-2 border-r-transparent p-2 transition-all hover:border-r-2 hover:border-l-4",
			klass
		)}
		{href}
		{rel}
		{...rest}
	>
		{#if children}
			{@render children()}
		{/if}
	</ComponentToRender>
{:else}
	<div class={twMerge("border-l-2 p-2 transition-all", klass)} {...rest}>
		{#if children}
			{@render children()}
		{/if}
	</div>
{/if}
