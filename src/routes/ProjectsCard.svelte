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
</script>

<ExpandableListSection name="projects" class="border-l-emerald-500" legendClass={CLASSES}>
	<Project name="jackssrt.com" language="svelte">this website</Project>
	<Project name="kantalla.com" language="svelte">bio website for one of my friends :3</Project>
	<Project name="slim-osc" language="rust">
		incredibly thin program for displaying pc stats in a vrchat message
	</Project>
	<Project name="pengui-server" language="rust">rust rewrite of the game server behind yno</Project>
	<Project name="josh" language="typescript">old private splatoon discord bot</Project>
</ExpandableListSection>
