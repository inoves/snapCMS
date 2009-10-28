<?php
class HomeController extends BaseController
{
	
	//Usage default template in baseconttroller public $layout = 'layout/default';
	
	
	/**
	* Action index use template homepage.tpl that include template file defined in Config::$home_type
	* 
	*/
	public function index(){
		$this->view->template_action = 'actions/homepage.tpl';
		//select pages
		$this->view->pages = Page::find('all', array('conditions'=>'show_home=1 AND active=1', 'order'=>'order_home'));
		$this->view->home_type = Config::$home_type;
	}
	
	
	/**
	* change language of site
	*/
	function lang($value){
		if ($value && in_array($value, Config::$languages)):
			setcookie('language', $value, time()+2592000, '/');
			$_COOKIE['language'] = $value;
		endif;
		$this->redirect_to('/');
	}
	
	/**
	* Show details from page
	*/
	function page($id=null, $name=null){
		$this->view->template_action = 'actions/page.tpl';
		$this->view->footer = 'elements/footer_page.tpl';
		
		$this->view->page = Page::find($id);
		if (!$this->view->page)
		throw new Exception('Not found', self::NOT_FOUNT);
			//$this->redirect_to('/not_fount_');
			
		$this->view->similar = $this->view->page->similar();
	}
	
	
	/**
	* Show pages/products from menu
	*/
	function menu($id=null, $menu='', $current_page=0){
		$this->view->menu = Menu::find_lang_by_id( (int)$id );
		if (!$this->view->menu):
			throw new Exception('Not found', self::NOT_FOUNT);
		endif;
		$current_page = ((int)$current_page==0)? (int)$current_page : (int)$current_page-1 ;
		
		if ($this->view->menu->typeof == 'tag'):
			$this->tag($this->view->menu->value_typeof);
			$this->view->breadcrumb = 'Menu: ' . $this->view->menu->name;
			//TODO: Remove comment
			/*$tag = Tag::find('first', array('conditions'=>'name='.ActiveRecord::quote($this->view->menu->value_typeof)));//get tag obj
			$this->view->tag = $tag; //assing
			$this->view->pages = array_slice($tag->pages, ($current_page * Config::$per_page), (($current_page * Config::$per_page) + Config::$per_page) );
			$this->view->current_page = $current_page+1; //assing current_page
			$this->view->per_page = Config::$per_page; //Assing per page
			$this->view->template_action = 'types/intro'; //Change template_action
			$aCount[0]['count'] = count($this->view->pages);
			$this->view->breadcrumb = 'Tag: ' . $this->view->menu->name;*/
		elseif ($this->view->menu->typeof == 'link'):
			$this->redirect_to($this->view->menu->value_typeof);
		else:
			if (strstr($this->view->menu->typeof, 'static')):
				$this->view->per_page = 1;//Change one per page case for static menu type
			else:
				$this->view->per_page = Config::$per_page;
			endif;
			$aCount = Page::query("SELECT COUNT(*) as count FROM pages WHERE active=1 AND menu_id=".ActiveRecord::quote($id));
			
			$this->view->pages = Page::find('all', array('conditions' => "active=1 AND menu_id=".ActiveRecord::quote($id), 
											 'order' => 'order_menu',
											 'limit' => ($current_page * $this->view->per_page) . ", " . $this->view->per_page
											)
								);
			$this->view->breadcrumb = $this->view->menu->name;
			$this->view->current_page = $current_page+1;
			$this->view->template_action = 'actions/menu.tpl';//or
			//$this->view->template_action = $this->view->menu->typeof;
			
		endif;
		
		$this->view->aCount = $aCount[0]['count'];
		$this->view->link_paginator = "/menu/".$id."/".$this->view->menu->name;
		//$this->view->footer = 'elements/footer_page.tpl';
		
	}
	
	
	/**
	*
	*
	*/
	function tag($name, $current_page=0){
		$current_page = ((int)$current_page==0)? (int)$current_page : (int)$current_page-1 ;
		$this->view->tag = Tag::find('first', array('conditions'=>"name=".ActiveRecord::quote($name)));//get tag obj
		$aCount = ActiveRecord::query("SELECT COUNT(*) as aCount FROM pages_tags, tags WHERE tags.id=pages_tags.tag_id AND tags.id=".ActiveRecord::quote($this->view->tag->id));//Count pages in tag
		//Select pages
		$sql = "SELECT pages.* FROM pages INNER JOIN pages_tags ON pages.id= pages_tags.page_id WHERE pages_tags.tag_id=".$this->view->tag->id." order by pages.product DESC";
		$rows = ActiveRecord::query($sql);
		$pages = array();
		foreach($rows as $row){
			$pages[] = new Page($row, false);
		}
		$this->view->pages = $pages;
		$this->view->breadcrumb = 'Tag: ' . strip_tags($name);
		$this->view->current_page = $current_page+1; //assing current_page
		$this->view->per_page = Config::$per_page; //Assing per page
		$this->view->template_action = 'types/intro'; //Change template_action
	}
	
	
	function manufacture($id=0, $name='', $current_page=0){
		$current_page = ((int)$current_page==0)? (int)$current_page : (int)$current_page-1 ;
		$aCount = ActiveRecord::query("SELECT COUNT(*) as aCount FROM pages_products WHERE manufacture_id=".ActiveRecord::quote($id));
		$manufacture = Manufacture::find($id);
		//$this->view->pages_products = $manufacture->pages_product;
		$this->view->pages_products = PagesProduct::find('all', array('conditions'=>'manufacture_id='.ActiveRecord::quote($id), 'order'=>'order_manufacture'));
		
		$this->view->aCount = $aCount[0]['aCount'];
		$this->view->breadcrumb = strip_tags($name);
		$this->view->current_page = $current_page+1;
		$this->view->per_page = Config::$per_page;
		$this->view->template_action = 'actions/manufacture';
	}
	
	
	/**
	 * 
	 */
	public function login(){
		if ($_POST):
			if (Customer::login($_POST['username'],$_POST['password'])):
				$this->redirect_to('/account');
			else:
				$this->view->flash = '<p class="error">'.$this->view->language['msg_login_failded']."</p>";
			endif;
		endif;
	}
	
	/**
	 * 
	 */
	public function logout(){
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
		/*$this->view->language = Labels::select( $this->get_language() );
		//Default footer, but you can change this in your action
		$this->view->footer = 'elements/footer_general.tpl';
		//container Top
		$this->view->first_containers = Container::find('first', array('order'=>'ord', "conditions"=>"active=1"));
		//Left containers
		$this->view->containers = Container::find("all", array("conditions"=>"active=1 AND visible=1 AND lang=" . ActiveRecord::quote(ActiveRecord::$lang) . " AND active=1", 'order'=>'ord'));
		*/
		//log...
		//...
	}
	
}