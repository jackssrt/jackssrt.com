<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import { cn } from "$lib/utils";
	import type { Snippet } from "svelte";

	const {
		header,
		href,
		class: klass = "",
		children
	}: {
		header: Snippet;
		href?: string;
		class?: string;
		children?: Snippet;
	} = $props();
</script>

<Card {href} class={cn("border-l-white", klass, { "hover:[&_>_h3]:font-semibold": href })}>
	<h3>{@render header()}</h3>
	<p class="text-sm">
			{@render children?.()}

	</p>
</Card>
