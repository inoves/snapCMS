<div class="intro">
	<!-- menu -->
	<div class="grid_4 alpha">
		<S include file="elements/menu.tpl" S>
	</div>		
	<div class="grid_12 omega">
		
		<div class="lbl"><S $language.manufacture S>: <S $breadcrumb S></div>
		
		<S assign var='reset_cycle' value=false  S>
		<S foreach from=$pages_products item=prod S>
			<S assign var=page value=$prod->page S>
			<S if $page->product == 0 S>
				<div class="clear"></div>
				<div>
					<S assign var='reset_cycle' value=true  S>
					<S include file="types/_intro_page.tpl" S>
				</div>
			<S else S>
				<div class="grid_3 <S cycle values="alpha,,,omega" reset=$reset_cycle S>">
					<S assign var='reset_cycle' value=false  S>
					<S include file="types/_intro_product.tpl" S>
				</div>
			<S /if S>
		<S /foreach S>
	</div>
	
	<div>
		<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
	</div>
</div>