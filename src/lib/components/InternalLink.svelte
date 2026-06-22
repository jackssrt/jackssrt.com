<script lang="ts">
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";
	import { resolve } from "$app/paths";
	import type { PathnameWithSearchOrHash } from "$app/types";

	const {
		href,
		class: klass = "",
		rel = "",
		children
	}: {
		href: PathnameWithSearchOrHash;
		rel?: string;
		class?: string;
		children?: Snippet;
	} = $props();
</script>

<a
	class={twMerge("transition-all hover:font-semibold", klass)}
	href={resolve(href)}
	rel={`noopener noreferrer${rel}`}
>
		{@render children?.()}

</a>
