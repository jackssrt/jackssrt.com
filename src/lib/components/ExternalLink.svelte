<script lang="ts">
	import type { Snippet } from "svelte";
	import { twMerge } from "tailwind-merge";

	const {
		href,
		class: klass = "",
		rel = "",
		children
	}: { href: string; class?: string; rel?: string; children?: Snippet } = $props();
</script>

<a
	class={twMerge("transition-all hover:font-semibold", klass)}
	{href}
	rel={`external noopener noreferrer ${rel}`}
>
	{@render children?.()}
</a>
