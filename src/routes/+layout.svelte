<script lang="ts">
	import "./layout.css";
	import "@fontsource-variable/geist-mono";
	import Background from "$lib/components/Background.svelte";
	import { prefersReducedMotion } from "svelte/motion";
	import avatar from "$lib/assets/avatar.png";
	import type { Snippet } from "svelte";

	let { children }: { children: Snippet } = $props();
</script>

<svelte:head
	><link rel="icon" href={avatar} /><title>jackssrt</title>
	<meta name="og:title" content="jackssrt" />
	<meta
		name="description"
		content="i'm jack, a fullstack developer from the åland islands.
i specialize in rust and typescript, i work on projects of any scale.
i'm also interested in game development, modding, hardware and reverse engineering!"
	/>
	<meta
		name="og:description"
		content="i'm jack, a fullstack developer from the åland islands.
i specialize in rust and typescript, i work on projects of any scale.
i'm also interested in game development, modding, hardware and reverse engineering!"
	/>
	<meta name="og:image" content={avatar} />
	<meta name="keywords" content="developer, full-stack, fullstack" />
	<meta name="author" content="jackssrt" />
	<link rel="canonical" href="https://jackssrt.com" />
	<meta name="og:url" content="https://jackssrt.com" />
	<meta name="og:type" content="website" />
	<meta name="theme-color" content="#0ea5e9" />
	<meta name="mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
</svelte:head>

{#if !prefersReducedMotion.current}
	<Background />
{/if}

<div class="grid min-h-dvh place-items-center gap-2 px-2 py-2 pb-16">
	<div class="flex flex-col gap-2 lg:w-xl">
		{@render children()}
	</div>
</div>
