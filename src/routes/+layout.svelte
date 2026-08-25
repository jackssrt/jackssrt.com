<script lang="ts">
	import "./layout.css";
	import "@fontsource-variable/geist-mono";
	import Background from "#lib/components/Background.svelte";
	import { prefersReducedMotion } from "svelte/motion";
	import type { Snippet } from "svelte";

	let { children }: { children: Snippet } = $props();
</script>

{#if !prefersReducedMotion.current}
	<Background />
{/if}

<div class="grid min-h-dvh place-items-center gap-2">
	<div class="m-2 flex flex-col gap-2 lg:w-xl">
		{@render children()}
	</div>
</div>
