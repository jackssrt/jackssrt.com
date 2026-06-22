<script lang="ts">
	import MiniCard from "$lib/components/MiniCard.svelte";
	import { cn } from "$lib/utils";
	import type { Snippet } from "svelte";
	import type { ProgrammingLanguage } from "./ProjectsCard.svelte";
	import { match } from "ts-pattern";

	const {
		name,
		// bug -.-
		// eslint-disable-next-line @typescript-eslint/no-unsafe-assignment
		language,
		href = `https://github.com/jackssrt/${name}`,
		class: klass = "",
		children
	}: {
		name: string;
		language: ProgrammingLanguage;
		href?: string;
		class?: string;
		children?: Snippet;
	} = $props();
</script>

<MiniCard
	{href}
	class={cn(
		// i miss rust..
		// eslint-disable-next-line @typescript-eslint/no-unsafe-call, @typescript-eslint/no-unsafe-argument
		match(language)
			.with("rust", () => "border-l-orange-500")
			.with("svelte", () => "border-l-red-500")
			.with("typescript", () => "border-l-sky-500")
			.exhaustive(),

		klass
	)}
>
	{#snippet header()}
		{name}
	{/snippet}
	{@render children?.()}</MiniCard
>
