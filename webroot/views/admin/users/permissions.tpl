<div class="grid_9">
	<div class="content_main">
		<h1><S $title_action S></h1>
		
		<div class="content">
		<S if $group_id != '' S>
		<form action="" method="POST" accept-charset="utf-8">
			<S foreach from=$class_permissions key=controller item=permissions name="forcontroller" S>
				<h1 onclick="accordion('tab_<S $controller S>')"><S $controller S> <a href="javascript: void(0);" onclick="$$('#<S $controller S>').each(function(elm){elm.checked = true;});">All</a></h1>
				<div id="tab_<S $controller S>">
					<S foreach from=$permissions item=action S>
						<div>
							<label>
							<S $helper->checkbox("permissions[$controller::$action]", 1, $current_user->permission($controller, $action, $group_id), $controller) S> <S $action S>
							</label>
						</div>
					<S /foreach S>
				</div>
				<S if $smarty.foreach.forcontroller.index > 0 S>
					<script>$('tab_<S $controller S>').hide();</script>
				<S else S>
					<script>var init_tab = 'tab_<S $controller S>';</script>
				<S /if S>
			<S /foreach S>
			<p><input type="submit" value="Save" class="button_save"> - <a href="<S $helper->url('/admin/users/') S>">Cancel</a></p>
		</form>
		<S /if S>
		</div>
		<script>
		function accordion(elm){
			if(elm==init_tab) return false;
			Effect.BlindUp(init_tab, { duration: 0.3 });
			Effect.BlindDown(elm,{ duration: 0.4 });
			init_tab = elm;
		}
		</script>
	</div>
</div>
