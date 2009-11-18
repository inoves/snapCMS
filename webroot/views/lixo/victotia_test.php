<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>name</title>

<script>
	var session_id = '';

	function $(value){
		return document.getElementById(value);
	}
	
</script>


</head>

<body>

<iframe id="user_auth" name="user_auth" title="ohhh" class="vamosla" longdesc="okkkkk"></iframe>


<a href="teste.php" target="user_auth">open teste.php</a>
<br/>
<a href="#" onclick="alert($('user_auth').className)">alert session_is</a>


</body>
</html>
