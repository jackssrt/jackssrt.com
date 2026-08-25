<script lang="ts">
	import { browser } from "$app/env";
	import type { Attachment } from "svelte/attachments";
	import Card from "./Card.svelte";

	const search = browser && new URLSearchParams(document.location.search);
	const returnUrl = search && search.get("return");

	const fadeIn: Attachment<HTMLDivElement> = (element) => {
		element.classList.remove("opacity-0");
		element.classList.add("opacity-100");
	};
</script>

{#if returnUrl}
	<div
		{@attach fadeIn}
		class="absolute top-full flex w-full flex-col gap-8 py-8 opacity-0 transition-opacity duration-1000"
	>
		<div class="h-0 w-full border-b-2 border-white/50"></div>
		<div class="grid place-items-center">
			<!-- cant use svelte in animations here -->
			<Card href={returnUrl} class="border-l-white ">
				go back to {returnUrl}
			</Card>
		</div>
	</div>
{/if}
