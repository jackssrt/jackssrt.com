<script lang="ts">
	import MiniCard from "$lib/components/MiniCard.svelte";
	import { match } from "ts-pattern";
	import type { CertType } from "./CertsCard.svelte";

	const {
		name,
		href,
		source,

		// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
		type
	}: { name: string; href: string; source: string; type: CertType } = $props();
</script>

<MiniCard
	{name}
	{href}
	// eslint-disable-next-line @typescript-eslint/no-unsafe-call
	class={match(type)
		.with("language", () => "border-l-orange-500")
		.with("programming", () => "border-l-sky-500")
		.exhaustive()}>{source}</MiniCard
>
