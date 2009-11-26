<?php /* Smarty version 2.6.22, created on 2009-11-25 21:34:21
         compiled from actions/homepage.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'actions/homepage.tpl', 17, false),)), $this); ?>
<!--Design special for home page-->
<div class="intro">
	<!-- menu -->
	<div class="grid_4 alpha">
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "elements/menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	</div>		
	<div class="grid_12 omega">
		<?php $this->assign('reset_cycle', false); ?>
		<?php $_from = $this->_tpl_vars['pages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['page']):
?>
			<?php if ($this->_tpl_vars['page']->product == 0): ?>
				<div class="clear"></div>
				<div>
					<?php $this->assign('reset_cycle', true); ?>
					<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "types/_intro_page.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
				</div>
			<?php else: ?>
				<div class="grid_3 <?php echo smarty_function_cycle(array('values' => "alpha,,,omega",'reset' => $this->_tpl_vars['reset_cycle']), $this);?>
">
					<?php $this->assign('reset_cycle', false); ?>
					<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "types/_intro_product.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
				</div>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
	</div>
</div>