<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<S include file="admin/elements/header.tpl" S>


<body>
<div class="header">
	<div class="container_16">
		<!--div class="text_header"-->
		<div class="grid_8 text_header">
			  <h1><S $config_site_name S></h1>
		</div>
		<div class="grid_8 links_header">
			View site - Settings - <S $current_user->name S> - <S $helper->link_to('Logout', '/admin/users/logout') S>
		</div>
		<div class="clear"></div>
		
		<S include file="admin/elements/_menu_top.tpl" S>
	
	</div>
</div>


<div class="container_12 main">
	
	<div id="flash">
		<!--message flash-->
		<S $flash S>
	</div>
	<div class="clear"></div>
	
	
	<!--Content of admin-->
	<S content_action S>

</div>

</body>
</html>
