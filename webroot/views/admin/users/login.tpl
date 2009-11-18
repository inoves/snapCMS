<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<S include file="admin/elements/header.tpl" S>

<body>
	<div id="flash">
		<!--message flash-->
		<S $flash S>
	</div>
<form action="" class="form_login" method="post">
	<label>Usename</label><br/>
	<input type="text" name="username" value="" id="username" class="title"><br/>
	
	<label>Password</label><br/>
	<input type="password" name="password" value="" id="password" class="title"><br/>
	
	<input type="submit" name="submit" value="Login" id="submit" class="button_save">
</form>

</body>
</html>