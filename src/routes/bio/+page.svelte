<script>
	import Card from "$lib/components/Card.svelte";
	import ExternalLink from "$lib/components/ExternalLink.svelte";
	import LaptopIcon from "@iconify-svelte/lucide/laptop";
	import PaletteIcon from "@iconify-svelte/lucide/palette";
	import LanguagesIcon from "@iconify-svelte/lucide/languages";
	import DiscIcon from "@iconify-svelte/lucide/disc";
</script>

<Card class="relative flex flex-col gap-4 border-l-transparent">
	<div
		class="absolute top-0 -left-0.5 h-full w-0.5 bg-linear-to-b from-fuchsia-500 to-sky-500"
	></div>
	<div class="flex flex-col gap-2">
		<h1 class="mb-2 text-xl"><b>jack</b>ieee :3</h1>
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
	</div>
	<div class="grid grid-cols-1 gap-1 lg:grid-cols-2">
		<Card href="https://discord.com/users/304603833248514048" class="">discord</Card>
		<Card href="https://mstdn.party/@jackssrt" class="" rel="me">mastodon</Card>
	</div>
</Card>
<Card class="relative flex flex-col gap-4 border-l-red-500">
	<div class="absolute top-0 right-0 w-6">
		<LaptopIcon />
	</div>
	<div class="flex flex-col gap-2">
		<h2 class="text-lg"><b>programming</b></h2>
		<p>see professional page for more information</p>
	</div>
	<Card href="/?return=/bio" class="border-l-white">go there</Card>
</Card>
<Card class="relative flex flex-col gap-2 border-l-orange-500">
	<div class="absolute top-0 right-0 w-6">
		<LanguagesIcon />
	</div>
	<h2 class="text-lg"><b>linguistics</b></h2>
	<p>i like languages a lot especially grammar c:<br />1000+ streak on duolingo</p>
	<ul>
		<li>swedish: native</li>
		<li>english: C2</li>
		<li>french: B2</li>
	</ul>
</Card>
<Card class="relative flex flex-col gap-2 border-l-violet-500">
	<div class="absolute top-0 right-0 w-6">
		<PaletteIcon />
	</div>
	<h2 class="text-lg"><b>drawing</b></h2>
	<p>
		i draw digitally with <ExternalLink href="https://krita.org/" class="text-violet-500"
			>krita</ExternalLink
		> sometimes<br />
		art page wip
	</p>
</Card>
<Card class="relative flex flex-col gap-2 border-l-emerald-500">
	<div class="absolute top-0 right-0 w-6">
		<DiscIcon />
	</div>
	<h2 class="text-lg"><b>collecting music</b></h2>
	<p>
		ive been listening to music since i was a kid, <br />and recently ive started archiving the
		music i listen to <br />i have about 3 200 tracks from 500 albums
	</p>
</Card>
