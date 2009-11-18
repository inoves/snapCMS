<div>
	<div class="grid_9">
		<div id="flash"></div>
		<div class="content_main">
		
			<h1>Containers/Menus</h1>
			<div class="content">
			
				<div class="containers">
					<ul id="containers">
						<S foreach from=$containers item=container S>
							<li id="container_<S $container->id S>">
								<div class="container" id="d_container_<S $container->id S>">
									<div class="container_head" id="d_container_head_<S $container->id S>">
										<S $container->name S>
									</div>
								</div>
				
								<div class="menus" id="d_menus_<S $container->id S>">
									<ul id="menus_<S $container->id S>">
									<S foreach from=$container->menus() item=menu S>
										<li id="menu_<S $menu->id S>">
										<div class="menu" id="d_menu_<S $menu->id S>">
											<S $menu->name S>
										</div>
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
			
			</div>
		
		</div>
		</div>
	
<S include file="admin/elements/menu_right.tpl" S>
	
</div>

