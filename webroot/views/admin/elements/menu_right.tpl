
<div class="grid_3" >
		<h1>Commands</h1>
		<p>
			&raquo; <a href="/admin/pages/pages_list">List all pages</a>
		</p>
		<p>
			&raquo; <a href="/admin/pages/pages_list_home">List pages in home</a>
		</p>
		<p>
			&raquo; <a href="/admin/pages/page_new">New page</a>
		</p>
		
		
		<h1>Containers/Menus</h1>
		<p>
			&raquo; <a href="/admin/menus/containers_new">New Container</a>
		</p>
		<p>
			&raquo; <a href="/admin/menus/menu_new">New menu</a>
		</p>
		<div class="containers">
			<ul id="containers">
				<S foreach from=$containers item=container S>
					<li id="container_<S $container->id S>">
						<div class="container" id="d_container_<S $container->id S>">
							<div class="container_head" id="d_container_head_<S $container->id S>">
								<a href="/admin/menus/container_edit/<S $container->id S>"><img src="/images/pencil.png" corder="0"></a> 
								<S $container->name S>
							</div>
						</div>
			
						<div class="menus" id="d_menus_<S $container->id S>">
							<ul id="menus_<S $container->id S>">
							<S foreach from=$container->menus() item=menu S>
								<li id="menu_<S $menu->id S>">
									<div class="menu" id="d_menu_<S $menu->id S>">
										<a href="/admin/menus/menu_edit/<S $menu->id S>"><img src="/images/pencil.png" corder="0"></a> 
										<a href="/admin/pages/pages_list_menu/<S $menu->id S>"><S $menu->name S></a>
									</div>
									<S if $menu->menus() S>
										<S foreach from=$menu->menus() item=parent S>
											<div class="menu parent" id="d_menu_<S $parent->id S>">
												<a href="/admin/menus/menu_edit/<S $parent->id S>"><img src="/images/pencil.png" corder="0"></a> 
												<a href="/admin/pages/pages_list_menu/<S $parent->id S>"><S $parent->name S></a>
												<S if $parent->menus() S>
													<S foreach from=$parent->menus() item=parent_parent S>
														<div class="menu parent" id="d_menu_<S $parent_parent->id S>">
															<a href="/admin/menus/menu_edit/<S $parent_parent->id S>"><img src="/images/pencil.png" corder="0"></a> 
															<a href="/admin/pages/pages_list_menu/<S $parent_parent->id S>"><S $parent_parent->name S></a>
														</div>
													<S /foreach S>
												<S /if S>
											</div>
										<S /foreach S>
									<S /if S>
								</li>
								<S if $menu->active != 1 S>
<script>new Effect.Opacity("menu_<S $menu->id S>",{duration:0.8, from:1.0, to:0.3});</script>
								<S /if S>
							<S /foreach S>
							</ul>

<script type="text/javascript">
//<![CDATA[
Sortable.create("menus_<S $container->id S>", {onUpdate:function(){new Ajax.Updater('flash', '/admin/menus/order_menu/<S $container->id S>', {asynchronous:true, evalScripts:true, onComplete:function(request){new Effect.Highlight("menus_<S $container->id S>",{});}, parameters:Sortable.serialize("menus_<S $container->id S>")})}})
//]]>
</script>
						</div>
					</li>
				<S if $container->active != 1 S>
<script>new Effect.Opacity("container_<S $container->id S>",{duration:0.8, from:1.0, to:0.3});</script>
				<S /if S>
				<S /foreach S>
			</ul>
		</div>
<script type="text/javascript">
//<![CDATA[
Sortable.create("containers", {onUpdate:function(){new Ajax.Updater('flash', '/admin/menus/order_container/', {asynchronous:true, evalScripts:true, onComplete:function(request){new Effect.Highlight("containers",{});}, parameters:Sortable.serialize("containers")})}})
//]]>
</script>
	
	
	
		<h1>List pages for tags</h1>
		<p>
			<S foreach from=$tags item=tag S>
				<a href="/admin/pages/tag/<S $tag->id S>/<S $tag->name S>"><S $tag->name S></a>
			<S /foreach S>
	
		</p>
</div>
