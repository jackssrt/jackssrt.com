<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import ExternalLink from "$lib/components/ExternalLink.svelte";
	import ProjectsCard from "./ProjectsCard.svelte";
	import CertsCard from "./CertsCard.svelte";
	import ReturnLink from "$lib/components/ReturnLink.svelte";
	import avatar from "$lib/assets/avatar.png";
	const DESCRIPTION = `i'm jack, a fullstack developer from the åland islands.
i specialize in rust and typescript, i work on projects of any scale.
i'm also interested in game development, modding, hardware and reverse engineering!`;
</script>

{#snippet link(text: string, href: string)}
	<Card {href} class="border-l-white hover:font-semibold">{text}</Card>
{/snippet}

<svelte:head
	>
		<link rel="icon" href={avatar} /><title>jackssrt</title>
	<meta name="og:title" content="jackssrt" />
	<meta name="description" content={DESCRIPTION} />
	<meta name="og:description" content={DESCRIPTION} />
	<meta name="og:image" content={avatar} />
	<meta name="keywords" content="developer, full-stack, fullstack" />
	<meta name="author" content="jackssrt" />
	<link rel="canonical" href="https://jackssrt.com" />
	<meta name="og:url" content="https://jackssrt.com" />
	<meta name="og:type" content="website" />
	<meta name="theme-color" content="#000000" />
	<meta name="mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
</svelte:head>
<div class="relative flex flex-col gap-2">
	<Card class="relative border-l-transparent">
		<div
			class="absolute top-0 -left-0.5 h-full w-0.5 bg-linear-to-b from-fuchsia-500 to-sky-500"
		></div>
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
