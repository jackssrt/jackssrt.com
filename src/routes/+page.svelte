<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import ExternalLink from "$lib/components/ExternalLink.svelte";
	import ProjectsCard from "./ProjectsCard.svelte";
	import CertsCard from "./CertsCard.svelte";
	import ReturnLink from "$lib/components/ReturnLink.svelte";
</script>

{#snippet link(text: string, href: string)}
	<Card {href} class="border-l-white hover:font-semibold">{text}</Card>
{/snippet}

<div class="relative flex flex-col gap-2">
	<Card class="border-l-sky-500">
		<h1 class="text-2xl">jackssrt</h1>
		<p>
			i'm jack, a full-stack developer from <ExternalLink
				class="text-sky-500"
				href="https://visitaland.com/en">the åland islands</ExternalLink
			>. <br /> i specialize in <ExternalLink class="text-orange-500" href="https://rust-lang.org/"
				>rust</ExternalLink
			> and <ExternalLink class="text-sky-500" href="https://www.typescriptlang.org/">
				typescript
			</ExternalLink>, i work on projects of any scale.<br /> i'm also interested in game
			development, modding, hardware and reverse engineering!<br />
		</p>
	</Card>
	<ProjectsCard />
	<CertsCard />
	<div class="grid grid-cols-1 gap-1 sm:grid-cols-3">
		<!-- eslint-disable @typescript-eslint/no-confusing-void-expression -->
		<!-- bug that hasnt been fixed yet https://github.com/sveltejs/svelte-eslint-parser/issues/657 -->
		{@render link("pgp key", "/jack.asc")}
		{@render link("email", "mailto:jack@jackssrt.com")}
		{@render link("github", "https://github.com/jackssrt")}
		<!-- eslint-enable @typescript-eslint/no-confusing-void-expression -->
	</div>
	<ReturnLink />
</div>
