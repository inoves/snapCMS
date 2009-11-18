<div class="grid_9">
	<div class="content_main">
		<h1><S $title_action S></h1>
		
		<div class="content">
			<S foreach from=$users item=user S>
				<div class="page" id="page_<S $user->id S>">
					<h4><a href="<S $helper->url('/admin/users/edit/') S><S $user->id S>"><S $user->name S></a></h4>
						<a href="<S $helper->url('/admin/users/edit/') S><S $user->id S>">Edit</a>
						<a href="<S $helper->url('/admin/users/remove/') S><S $user->id S>" onclick="return confirm('Are you sure?');">Remove</a> 
				</div>
			<S /foreach S>
		</div>
			
	</div>
</div>

<div class="grid_3" >
	
	<div><a href="<S $helper->url('/admin/users/new_user') S>">New user</a></div>
	<div><a href="<S $helper->url('/admin/users/permissions') S>">Permissions</a></div>
</div>