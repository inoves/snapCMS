<div class="container_16">
	
	<!-- menu -->
	<div class="grid_4 alpha">
		<S include file="elements/menu.tpl" S>
	</div>
	
	
	<div class="grid_12 omega">
		
		<div class="lbl"><S $breadcrumb S></div>
		
		<div class="page">
		<!--Menu Static-->
		<S foreach from=$pages item=page S>
				<S include file="typess/_static_product.tpl" S>
		<S /foreach S>
		<!--end Menu Static-->
		
		</div>
		
		<!--Paginator-->
		<div class="paginator">
			<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
		</div>
		
	</div>
</div>


