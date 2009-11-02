<?php /* Smarty version 2.6.22, created on 2009-11-02 08:50:00
         compiled from elements/footer_general.tpl */ ?>
<div class="footer">
	<div class="container_12">
		<form action="" method="post" accept-charset="utf-8">
			<div class="grid_6">
						Copyright 2009 surfih.com - inov.es<br/>
						Hosting inov.es<br/>
						Powered by Linux/Apache2/Mysql/PHP/Perl
			</div>
			
			<div class="grid_3">
				<p><?php echo $this->_tpl_vars['language']['contact']; ?>
:</p>
				<label><?php echo $this->_tpl_vars['language']['your_name']; ?>
:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="nome" value="" id="nome" class="inp_mens"/><br/>
				<label><?php echo $this->_tpl_vars['language']['your_email']; ?>
:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="nome_amigo" value="" id="nome_amigo" class="inp_mens"/><br/>
				<label><?php echo $this->_tpl_vars['language']['subject']; ?>
:<span style="font-size:9px;">(*)</span></label><br/>
				<input type="text" name="e-amigo" value="" id="e-amigo" class="inp_mens"/><br/>
				<?php echo $this->_tpl_vars['language']['send']; ?>

			</div>
			<div class="grid_3">
				<label><?php echo $this->_tpl_vars['language']['message']; ?>
:</label><br/>
				<textarea name="mensagem" class="mensagem"></textarea>
			</div>
		</form>
	</div>
	<div class="clear"></div>
</div>