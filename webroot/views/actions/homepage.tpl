<!--Design special for home page-->
<div class="intro">
	<!-- menu -->
	<div class="grid_4 alpha">
		<S include file="elements/menu.tpl" S>
	</div>		
	<div class="grid_12 omega">
		<S assign var='reset_cycle' value=false  S>
		<S foreach from=$pages item=page S>
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
</div>