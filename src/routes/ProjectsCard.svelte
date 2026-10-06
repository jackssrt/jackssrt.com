<script lang="ts" module>
	export const CLASSES = {
		rust: "before:bg-orange-500",
		svelte: "before:bg-red-500",
		typescript: "before:bg-sky-500"
	} as const;
	export type ProgrammingLanguage = keyof typeof CLASSES;
	export const PROGRAMMING_LANGUAGES = Object.keys(CLASSES) as ProgrammingLanguage[];
</script>

<script lang="ts">
	import Project from "./Project.svelte";
	import ExpandableListSection from "./ExpandableListSection.svelte";

	const { class: klass }: { class: string } = $props();
</script>

<ExpandableListSection name="projects" class={klass} legendClass={CLASSES}>
	<Project name="jackssrt.com" language="svelte">this website</Project>
	<Project name="kantalla.com" language="svelte">bio website for one of my friends :3</Project>
	<Project name="seiko2" language="rust" href="" class="col-span-2">
		authentication microservice for ynoproject <br /><span class="text-xs text-white/50">
			contributor, not open-source yet
		</span>
	</Project>
	<Project name="slim-osc" language="rust">
		incredibly thin program for displaying pc stats in a vrchat message
	</Project>
	<Project name="pengui-server" language="rust">
		rewrite of the game server behind ynoproject
	</Project>
	<Project name="yno-translate" language="typescript">
		chat translation userscript for ynoproject
	</Project>
	<Project name="josh" language="typescript">legacy private splatoon discord bot</Project>
</ExpandableListSection>
