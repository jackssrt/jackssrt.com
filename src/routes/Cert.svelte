<script lang="ts">
	import MiniCard from "$lib/components/MiniCard.svelte";
	import { match } from "ts-pattern";
	import type { CertType } from "./CertsCard.svelte";

	const {
		name,
		href,
		source,
		version,

		// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
		type
	}: { name: string; href?: string; source: string; version: string; type: CertType } = $props();
</script>

<MiniCard
	{href}
	// eslint-disable-next-line @typescript-eslint/no-unsafe-call
	class={match(type)
		.with("language", () => "border-l-orange-500")
		.with("programming", () => "border-l-sky-500")
		.with("tech", () => "border-l-emerald-500")
		.exhaustive()}
>
	{#snippet header()}
		<span>{name}</span>&nbsp;<span class="text-sm">({version})</span>
	{/snippet}
	{source}</MiniCard
>
