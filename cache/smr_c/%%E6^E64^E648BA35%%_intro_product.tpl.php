<?php /* Smarty version 2.6.22, created on 2009-11-02 08:50:00
         compiled from types/_intro_product.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'types/_intro_product.tpl', 7, false),array('modifier', 'urlencode', 'types/_intro_product.tpl', 7, false),array('modifier', 'truncate', 'types/_intro_product.tpl', 8, false),array('modifier', 'strip_tags', 'types/_intro_product.tpl', 13, false),)), $this); ?>
<!--Intro-->
	<div class="background_intro_1" id="_intro<?php echo $this->_tpl_vars['page']->id; ?>
">
		<div class="background_intro_2">
			<div class="background_intro_3">
				<div class="intro_title">
					<!--h2-->
						<a href="<?php echo $this->_tpl_vars['helper']->url('/page'); ?>
/<?php echo $this->_tpl_vars['page']->id; ?>
/<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['page']->descriptions('title'))) ? $this->_run_mod_handler('replace', true, $_tmp, '/', '-') : smarty_modifier_replace($_tmp, '/', '-')))) ? $this->_run_mod_handler('replace', true, $_tmp, ' ', '_') : smarty_modifier_replace($_tmp, ' ', '_')))) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
">
							<span><?php echo ((is_array($_tmp=$this->_tpl_vars['page']->descriptions('title'))) ? $this->_run_mod_handler('truncate', true, $_tmp, 17, "...", true) : smarty_modifier_truncate($_tmp, 17, "...", true)); ?>
</span>
						</a>
				</div>
				<p>
					<?php if ($this->_tpl_vars['page']->descriptions('intro')): ?>
						<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['page']->descriptions('intro'))) ? $this->_run_mod_handler('strip_tags', true, $_tmp) : smarty_modifier_strip_tags($_tmp)))) ? $this->_run_mod_handler('truncate', true, $_tmp, 120, "...", true) : smarty_modifier_truncate($_tmp, 120, "...", true)); ?>

					<?php else: ?>
						<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['page']->descriptions('content'))) ? $this->_run_mod_handler('strip_tags', true, $_tmp) : smarty_modifier_strip_tags($_tmp)))) ? $this->_run_mod_handler('truncate', true, $_tmp, 120, "...", true) : smarty_modifier_truncate($_tmp, 120, "...", true)); ?>

					<?php endif; ?>
				</p>
				
				<div class="intro_photo">
					<img src="<?php echo $this->_tpl_vars['helper']->url_photo($this->_tpl_vars['page']->photo(0),'quad'); ?>
" class="intro_img"/>
				</div>
				
				<div class="currency">
					<?php if ($this->_tpl_vars['page']->product('show_old_price') == 1): ?>
						<span class="old_price"><?php echo $this->_tpl_vars['language']['currency']; ?>
 <?php echo $this->_tpl_vars['page']->old_price(); ?>
</span>
						<!--br/>
						<span class="discount"><?php echo $this->_tpl_vars['language']['currency']; ?>
 <?php echo $this->_tpl_vars['page']->old_price(); ?>
</span--><br/>
					<?php endif; ?>
					
					<strong><?php echo $this->_tpl_vars['language']['currency']; ?>
 <?php echo $this->_tpl_vars['page']->price(); ?>
</strong>
				</div>
				<div class="clear"></div>
				<div class="lbl_buy">
					
					<?php if ($this->_tpl_vars['page']->product('promo_flag') == 1): ?>
						<img src="<?php echo $this->_tpl_vars['helper']->url('/images/award_star_gold_2.png'); ?>
" corder="0"/>
					<?php endif; ?>
					<?php if ($this->_tpl_vars['page']->product('new_flag') == 1): ?>
						<img src="<?php echo $this->_tpl_vars['helper']->url('/images/new.png'); ?>
" corder="0"/>
					<?php endif; ?>

					<a href="<?php echo $this->_tpl_vars['helper']->url('/store/add'); ?>
/<?php echo $this->_tpl_vars['page']->id; ?>
">
						<img src="<?php echo $this->_tpl_vars['helper']->url('/images/cart.png'); ?>
" corder="0"/><?php echo $this->_tpl_vars['language']['buy']; ?>

					</a>
				</div>
			</div>
		</div>
	</div>