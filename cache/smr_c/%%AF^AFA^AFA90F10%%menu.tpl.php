<?php /* Smarty version 2.6.22, created on 2009-11-25 21:34:21
         compiled from elements/menu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'elements/menu.tpl', 11, false),array('modifier', 'escape', 'elements/menu.tpl', 11, false),)), $this); ?>
<!--Menu-->
<div class="container_menus">
<?php $_from = $this->_tpl_vars['containers']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['container']):
?>
	<div id="container_<?php echo $this->_tpl_vars['container']->id; ?>
" class="container">

		<div class="container_name"><?php echo $this->_tpl_vars['container']->name; ?>
</div>

		<?php $_from = $this->_tpl_vars['container']->menus_active(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['menu']):
?>
			<div class="menu_of_container">
				<div class="menu" id="menu_<?php echo $this->_tpl_vars['menu']->id; ?>
">
					<a href="/menu/<?php echo $this->_tpl_vars['menu']->id; ?>
/<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['menu']->name)) ? $this->_run_mod_handler('replace', true, $_tmp, '/', '-') : smarty_modifier_replace($_tmp, '/', '-')))) ? $this->_run_mod_handler('replace', true, $_tmp, ' ', '_') : smarty_modifier_replace($_tmp, ' ', '_')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'urlpathinfo') : smarty_modifier_escape($_tmp, 'urlpathinfo')); ?>
"><?php echo $this->_tpl_vars['menu']->name; ?>
</a>
				</div>
					<?php $_from = $this->_tpl_vars['menu']->menus_actives(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['parent']):
?>
						<div class="parent menu" id="parent_<?php echo $this->_tpl_vars['parent']->id; ?>
">
							<a href="/menu/<?php echo $this->_tpl_vars['parent']->id; ?>
/<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['parent']->name)) ? $this->_run_mod_handler('replace', true, $_tmp, '/', '-') : smarty_modifier_replace($_tmp, '/', '-')))) ? $this->_run_mod_handler('replace', true, $_tmp, ' ', '_') : smarty_modifier_replace($_tmp, ' ', '_')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'urlpathinfo') : smarty_modifier_escape($_tmp, 'urlpathinfo')); ?>
"><?php echo $this->_tpl_vars['parent']->name; ?>
</a>
						</div>
								<?php $_from = $this->_tpl_vars['parent']->menus_actives(); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['parent_parent']):
?>
									<div class="parent menu" id="parent_parent_<?php echo $this->_tpl_vars['parent_parent']->id; ?>
">
										<a href="/menu/<?php echo $this->_tpl_vars['parent_parent']->id; ?>
/<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['parent_parent']->name)) ? $this->_run_mod_handler('replace', true, $_tmp, '/', '-') : smarty_modifier_replace($_tmp, '/', '-')))) ? $this->_run_mod_handler('replace', true, $_tmp, ' ', '_') : smarty_modifier_replace($_tmp, ' ', '_')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'urlpathinfo') : smarty_modifier_escape($_tmp, 'urlpathinfo')); ?>
"><?php echo $this->_tpl_vars['parent_parent']->name; ?>
</a>

									</div>
								<?php endforeach; endif; unset($_from); ?>
					<?php endforeach; endif; unset($_from); ?>
			</div>
		<?php endforeach; endif; unset($_from); ?>
	</div>
<?php endforeach; endif; unset($_from); ?>
</div>