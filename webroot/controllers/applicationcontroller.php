<?php
/*
* Classe onde todos os metodos estão disponiveis para todas as classes controllers
*/
class ApplicationController // extends SnapClass
{
	
	var $before_filter = array('get_language', 'config_app');//'get_menus', 'get_current_user');
	
	function get_language(){
			if(preg_match('/^admin/', $GLOBALS['controller'])):
				$cookie_name_lang = 'language_admin';
				$value = Config::$languages[0];
			else:
				$cookie_name_lang = 'language';
 				if( substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2) && in_array(substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2), Config::$languages) ):
					$value = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2);
				else:
					$value = Config::$languages[0];
				endif;
			endif;
		if(!$_COOKIE[$cookie_name_lang]):
			$_COOKIE[$cookie_name_lang] = $value;
			setcookie($cookie_name_lang, $value, time()+2592000, '/' );
		endif;
		ActiveRecord::$lang = $_COOKIE[$cookie_name_lang];
		return $_COOKIE[$cookie_name_lang];
	}
	
	
	function config_app(){
		if(preg_match('/^admin/', $GLOBALS['controller']))
			return 0;
		
		//Cart
		if (!isset($_SESSION['cart']) || $_SESSION['cart']==null):
			$cart = new Cart();
			$_SESSION['cart'] = $cart;
		endif;
		$this->view->cart = $_SESSION['cart'];//$SESSION['cart'];
		
		$this->view->current_customer = Customer::current();
		
		$this->view->language = Labels::select( $this->get_language() );
		
		//Default footer, but you can change this in your action
		$this->view->footer = 'elements/footer_general.tpl';
		
		//container Top
		$this->view->first_containers = Container::find('first', array('order'=>'ord', "conditions"=>"active=1"));
		
		//Left containers
		$this->view->containers = Container::find("all", array("conditions"=>"active=1 AND visible=1 AND lang=" . ActiveRecord::quote(ActiveRecord::$lang) . " AND active=1", 'order'=>'ord'));
		
		$this->view->site_name = Config::$site_name;
		
	}
}
?>