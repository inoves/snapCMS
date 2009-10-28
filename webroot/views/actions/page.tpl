<!-- menu -->
<div class="grid_4 alpha">
	<S include file="elements/menu.tpl" S>
</div>		
<div class="grid_12 omega">
	<div class="page">
		<S if $page->product == 0 S>
			<S include file="types/_static_page.tpl" S>
		<S else S>
			<S include file="types/_static_product.tpl" S>
		<S /if S>
	</div>
</div>