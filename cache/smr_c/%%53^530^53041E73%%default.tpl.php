<?php /* Smarty version 2.6.22, created on 2009-11-02 08:49:59
         compiled from layout/default.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'urlencode', 'layout/default.tpl', 28, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>...</title>

<script src="<?php echo $this->_tpl_vars['helper']->url('/javascripts/prototype.js'); ?>
" type="text/javascript" charset="utf-8"></script>
<script src="<?php echo $this->_tpl_vars['helper']->url('/javascripts/scriptaculous.js'); ?>
" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" href="<?php echo $this->_tpl_vars['helper']->url('/stylesheets/reset.css'); ?>
" type="text/css" media="screen">
<link rel="stylesheet" href="<?php echo $this->_tpl_vars['helper']->url('/stylesheets/960.css'); ?>
" type="text/css" media="screen">
<link rel="stylesheet" href="<?php echo $this->_tpl_vars['helper']->url('/stylesheets/demo.css'); ?>
" type="text/css" media="screen">

</head>

<body>
	<div class="background_body">
		<div class="bachground_contents">
			<div class="container_16">
				
				<!--Header-->
				<div class="header">
					<div style="float:left"><h1><?php echo $this->_tpl_vars['site_name']; ?>
</h1></div>
					<div style="float:right;text-align:right;">
						<div>
						<?php $_from = $this->_tpl_vars['first_containers']->menus(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fmenu']):
?>
							<a href="/menu/<?php echo $this->_tpl_vars['fmenu']->id; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['fmenu']->name)) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
"><?php echo $this->_tpl_vars['fmenu']->name; ?>
</a>
						<?php endforeach; endif; unset($_from); ?>
						</div>
						<div style="text-align:right;margin-top:14px;">
							<a href="/store">
								<?php echo $this->_tpl_vars['language']['cart_label']; ?>

									<?php echo $this->_tpl_vars['cart']->total_items(); ?>
 
								<?php echo $this->_tpl_vars['language']['items']; ?>
 =
									<?php echo $this->_tpl_vars['cart']->total(); ?>

								<?php echo $this->_tpl_vars['language']['currency']; ?>

							</a>
						</div>
					</div>
					<div class="clear"></div>
					<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "elements/flags.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
				</div>
				
				<!--Flash message-->
				<?php echo $this->_tpl_vars['flash']; ?>

				
				<!-- Content -->
				<div>
					<?php $_smarty_tpl_vars = $this->_tpl_vars;
		$this->_smarty_include(array('smarty_include_tpl_file' => "actions/homepage.tpl", 'smarty_include_vars' => array()));
		$this->_tpl_vars = $_smarty_tpl_vars;
		unset($_smarty_tpl_vars); ?>
				</div>
			</div>
		</div>
	</div>
	
<div class="clear"></div>
<!--footer-->
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['footer'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

</body>
</html>