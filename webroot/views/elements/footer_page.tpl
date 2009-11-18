<div class="footer">
	<div class="container_12">
		<form action="" method="post" accept-charset="utf-8">
			<div class="grid_6">
						Copyright 2009 surfih.com - inov.es<br/>
						Hosting inov.es<br/>
						Powered by Linux/Apache2/Mysql/PHP/Perl
			</div>
			
			<div class="grid_3">
				<p><S $language.send_friend S>:</p>
				<label><S $language.your_name S>:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="nome" value="" id="nome" class="inp_mens"/><br/>
				<label><S $language.your_name S>:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="nome_amigo" value="" id="nome_amigo" class="inp_mens"/><br/>
				<label><S $language.email_friend S>:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="e-amigo" value="" id="e-amigo" class="inp_mens"/><br/>
				<S $language.send S>
			</div>
			<div class="grid_3">
				<label><S $language.message S>:</label><br/>
				<textarea name="mensagem" class="mensagem"></textarea><br/>
				<label>Captcha:</label><br/>
				<img href="http://services.sapo.pt/Captcha/Show?id=<S $xml->id S>">
				<input type="text" name="captcha" value=""/>
			</div>
		</form>
	</div>
	<div class="clear"></div>
</div>