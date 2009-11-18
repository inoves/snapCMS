<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>...</title>

<script src="<S $helper->url('/javascripts/prototype.js') S>" type="text/javascript" charset="utf-8"></script>
<script src="<S $helper->url('/javascripts/scriptaculous.js') S>" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" href="<S $helper->url('/stylesheets/reset.css') S>" type="text/css" media="screen">
<link rel="stylesheet" href="<S $helper->url('/stylesheets/960.css') S>" type="text/css" media="screen">
<link rel="stylesheet" href="<S $helper->url('/stylesheets/demo.css') S>" type="text/css" media="screen">

</head>

<body>
	<div class="background_body">
		<div class="bachground_contents">
			<div class="container_16">
				
				<!--Header-->
				<div class="header">
					<div style="float:left"><h1><S $site_name S></h1></div>
					<div style="float:right;text-align:right;">
						<div>
							<!--top menu-->
							<S if $first_containers S>
							<S foreach from=$first_containers->menus() item=fmenu S>
								<a href="/menu/<S $fmenu->id S>/<S $fmenu->name|urlencode  S>"><S $fmenu->name S></a>
							<S /foreach S>
							<S /if S>
							<!--end top menu -->
						</div>
						<div style="text-align:right;margin-top:14px;">
							<a href="/store">
								<S $language.cart_label S>
									<S $cart->total_items() S> 
								<S $language.items S> =
									<S $cart->total() S>
								<S $language.currency S>
							</a>
						</div>
					</div>
					<div class="clear"></div>
					<S include file="elements/flags.tpl" S>
				</div>
				
				<!--Flash message-->
				<S $flash S>
				
				<!-- Content -->
				<div>
					<S content_action S>
				</div>
			</div>
		</div>
	</div>
	
<div class="clear"></div>
<!--footer-->
<S include file=$footer S>

</body>
</html>