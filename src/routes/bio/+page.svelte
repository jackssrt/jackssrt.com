<script>
	import Card from "#lib/components/Card.svelte";
	import ExternalLink from "#lib/components/ExternalLink.svelte";
	import LaptopIcon from "@iconify-svelte/lucide/laptop";
	import PaletteIcon from "@iconify-svelte/lucide/palette";
	import LanguagesIcon from "@iconify-svelte/lucide/languages";
	import DiscIcon from "@iconify-svelte/lucide/disc";
	import avatar from "#lib/assets/bioavatar.png";
	import BioSection from "./BioSection.svelte";

	const DESCRIPTION =
		"hai, im jackie~ :3\ni'm an 18 year old bisexual femboy :3c\ni like programming, linguistics, drawing and collecting music! :D";
</script>

<svelte:head>
	<link rel="icon" href={avatar} />
	<title>jackssrt</title>
	<meta name="og:title" content="jackssrt" />
	<meta name="description" content={DESCRIPTION} />
	<meta name="og:description" content={DESCRIPTION} />
	<meta name="og:image" content={avatar} />
	<meta
		name="keywords"
		content="femboy, bisexual, programming, programmer, drawing, linguistics, music"
	/>
	<meta name="author" content="jackssrt" />
	<link rel="canonical" href="https://jackssrt.com/bio" />
	<meta name="og:url" content="https://jackssrt.com/bio" />
</svelte:head>

<BioSection gradientClass="bg-linear-to-b from-fuchsia-500 to-sky-500">
	{#snippet title()}
		<h1 class="text-2xl font-bold">jackieee <span class="font-normal">:3</span></h1>
	{/snippet}
	<enhanced:img
		class="absolute top-0 right-0 h-24 w-24 border-r border-white p-1"
		src="#lib/assets/bioavatar.png"
		alt="my profile picture"
	></enhanced:img>
	<p>
		hai :D im jack :3 <br />18,
		<span
			title="i like both :3"
			class="bg-linear-120 from-[#D70070] via-[#9C4E97] to-[#0035A9] bg-clip-text text-transparent decoration-0"
			>bisexual</span
		>
		<span
			title="i- uh like being cute and wearing feminine clothes qwq"
			class="bg-[linear-gradient(120deg,#d560a8,#e5aece,white,#56cff8,white,#e5aece,#d560a8)] bg-clip-text text-transparent decoration-0"
			>femboy</span
		>~
	</p>
	{#snippet buttons()}
		<Card href="https://discord.com/users/304603833248514048" class="">discord</Card>
		<Card href="https://mstdn.party/@jackssrt" class="" rel="me">mastodon</Card>
	{/snippet}
</BioSection>
<BioSection class="border-l-red-500" title="programming">
	{#snippet icon()}
		<LaptopIcon />
	{/snippet}
	<p>see professional page for more information</p>
	<Card href="/?return=/bio" class="border-l-white">go there</Card>
</BioSection>
<BioSection class="border-l-orange-500" title="linguistics">
	{#snippet icon()}
		<LanguagesIcon />
	{/snippet}
	<p>i like languages a lot especially grammar c:<br />1000+ streak on duolingo</p>
	<ul>
		<li>swedish: native</li>
		<li>english: C2</li>
		<li>french: B2</li>
	</ul>
</BioSection>
<BioSection class="border-l-violet-500" title="drawing">
	{#snippet icon()}
		<PaletteIcon />
	{/snippet}
	<p>
		i draw digitally with
		<ExternalLink href="https://krita.org/" class="text-violet-500">krita</ExternalLink>
		sometimes<br />
		art page wip c.c
	</p>
</BioSection>
<BioSection class="border-l-emerald-500" title="collecting music">
	{#snippet icon()}
		<DiscIcon />
	{/snippet}
	<p>
		ive been listening to music since i was a kid,<br />and recently ive started archiving the music
		i listen to<br />i have about 3 200 tracks from 500 albums :D
	</p>
</BioSection>
