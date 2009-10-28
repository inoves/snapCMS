<div class="intro">
	<!-- menu -->
	<div class="grid_4 alpha">
		<S include file="elements/menu.tpl" S>
	</div>		
	<div class="grid_12 omega">
		<div class="lbl"><S $breadcrumb S></div>
		<S foreach from=$tag->pages item=page S>
			<S if $page->product == 0 S>
				<div class="clear"></div>
				<div>
					<S include file="types/_intro_page.tpl" S>
				</div>
			<S else S>
				<div class="grid_3 <S cycle values="alpha,,,omega" S>">
					<S include file="types/_intro_product.tpl" S>
				</div>
			<S /if S>
		<S /foreach S>
	</div>
	
	<div>
		<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
	</div>
</div>

