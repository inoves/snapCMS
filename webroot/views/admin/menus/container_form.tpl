
<div class="grid_9">
	<div id="flash"></div>
	<div class="content_main">
		
		<h1><S $title_form S></h1>
		<div class="content">

			<form method="POST">
				<input type="hidden" name="id" value="<S $container_id S>" id="id">
				<p>
					<label><S $helper->checkbox('active', $active, 1) S> Active</label>
				</p>
				<p>
					<label><S $helper->checkbox('visible', $visible, 1) S> Visible</label>
				</p>
			<S foreach from=$edit_containers item=container S>
				<fieldset>
					<legend><img src="/images/flags/<S $container->lang S>.png"> <S $container->lang S></legend>
						<p>
							<label>Name</label><br/>
							<input type="text" name="container[<S $container->lang S>][name]" value="<S $container->name S>" id="name_<S $container->lang S>" class="title">
						</p>
				</fieldset>
			<S /foreach S>
			<p>
				<input type="submit" name="Save" value="Save" class="button_save" > <a href="/admin/pages/pages_list">Cancel</a> <S if $container_id  S> | <a href="/admin/menus/container_remove/<S $container_id S>" onclick="return confirm('Are you sure?')">Remove</a><S /if S>
			</p>
			</form>
		</div>
		
	</div>
</div>

<S include file="admin/elements/menu_right.tpl" S>
