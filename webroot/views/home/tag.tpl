
<!--Tag-->
<div class="breadcrumb">
	<a href="/"><span><S $language.home S></span></a> Tag: <S $tag->name S>
</div>
<div class="space_tag">
		<S include file="home/intro.tpl" S>
</div>
<div>
	<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
</div>
<!--End Tag-->
