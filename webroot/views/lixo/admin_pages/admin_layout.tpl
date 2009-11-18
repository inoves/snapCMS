<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>Backoficce</title>
		
		<!--Framework CSS-->
			<link rel="stylesheet" href="<S $helper->url('stylesheets/reset.css') S>" type="text/css" media="">
			<link rel="stylesheet" href="<S $helper->url('stylesheets/960.css') S>" type="text/css" media="">
			<link rel="stylesheet" href="<S $helper->url('stylesheets/base.css') S>" type="text/css" media="">
		<!--/-->
		
		<!--Framework Javascript-->
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.0.3/prototype.js"></script>
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/scriptaculous/1.8.2/scriptaculous.js?load=effects,dragdrop"></script>
			<!--script type="text/javascript" src="<S $helper->url('javascripts/prototype.js') S>"></script>
			<script type="text/javascript" src="<S $helper->url('javascripts/scriptaculous.js') S>"></script-->
			
		<!--Ligthwindows Plugin-->
			<script type="text/javascript" src="<S $helper->url('javascripts/lightwindow.js') S>"></script>
			<link rel="stylesheet" href="<S $helper->url('stylesheets/lightwindow.css') S>?<S $helper->rand() S>" type="text/css" media="">
		<!--/-->

<style>
	.header{
		background-color: #DDD;
	}
</style>
		
	</head>
	<body>
		
		<div class="container_12">
			
			<div class="grid_12 header">
				OLA
			</div>
			<div class="clear"></div>
			
			<S include file="elements/admin_logged.tpl" S>
				
		</div>
	</body>
</html>