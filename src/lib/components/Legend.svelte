<script lang="ts">
	import { twMerge } from "tailwind-merge";
	const { class: classes }: { class: Record<string, string> } = $props();
</script>

<div class="flex w-fit gap-4">
	{#each Object.entries(classes) as [key, value] (key)}
		<span class={twMerge("text-sm before:mr-1 before:inline-block before:h-2 before:w-2", value)}>
			{key}
		</span>
	{/each}
</div>
