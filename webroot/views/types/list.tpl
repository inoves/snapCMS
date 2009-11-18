<div class="intro">
	<!-- menu -->
	<div class="grid_4 alpha">
		<S include file="elements/menu.tpl" S>
	</div>		
	<div class="grid_12 omega">
		<div class="lbl"><S $breadcrumb S></div>
			<S foreach from=$pages item=page S>
					<S include file="home/_list.tpl" S>
				<S /if S>
			<S /foreach S>
	</div>
	<div>
		<S $helper->paginator($current_page, $aCount, $per_page, $link_paginator, 7, $language.previous, $language.next) S>
	</div>
</div>