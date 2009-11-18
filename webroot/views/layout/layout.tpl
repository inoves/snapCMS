<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Oh! Store Snap DEMO</title>

<script src="<S $helper->url('/javascripts/prototype.js') S>" type="text/javascript" charset="utf-8"></script>
<script src="<S $helper->url('/javascripts/scriptaculous.js') S>" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
	function loginarea(cmd){if(cmd ==0){Effect.toggle('cmdloginarea0', 'slide');Effect.toggle('cmdloginarea1', 'slide');}else{Effect.toggle('cmdloginarea1', 'slide');Effect.toggle('cmdloginarea0', 'slide');}}
</script>

<link rel="stylesheet" href="<S $helper->url('/stylesheets/reset.css') S>" type="text/css" media="">
<link rel="stylesheet" href="<S $helper->url('/stylesheets/960.css') S>" type="text/css" media="">
<style type="text/css">
<!--
body {
	background-image: url(<S $helper->url('/stylesheets/grid.png')S>);
	background-image: url(<S $helper->url('/compose_img/fnd_surfihstore.jpg')S>);
	font:13px/1.5 Helvetica,Arial,'Liberation Sans',FreeSans,sans-serif
}
.main{
	background-image: url(<S $helper->url('/compose_img/fnd.png')S>);
	background-repeat: repeat-x;
}
.backgroungmain{
	background-image: url(<S $helper->url('/compose_img/fnd_topo.gif')S>);
	background-repeat: repeat-x;
}
a:focus{outline:1px dotted #ccc}
h1{font-size:25px}h2{font-size:23px}h3{font-size:21px}h4{font-size:19px}h5{font-size:17px}h6{font-size:15px}
ol{list-style:decimal}ul{list-style:square}li{margin-left:30px}
p,dl,hr,h1,h2,h3,h4,h5,h6,ol,ul,pre,table,address,fieldset{margin-bottom:20px}
#loginarea {
	background-image: url(<S $helper->url('/compose_img/fnd_loginarea.png') S>);
	background-repeat: no-repeat;
	background-position: center bottom;
	width: 217px;
	text-align: center;
	font-size: 9px;
	color: #000;
	float: right;
	position: absolute;
	
}
#pesquisa {
	background-image: url(<S $helper->url('/compose_img/fnd_pesqarea.png')S>);
	float: right;
	background-repeat: no-repeat;
	height: 81px;
	width: 233px;
	margin-top: 50px;
}
#frm_pesquisa {
	margin-top: 25px;
	margin-left: 35px;
}
#fnd_campo_pesq {
	float: left;
	background-image: url(<S $helper->url('/compose_img/fnd_pesqcampo.png')S>);
	background-repeat: no-repeat;
	height: 25px;
	width: 160px;
}
#campopesquisa {
	height: 18px;
	width: 135px;
	margin-left: 12px;
	margin-top: 4px;
	font-size: 11px;
	color: #666666;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
	padding: 0px;
}
#bntpesquisa {
	margin-top: 5px;
	margin-left: 3px;
}
#loginarea {
	background-image: url(<S $helper->url('/compose_img/fnd_loginarea.png')S>);
	background-repeat: no-repeat;
	background-position: center bottom;
	width: 217px;
	text-align: center;
	font-size: 9px;
	color: #FFFFFF;
	float: right;
	position: absolute;
	
}
#frmloginarea {
	padding-bottom: 2px;
	text-align: center;
}
.inp{
	width: 90px;
	border: 1px dotted #999999;
}
#areacart {
	background-image: url(<S $helper->url('/compose_img/fnd_cart.png')S>);
	height: 72px;
	width: 235px;
	background-repeat: no-repeat;
}

#cmdloginarea {
	font-size: 9px;
	color: #FFFFFF;
	text-align: center;
	padding: 7px;
}
#alert_browser{
	position:absolute;
	background-color: #FDFDED;
	border-bottom : solid 2px #D3CA82;
	padding:7px;
	width:100%;
	z-index:1;
	display:none;
}
#footer{
	background-color: #000;
}

/* + + + + + + + + + + + + + + + +
Intro products CSS
*/
.background_intro_1{background: url(<S $helper->url('/compose_img/fnd_ls_img.gif') S>) no-repeat scroll left top; margin-bottom:12px;;}
.background_intro_2{background: url(<S $helper->url('/compose_img/fnd_mdl_img.png') S>) no-repeat scroll left top;}
.background_intro_3{background: url(<S $helper->url('/compose_img/fnd_mdl_img.png') S>) no-repeat scroll right top;}
.intro_title{
	background: url(<S $helper->url('/compose_img/fnd_titulo.png') S>) no-repeat scroll right top;
	}
