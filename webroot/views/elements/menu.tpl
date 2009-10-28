<!--Menu-->
<div class="container_menus">
<S foreach from=$containers item=container S>
	<div id="container_<S $container->id S>" class="container">

		<div class="container_name"><S $container->name S></div>

		<S foreach from=$container->menus_active() item=menu S>
			<div class="menu_of_container">
				<div class="menu" id="menu_<S $menu->id S>">
					<a href="/menu/<S $menu->id S>/<S $menu->name|replace:'/':'-'|replace:' ':'_'|escape:'urlpathinfo'  S>"><S $menu->name S></a>
				</div>
					<S foreach from=$menu->menus_actives() item=parent S>
						<div class="parent menu" id="parent_<S $parent->id S>">
							<a href="/menu/<S $parent->id S>/<S $parent->name|replace:'/':'-'|replace:' ':'_'|escape:'urlpathinfo'  S>"><S $parent->name S></a>
						</div>
								<S foreach from=$parent->menus_actives() item=parent_parent S>
									<div class="parent menu" id="parent_parent_<S $parent_parent->id S>">
										<a href="/menu/<S $parent_parent->id S>/<S $parent_parent->name|replace:'/':'-'|replace:' ':'_'|escape:'urlpathinfo'  S>"><S $parent_parent->name S></a>

									</div>
								<S /foreach S>
					<S /foreach S>
			</div>
		<S /foreach S>
	</div>
<S /foreach S>
</div>