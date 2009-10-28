<!--Intro-->
<div class="intro_page">
	<h2>
		<a href="<S$helper->url('/page')S>/<S $page->id S>/<S $page->descriptions('title')|replace:'/':'-'|replace:' ':'_'|urlencode S>"><S $page->descriptions('title') S></a>
	</h2>
	<div>
		<S if $page->descriptions('intro') S>
			<S $page->descriptions('intro')|nl2br S>
		<S else S>
			<S $page->descriptions('content')|nl2br|truncate:500:"...":true S>
		<S /if S>
	</div>
</div>
