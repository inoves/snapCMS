
<div class="breadcrumb">
	<a href="/"><span><S $language.home S></span></a> <S $language.search S>: <S $words S>
</div>
<!--Search-->
<S foreach from=$pages item=page S>
	<S if $page->product == 0 S>
		<S include file="home/_intro_page.tpl" S>
	<S else S>
		<S include file="home/_intro_product.tpl" S>
	<S /if S>
<S /foreach S>
<!--end Search-->
<div>
	<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
</div>
