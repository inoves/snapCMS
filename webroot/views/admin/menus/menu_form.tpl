<form method="POST">
<div class="grid_9">
	<div id="flash"></div>
	<div class="content_main">
		
		<h1><S $title_form S></h1>
		<div class="content">
			
			<input type="hidden" name="menu_id" value="<S $menu->idS>" id="menu_id">
			<S foreach from=$menus item=menu S>
				<fieldset>
					<legend><img src="/images/flags/<S $menu->lang S>.png"> <S $menu->lang S></legend>
						<p>
							<label>Name</label><br/>
							<input type="text" name="menu[<S $menu->lang S>][name]" value="<S $menu->name S>" id="name_<S $menu->lang S>" class="title">
						</p>
				</fieldset>
			<S /foreach S>
			<p>
				<input type="submit" name="Save" value="Save" class="button_save" > <a href="/admin/pages/pages_list">Cancel</a> <S if $menu->id  S> | <a href="/admin/menus/menu_remove/<S $menu->id S>" onclick="return confirm('Are you sure?')">Remove</a><S /if S>
			</p>
			
		</div>
		
	</div>
</div>
<div class="grid_3">
	<h1>Menu Attributes</h1>
	<p>
		<label><S $helper->checkbox('active', $menu->active, 1) S> Active</label>
	</p>
	<p>
		<label>Menu type</label><br/>
		<select name="typeof" style="width:180px;" class="text">
			<S foreach from=$types item=type_of key=label S>
				<S $helper->select_option($label, $type_of, $menu->typeof) S>
			<S /foreach S>
		</select>
		<input type="text" name="value_typeof" value="<S $menu->value_typeof S>" id="value_typeof" class="text">
	</p>
	<p>
		<label>Container</label><br/>
		<select name="container_id" style="width:180px;">
			<S foreach from=$containers item=container S>
				<S $helper->select_option($container->name, $container->id, $menu->container_id) S>
			<S /foreach S>
		</select>
	</p>
	<p>
		
<!--BEGIN SELECT-->
		<label>Parent menu</label><br/>
		<select name="parent_id" style="width:180px;">
			<S $helper->select_option('', 0, $menu->parent_id) S>
			<S foreach from=$containers item=container S>
				<option disabled="disabled"><strong><S $container->name S></strong></option>
				<S foreach from=$container->menus() item=fmenu S>
					<S $helper->select_option($fmenu->name, $fmenu->id, $menu->parent_id , " - ") S>
						<S if $fmenu->menus() S>
							<S foreach from=$fmenu->menus() item=parent S>
								<option<S if $menu->id == $parent->id  S> disabled="disabled"<S /if S><S if $menu->parent_id == $parent->id  S> selected="selected" <S /if S> value="<S $parent->id S>"> |-- <S $parent->name S></option>
									<S if $parent->menus() S>
										<S foreach from=$parent->menus() item=parent_parent S>
											<option<S if $menu->id == $parent_parent->id  S> disabled="disabled"<S /if S><S if $menu->parent_id == $parent_parent->id  S> selected="selected" <S /if S> value="<S $parent_parent->id S>"> |--- <S $parent_parent->name S></option>
										<S /foreach S>
									<S /if S>
							<S /foreach S>
						<S /if S>	
				<S /foreach S>
			<S /foreach S>
		</select>
<!--END SELECT-->
	</p>
</div>
</form>