.intro_title p a span{ background-color: #1A1A1A;}
.intro_title p{ 
	text-align:right; 
	padding-top:18px;
	padding-right:12px;
	margin-bottom:3px;
}
.intro_img{ border:#1A1A1A 20px solid;float:left;}
.intro_title p a{
	font-size:18px; 
	color:#fff;
}
/* + + + + + + + + + + + + + + + + */
-->
</style>

</head>

<body>
<div id="alert_browser">
	Seu browser n&atilde;o suporta muitos recursos que este site oferece. De prefer&ecirc;ncia para browser mais modernos.
</div>

<div style="height:5px; background-color:#000000;">
</div>
<div class="main">
<div class="backgroungmain">
	<!--Header-->
	<div class="container_12">

			<div class="grid_9 alpha" >
				<div class="grid_3 alpha">
						<div class="bckgrd_logo">
							<a href="<S$helper->url('')S>"><img src="<S$helper->url('/compose_img/SURFIHstore.png')S>" width="259" height="140" alt="SURFIHstore" border="0"/><a>
							<!--img src="/compose_img/surfih.png" width="192" height="135" alt="Surfih"-->
						</div>
				</div>
				<div class="grid_6 omega">
						<img border="0" usemap="#Map" alt="Menu topo" src="<S$helper->url('/compose_img/menu.png')S>"/>
						<map name="Map">
						<area href="/page/61?title=Quem Somos" coords="2,88,148,74,139,51,5,67" shape="poly"/>
						<area href="/page/62?title=Como Comprar" coords="152,53,318,34,322,57,156,75" shape="poly"/>
						<area href="http://surfih.com/tags/show/teamsurfih" coords="124,106,55,107,53,87,122,84" shape="poly"/>
						<area href="/manufactures" coords="147,84,148,106,249,102,245,77" shape="poly"/>
						<area href="/tags" coords="263,76,262,100,329,97,324,71" shape="poly"/>
						</map>
				</div>
			</div>
		
			<div class="grid_3 omega">
			
				<!--Loginarea absolute -->
				<div id="loginarea">
					<S if !$currentacount S>
						<div id="cmdloginarea0" style="display:none;margin-left:20px;margin-bottom:3px;" aling="center">
							<form id="_frmloginarea" method="post" action="/login">
								<img src="<S $helper->url('/compose_img/login.png')S>" alt="Login Area"/>
								<table width="170" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>Utilizador:</td>
										<td><input name="login" type="text" maxlength="50" class="inp"/></td>
										<td rowspan="2"><p><input type="image" name="imageField" src="<S $helper->url('/compose_img/bntlogin.png')S>" /></p></td>
									</tr>
									<tr>
										<td>Password</td>
										<td><input name="password" type="password" maxlength="50" class="inp"/></td>
									</tr>
									<tr>
										<td height="22" colspan="3" align="center"><a href="/account/signup" style="color:#FFFFFF">Novo Utilizador</a> | <a href="#" style="color:#FFFFFF" onclick="loginarea(1)">Cancelar</a></td>
									</tr>
								</table>
							</form>
						</div>
						<div id="cmdloginarea1" style="height:20px; margin-top:3px;">
							<a href="#" onclick="loginarea(0)" style="color:#FFFFFF;">Login</a> | 
							<a href="/account/signup" style="color:#FFFFFF;" title="Criar uma conta de utilizador">Criar Conta</a>
							<S include file="elements/flags.tpl" S>
						</div>
					<S else S>
						<div id="cmdloginarea2" style="height:22px;">
							<a href="/account" style="color:#FFFFFF;">Olá, Nome</a> - <a href="/account/logout" style="color:#FFFFFF;" title="Logout">Logout</a>
						</div>
					<S /if S>
				</div>
			
			
			
				<!--Fim Loginarea absolute -->
				<div id="pesquisa">
					<form id="frm_pesquisa" action="/search" method="get">
						<div id="fnd_campo_pesq">
						<input name="worlds" type="text" id="campopesquisa" value="Pesquisar" onfocus="if($F('campopesquisa')=='Pesquisar') $('campopesquisa').value='';" onblur="if($F('campopesquisa')=='') $('campopesquisa').value='Pesquisar';"/>
						</div>
						<input type="image" id="bntpesquisa" src="<S $helper->url('/compose_img/pesqbotao.png')S>" alt="Executar pesquisa"/>
					</form>
				</div>
			</div>
		<div class="clear"></div>
		<!--end header-->
	
	
		<!--message flash-->
		<div id="flags"><S $flash S></div>
	
	</div>


	<!--Content of admin-->
	<div class="content"><S content_action S></div>	
	<div class="clear"></div>

	
	

	<div style="background-color:#000;" id="footer">
		<div class="container_12">
	
			<div class="grid_6">
						Copyright 2009 surfih.com - inov.es<br/>
						Hosting inov.es<br/>
						Powered by Linux/Apache2/Mysql/PHP/Perl
			</div>
		
			<div class="grid_3">
				<label>Nome:<span style="font-size:9px;">(Obrigatório)</span></label><br/>
				<input type="text" name="nome" value="" id="nome" class="inp_mens"/><br/>
				<label>E-mail:<span style="font-size:9px;">(Obrigatório)</span></label><br/>
				<input type="text" name="email" value="" id="email" class="inp_mens"/><br/>
				<label>Assunto:<span style="font-size:9px;">(Obrigatório)</span></label><br/>
				<input type="text" name="assunto" value="" id="assunto" class="inp_mens"/><br/>
				Enviar
			</div>
			<div class="grid_3">
				<label>Mensagem:<span style="font-size:9px;">(Obrigatório)</span></label><br/>
				<textarea name="mensagem"></textarea>
			</div>
	
		</div>
	</div>
	
</div>
</div>

</body>
</html>