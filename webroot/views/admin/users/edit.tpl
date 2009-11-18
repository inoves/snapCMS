<div class="grid_9">
	<div class="content_main">
		<h1><S $title_action S></h1>
		
		<div class="content">
			<form action="" method="POST" accept-charset="utf-8">
					
					<p>
					<label for="name">Name</label><br/>
					<input type="text" name="user[name]" value="<S $user->name S>" id="name" class="title"/>
					</p>
					
					<p>
					<label for="username">Username</label><br/>
					<input type="text" name="user[username]" value="<S $user->username S>" id="username" class="title"/>
					</p>
					<p>
					<label for="group">Group</label><br/>
					
					<select name="user[group_id]" id="user_group" class="title" onchange="if($F(this)=='new') $('usergroup_name').show(); else $('usergroup_name').hide();">
						<S foreach from=$groups item=group S>
							<S $helper->select_option($group->name, $group->id, $user->group_id) S>
						<S /foreach S>
						<S $helper->select_option('New Group', 'new', '') S>
					</select>
						<input type="text" name="group_name" value="" id="usergroup_name">
<script>
	if($F('user_group')=='new') 
		$('usergroup_name').show();
	else
		$('usergroup_name').hide();
</script>
					</p>
					<p><label for="password">Set password</label><br/>
					<input type="password" name="user[new_password]" value="<S $user->new_password S>" id="new_password" class="title"/>
					</p>
					
					<p>
						<input type="submit" name="Save" value="Save" class="button_save" /> - 
						<a href="<S $helper->url('/admin/users') S>">Back</a>
					</p>
					
			</form>
			
		</div>
			
	</div>
</div>