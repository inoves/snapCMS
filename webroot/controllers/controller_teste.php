<?php
class HomeController extends BaseController
{
	//Set layout of site
	#public $layout = 'layout/layout';
	public $layout = 'layout/default';
	
	
	public function index()
	{
		//select pages
		$this->view->pages = PagesDescription::query_obj('SELECT pages_descriptions.*, pages.* FROM pages_descriptions, pages WHERE pages.id=pages_descriptions.page_id AND show_home=1 AND lang='.ActiveRecord::quote($this->get_language()) . 'ORDER BY pages.order_home'  );
		$this->view->home_type = Config::$home_type;
		$this->view->template_action = 'actions/homepage.tpl';
	}
	
	
	
	public function page($value=null)
	{
		$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1;
		$this->view->page = Page::find( 'first' , array('conditions' => "active=1 AND id=" . ActiveRecord::quote($value) ));
		if (!$this->view->page ):
			$this->redirect_to('/home/not_found');
		endif;
		$this->view->template_action = $this->view->template_name;
		$this->view->footer = 'elements/footer_page.tpl';
	}
	
	
	
	public function menu($value=null, $current_page=0)
	{
		$this->view->menu = Menu::find('first', array('conditions'=>"active=1 AND lang=".ActiveRecord::quote($_COOKIE['language'])." AND id=".ActiveRecord::quote($value)));
		
		if ($this->view->menu->type_of == 'tag'):
			$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1 ;
			$tag = Page::tag($value);
			$this->view->tag = $tag;
			$aCount = ActiveRecord::query("SELECT COUNT(*) FROM pages_tags WHERE tag.id=".ActiveRecord::quote($tag->id));
			$this->view->aCount = $aCount[0]['count'];
			$this->view->pages = ActiveRecord::query_obj("SELECT pages.* FROM pages_tags, pages WHERE pages.lang=".ActiveRecord::quote($_COOKIE['language'])." AND pages_tags.page_id=pages.id AND tag.id=".ActiveRecord::quote($tag->id) . " LIMIT " . ($current_page * Config::$per_page) . ", " . Config::$per_page);
			$this->view->current_page = $current_page+1;
			$this->view->per_page = Config :: $per_page;
			//render action of
			//$this->view->template_action = 'tag';
		
		elseif ($this->view->menu->type_of == 'link'):
			$this->redirect_to($this->view->menu->value_type_of);
		else:
			if ($this->view->menu->type_of == 'static'):
				$this->view->per_page = 1;
			else:
				$this->view->per_page = Config::$per_page;
			endif;
			$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1 ;
			$aCount = Page::query("SELECT COUNT(*) as count FROM pages WHERE active=1 AND menu_id=".ActiveRecord::quote($value));
			
			$this->view->pages = Page::find('all', array('conditions' => "active=1 AND menu_id=".ActiveRecord::quote($value), 
											 'order' => 'order_menu DESC',
											 'limit' => ($current_page * $this->view->per_page) . ", " . $this->view->per_page
											)
								);
			$this->view->current_page = $current_page+1;
			$this->view->aCount = $aCount[0]['count'];
		endif;
		$this->view->link_paginator = "menu/".$value;
		$this->view->footer = 'elements/footer_page.tpl';
	}
	
	
	//Only accept method POST
	public function search($value='', $current_page=0)
	{
		$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1 ;
		
		$sql = "SELECT pd.*, p.* FROM pages as p, pages_descriptions as pd WHERE p.active=1 AND p.id=pd.page_id AND pd.lang='" . $this->get_language() . "' LIMIT " . ($current_page * Config::$per_page) . ", " . Config::$per_page ;
		$this->view->pages = PagesDescription::query_obj($sql);
		//for paginator
		$this->view->current_page = $current_page+1;
		$this->view->aCount = $aCount[0]['count'];
		$this->view->per_page = Config :: $per_page;
		$this->view->link_paginator = "search/".$value;
		$this->view->words = $value;
	}
	public function tag($value=null, $current_page=0)
	{
		$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1 ;
		$tag = Page::tag($value);
		$this->view->tag = $tag;
		$this->view->aCount = ActiveRecord::query("SELECT COUNT(*) FROM pages_tags WHERE tag.id=".ActiveRecord::quote($tag->id));
		$this->view->pages = ActiveRecord::query_obj("SELECT pages.* FROM pages_tags, pages WHERE pages.lang=".ActiveRecord::quote($this->get_language())." AND pages_tags.page_id=pages.id AND tag.id=".ActiveRecord::quote($tag->id) . " LIMIT " . ($current_page * Config :: $per_page) . ", " . Config::$per_page);
		$this->view->current_page = $current_page+1;
		$this->view->per_page = Config :: $per_page;
		$this->view->link_paginator = "tag/".$value;
	}
	
	
	public function manufacture($value=null,$current_page=0)
	{
		$current_page = (( $current_page * 1 )==0)? $current_page * 1  : ( $current_page * 1 )-1 ;
		$aCount = Page::query("SELECT COUNT(*) as count FROM pages WHERE active=1 AND manufacture_id=".ActiveRecord::quote($value)." AND lang=" . ActiveRecord::quote($this->get_language()) );
		$this->view->pages = Page::find('all', array('conditions' => "active=1 AND manufacture_id=".ActiveRecord::quote($value)." AND lang=" . ActiveRecord::quote($this->get_language() ), 
										 'order' => 'order_menu DESC',
										 'limit' => ($current_page * Config :: $per_page) . ", " . Config::$per_page
										)
							);
		$this->view->current_page = $current_page+1;
		$this->view->aCount = $aCount[0]['count'];
		$this->view->per_page = Config :: $per_page;
	}
	
	
	
	public function store($cmd="show", $id=null)
	{
		switch ($cmd){
			case 'add':
				Car::add($id);
				$this->view->flash = '<p class="sucess">'.$this->view->language['flash_add_store']."</p>";
				break;
			case 'remove':
				Car::remove($id);
				$this->view->flash = '<p class="sucess">'.$this->view->language['flash_remove_store']."</p>";
				break;
			case 'update':
				Car::update($_POST);
				$this->view->flash = '<p class="sucess">'.$this->view->language['flash_update_store']."</p>";
				break;
		}
		$this->cart = Cart::open();
	}
	
	
	
	public function login()
	{
		if ($_POST):
			if (Customer::login($_POST['username'],$_POST['password'])):
				$this->redirect_to('/account');
			else:
				$this->view->flash = '<p class="error">'.$this->view->language['msg_login_failded']."</p>";
			endif;
		else:
			$this->view->flash = '<p class="error">'.$this->view->language['msg_login_failded']."</p>";
		endif;
		$this->redirect_to('/login');
	}
	
	
	public function logout()
	{
		unset($_SESSION['customer']);
		$this->view->flash = '<p class="sucess">'.$this->view->language['msg_logout']."</p>";
		$this->redirect_to('/');
	}

	
	public function not_found()
	{
		//only view template...
	}
	
	
//+ + + + + + + + + + + + + + + + + + + + + + + + + +
	protected function before_filter()
	{
		$this->view->language = Labels::select( $this->get_language() );
		$this->view->footer = 'elements/footer_general.tpl';
		$this->containers();
	}
	
	private function containers()
	{
		$this->view->containers = Container::actives();
	}
	
	function set_language($lang){
		if ($value && in_array($value, Config::$languages)):
			setcookie('language', $value, time()+2592000, '/');
			$_COOKIE['language'] = $value;
		endif;
	}
}