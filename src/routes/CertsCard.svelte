<script lang="ts" module>
	export const CLASSES = { language: "before:bg-orange-500", programming: "before:bg-sky-500" };
	export type CertType = keyof typeof CLASSES;
	export const CERT_TYPES = Object.keys(CLASSES) as CertType[];
</script>

<script lang="ts">
	import Cert from "./Cert.svelte";
	import ExpandableListSection from "./ExpandableListSection.svelte";
</script>

<ExpandableListSection legendClass={CLASSES} class="border-violet-500" name="certs">
	<Cert
		type="language"
		name="B1 English for Developers"
		source="freecodecamp.org"
		href="https://www.freecodecamp.org/certification/jackssrt/b1-english-for-developers"
	/>
	<Cert
		name="Javascript"
		type="programming"
		href="https://www.freecodecamp.org/certification/jackssrt/javascript-v9"
		source="freecodecamp.org"
	/>
</ExpandableListSection>
