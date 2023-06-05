<script>
	import { i, languages, switchLanguage, language } from '@inlang/sdk-js';
</script>

<div class="flex flex-col justify-center items-center h-screen gap-2">
	<div class="flex justify-center items-center gap-2">
		{#each languages as lang}
			<button
				class:font-bold={lang === language}
				class="border-2 border-black border-dashed p-2"
				on:click|preventDefault|stopPropagation={() => {
					switchLanguage(lang);
				}}>{lang}</button
			>
		{/each}
	</div>
	<div>
		<h1>{i('welcome')}</h1>
	</div>
</div>
