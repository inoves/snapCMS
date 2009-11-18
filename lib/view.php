<?php

/**
 * TODO:doc
 */
class View extends Smarty
{
	/**
	 * TODO:doc
	 */
	public $extention_template 	= '.tpl';
	public $layout = 'layout/template';
	public $template_action;
	public $no_layout = false;
	public $_get_output = false;
	
	/**
	 * TODO:doc
	 */
	function __construct(){
		$this->Smarty();
		
		$this->post = $_POST;
		$this->cookie = $_COOKIE;
		$this->session = Session::get_all();
		$this->server = $_SERVER;
		$this->globals = $GLOBALS;
		$this->helper = new Helper();
		
	}
	
	/**
	 * Auto set variables in your view
	 */
	function __set($var, $val){
		$this->assign($var, $val);
	}
	
	/**
	 * Return variables assing in your view
	 */
	public function __get($var){
		return $this->get_template_vars($var);
	}
	
	/**
	 * TODO:doc
	 */
	public function get_content()
	{
		if(Config :: $caching == false)
			$this->clear_all_cache();
		if($this->no_layout)
			return parent::fetch(  $this->path_view_action() );
		else
			return parent::fetch(  $this->layout . $this->extention_template);
	}
	
	/**
	 * TODO:doc
	 */
	function display(){
		return $this->get_content();
	}
	
	/**
	 * TODO:doc
	 */
	public function get_output()
	{
		return $this->get_content();
	}
	
	/**
	 * TODO:doc
	 */
	function content_action(){
		$output = '$_smarty_tpl_vars = $this->_tpl_vars;
		$this->_smarty_include(array(\'smarty_include_tpl_file\' => "' . $this->path_view_action().'", \'smarty_include_vars\' => array()));
		$this->_tpl_vars = $_smarty_tpl_vars;
		unset($_smarty_tpl_vars);';
		return $output;
	}
	
	/**
	 * TODO:doc
	 */
	function path_view_action(){
		if( !isset($this->template_action )){
			$this->template_action = $GLOBALS['action'] . $this->extention_template;
		}
		if( strstr($this->template_action, $this->extention_template ) == false){
			$this->template_action = $this->template_action . $this->extention_template;
		}
		if( strstr($this->template_action, '/' ) == false){
			$this->template_action = $GLOBALS['controller'].'/'.$this->template_action;
		}
		return $this->template_action;
	}
	
}

?>