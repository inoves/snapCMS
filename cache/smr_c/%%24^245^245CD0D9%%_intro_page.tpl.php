<?php /* Smarty version 2.6.22, created on 2009-11-02 08:50:00
         compiled from types/_intro_page.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'types/_intro_page.tpl', 4, false),array('modifier', 'urlencode', 'types/_intro_page.tpl', 4, false),array('modifier', 'nl2br', 'types/_intro_page.tpl', 8, false),array('modifier', 'truncate', 'types/_intro_page.tpl', 10, false),)), $this); ?>
<!--Intro-->
<div class="intro_page">
	<h2>
		<a href="<?php echo $this->_tpl_vars['helper']->url('/page'); ?>
/<?php echo $this->_tpl_vars['page']->id; ?>
/<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['page']->descriptions('title'))) ? $this->_run_mod_handler('replace', true, $_tmp, '/', '-') : smarty_modifier_replace($_tmp, '/', '-')))) ? $this->_run_mod_handler('replace', true, $_tmp, ' ', '_') : smarty_modifier_replace($_tmp, ' ', '_')))) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
"><?php echo $this->_tpl_vars['page']->descriptions('title'); ?>
</a>
	</h2>
	<div>
		<?php if ($this->_tpl_vars['page']->descriptions('intro')): ?>
			<?php echo ((is_array($_tmp=$this->_tpl_vars['page']->descriptions('intro'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>

		<?php else: ?>
			<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['page']->descriptions('content'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)))) ? $this->_run_mod_handler('truncate', true, $_tmp, 500, "...", true) : smarty_modifier_truncate($_tmp, 500, "...", true)); ?>

		<?php endif; ?>
	</div>
</div>