<script lang="ts">
	import type { Component, Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";
	import ExternalLink from "./ExternalLink.svelte";
	import InternalLink from "./InternalLink.svelte";
	import clsx from "clsx";

	const {
		children,
		class: klass,
		href,
		rel,
		gradientClass,
		...rest
	}: {
		children?: Snippet;
		class?: string;
		href?: string;
		rel?: string;
		gradientClass?: string;
	} = $props();
	const ComponentToRender = $derived(
		href?.startsWith("/") ? InternalLink : ExternalLink
	) as Component<{ class: string; href: string; rel?: string; children: Snippet }>;
</script>

{#if href}
	<ComponentToRender
		class={twMerge(
			// add 2px of invisible right border to prevent content shifting when hovering
			"border-l-2 border-r-transparent p-2 transition-all hover:border-r-2 hover:border-l-4",
			gradientClass && "relative border-l-transparent",
			klass
		)}
		{href}
		{rel}
		{...rest}
	>
		{#if gradientClass}
			<div class={clsx("absolute top-0 -left-0.5 h-full w-0.5", gradientClass)}></div>
		{/if}
		{@render children?.()}
	</ComponentToRender>
{:else}
	<div
		class={twMerge(
			"border-l-2 p-2 transition-all",
			gradientClass && "relative border-l-transparent",
			klass
		)}
		{...rest}
	>
		{#if gradientClass}
			<div class={clsx("absolute top-0 -left-0.5 h-full w-0.5", gradientClass)}></div>
		{/if}
		{@render children?.()}
	</div>
{/if}
