<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>name</title>

<script type="text/javascript" src="/javascripts/prototype.js"></script>

<script>
	var session_id = 'x';

//	$('user_auth');

	

</script>


</script>


</head>

<body>
<div id="update_test"></div>
<iframe id="user_auth" src="http://www.biquinisdapraia.com/flytap_test.php" name="user_auth" title="ohhh" class="vamosla" longdesc="okkkkk"></iframe>

<br/>
<!--a href="http://bo-flytap.tap.pt/auth.php?value=steven" target="user_auth">open iframe flytap</a-->


<?php

echo "------------";

$ch = curl_init();
$timeout = 30;
$userAgent = $_SERVER['HTTP_USER_AGENT'];

curl_setopt($ch, CURLOPT_URL, 'http://biquinisdapraia.com/flytap_test.php?name=ola&value=mundo');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo curl_error($ch);
} else {
    curl_close($ch);
    echo $response;
}


?>

</body>
</html>
