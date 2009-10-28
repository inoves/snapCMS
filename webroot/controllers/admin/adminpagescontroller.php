<?php
/**
* 
*/
class AdminPagesController extends BaseController
{
	
	public $layout = 'admin/layout/layout';
	
	
	public function dashboard()
	{
		/*
		- View orders
		- Mini chat on-line
		- View stats
		*/
		$this->pages_list_home();
	}
	
	
	public function show($id='')
	{
		$this->redirect_to('/admin/pages/edit/'.$id);
	}
	
	
	public function page_new()
	{
		if ($_POST):
			$_POST['page']['product'] = ($_POST['page']['product'])? 1 : 0;
			$_POST['page']['show_gallery'] = ($_POST['page']['show_gallery'])? 1 : 0;
			$_POST['page']['show_home'] = ($_POST['page']['show_home'])? 1 : 0;
			
			$page = new Page($_POST['page']);
			$page->order_home = $_POST['order_home'];
			$page->order_menu = $_POST['order_menu'];
			$page->save();
			
			$page->with_tags($_POST['tags']);
			
			$descriptions = $page->descriptions();
			$product = $page->product();
			
			$_POST['product']['page_id'] = $page->id;
			$_POST['product']['show_old_price'] = ($_POST['product']['show_old_price']==1)? 1 : 0;
			$_POST['product']['promo_flag'] = ($_POST['product']['promo_flag'])? 1 : 0;
			$_POST['product']['new_flag'] = ($_POST['product']['new_flag'])? 1 : 0;
			$product->update_attributes( $_POST['product'] );
			
			foreach ($_POST['description'] as $lang => $content) {
				$content["page_id"] = $page->id;
				array_walk($content, 'htmlspecialchars');
				$descriptions[$lang]->update_attributes( $content );
			}

			$this->view->flash = "<p class='success'>created new page with success.</p>";
			
			if ($_POST['Save']=='Save with track' && isset(Config::$twitter_u)):
				$twitter = new MyTwitter();
				$text = $_POST['description'][$this->language()]['title'] . " " . strip_tags($_POST['description'][$this->language()]['intro']);
				$post = Config::$host_base . "page/" . $page->id ." NEW: " . substr($text, 0, 255) . "...";
				$resp = $twitter->create($post);
			endif;
			
			$this->redirect_to('/admin/pages/edit/'.$page->id);
		else:
			$page = new Page();
			$page->id = 0;
			$descriptions = $page->descriptions();
			$product = $page->product();
		endif;
		
		$this->view->page = $page;
		$this->view->descriptions = $descriptions;
		$this->view->product = $product;
		$this->view->product_attributes = $this->view->page->product_attributes();
		$this->view->attributes = Attribute::find('all');
		$this->view->manufactures = Manufacture::find('all');
		
		$this->view->templates_names = Config::$templates_names;
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		$this->view->title_action = 'New page';
		$this->view->photos = Photo::find('all', array('conditions'=>'page_id='.ActiveRecord::quote($id)));
		$this->view->range = range(-10,10);
		
		$this->view->template_action = 'admin/pages/edit';
	}
	
	
	public function edit($id='')
	{
		$page = Page::find($id);
		$descriptions = $page->descriptions();
		$product = $page->product();
		
		
		if ($_POST):
			$_POST['page']['product'] = ($_POST['page']['product'])? 1 : 0;
			$_POST['page']['show_gallery'] = ($_POST['page']['show_gallery'])? 1 : 0;
			$_POST['page']['show_home'] = ($_POST['page']['show_home'])? 1 : 0;
			$_POST['page']['active'] = ($_POST['page']['active'])? 1 : 0;
			$_POST['product']['show_old_price'] = ($_POST['product']['show_old_price']==1)? 1 : 0;
			$_POST['product']['promo_flag'] = ($_POST['product']['promo_flag'])? 1 : 0;
			$_POST['product']['new_flag'] = ($_POST['product']['new_flag'])? 1 : 0;
			
			foreach ($_POST['description'] as $lang => $content) {
				@array_walk($content, 'htmlspecialchars');
				$descriptions[$lang]->update_attributes( $content );
			}
			$page->order_home += (int)$_POST['order_home'];
			$page->order_menu += (int)$_POST['order_menu'];
			$page->update_attributes( $_POST['page'] );
			$product->update_attributes( $_POST['product'] );
			$page->with_tags($_POST['tags']);
			$this->view->flash = "<p class=\"success\">Updated with success.</p>";
			if ($_POST['Save']=='Save with track' && isset(Config::$twitter_u)):
				$twitter = new MyTwitter();
				$text = $_POST['description'][$this->language()]['title'] . " " . strip_tags($_POST['description'][$this->language()]['intro']);
				//make update message
				$post = Config::$host_base . "page/" . $page->id . "/" . str_replace(' ', '_', $page->name) ." NEW: " . substr($text, 0, 255) . "...";
				$resp = $twitter->create($post);
				$this->view->flash = "<p class=\"success\">Updated with success and track.</p>";
			endif;
		endif;
		$this->view->page = $page;
		$this->view->descriptions = $descriptions;
		$this->view->product = $product;
		$this->view->product_attributes = $this->view->page->product_attributes();
		$this->view->attributes = Attribute::find('all');
		$this->view->manufactures = Manufacture::find('all');
		
		$this->view->templates_names = Config::$templates_names;
		
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		$this->view->title_action = 'Edi page';
		$this->view->photos = Photo::find('all', array('conditions'=>'page_id='.ActiveRecord::quote($id)));
		$this->view->range = range(-10,10);
		
		$this->view->template_action = 'admin/pages/edit';
	}
	
	
	public function remove($id='')
	{
		$page = Page::find($id);
		$page->remove_all();
		$this->view->flash = '<p class="sucess">OK! Removed page!</p>';
		$this->pages_list(0);
	}
	
	
	public function attributes($action='', $page_id='', $id='')
	{
		$page = Page::find($page_id);
		if ($action=='add'):
			if ( !ProductAttribute::find('first',array( 'conditions'=>'page_id='.$page_id.' AND attribute_id='.$id)) ):
				$att = new ProductAttribute(array('page_id'=>$page_id,'attribute_id'=>$id, 'stock'=>'0'));
				$att->save();
			endif;
		else:
			ProductAttribute::query("DELETE FROM product_attributes WHERE page_id=".ActiveRecord::quote($page_id)." AND attribute_id=".ActiveRecord::quote($id));
		endif;
		
		$product_attributes = $page->product_attributes();
		foreach ($product_attributes as $att) {
			echo '<div id="prod_att_'.$att->id.'" class="prod_att">
				<a href="remove_attribute_product" onclick="rm_attribute('. $att->id .'); return false;"><img src="/images/delete.png" border="0" /></a>
				'.$att->name.'
			</div>';			
		}
		exit();
	}
	
	
	public function rm_photo($photo_id='')
	{
		$photo = Photo::find($photo_id);
		$page_id = $photo->page_id;
		$photo->del_photo();
		$this->photos($page_id);
	}
	
	
	public function photos($id='')
	{
		$this->view->photos = Photo::find('all', array('conditions'=>'page_id='.ActiveRecord::quote($id)));
		$this->view->template_action = 'admin/pages/_photos.tpl';
		$this->view->no_layout = true;
	}
	
	
	public function upload($id='')
	{
		try{
			$photos = Photo::upload($id, $_FILES['photo'], $_POST['photo_desc']);
			$message = $_FILES['photo']['name'];
		} catch (Exception $e){
			$message = "Error! Cannot send or open your photo.";
		}
		echo '<html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head><body onload="parent.closeIframe(\'' . $message . '\');"></body></html>';
		exit();
	}
	
	
	public function index()
	{
		$this->pages_list_home();
	}
	
	
	public function pages()
	{
		$this->pages_list();
	}
	
	
	public function pages_list($current_page=0)
	{
		//Controller-Action
		//$per_page = 80;
		//$current_page = (( $current_page * 1 )<=1) ? 0 : ( $current_page * 1 ) ;
		//$limit = ((($current_page-1) * $per_page) <= 1)? 0 : (($current_page-1) * $per_page);
		//$aCount = Page::query('SELECT count(*) as pages FROM pages_descriptions WHERE lang='.ActiveRecord::quote($this->language()));
		$this->view->pages = PagesDescription::query_obj('SELECT pages_descriptions.*, pages.active as active, pages.product as product FROM pages_descriptions, pages WHERE pages.id=pages_descriptions.page_id AND lang='.ActiveRecord::quote($this->language()) . 'ORDER BY pages.order_home') ;
		// LIMIT '. $limit . ", " . $per_page );
		
		//View
		$this->view->tags = Tag::find('all');
		$this->view->title_action = 'List all pages';
		//$this->view->aCount = $aCount[0]['pages'];
		//$this->view->current_page = $current_page;
		//$this->view->per_page = $per_page;
		//$this->view->link_paginator = '/admin/pages/pages_list';
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		//move to before_filter
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
		$this->view->template_action = 'admin/pages/pages_list';
		$this->view->menu_home_list = 'list';
		
	}
	
	
	public function pages_list_home( $current_page=0)
	{
		$per_page = 20;
		$current_page = (( $current_page * 1 )<=1) ? 0 : ( $current_page * 1 ) ;
		$limit = ((($current_page-1) * $per_page) <= 1)? 0 : (($current_page-1) * $per_page);
		$sql = "SELECT COUNT(*) as pages FROM pages, pages_descriptions WHERE pages.id=pages_descriptions.page_id AND pages.show_home=1 AND lang=".ActiveRecord::quote($this->language());
		$aCount = Page::query($sql);
		$sql = "SELECT pages_descriptions.*, pages.active as active, pages.product as product FROM pages, pages_descriptions WHERE pages.id=pages_descriptions.page_id AND pages.show_home=1 AND lang=".ActiveRecord::quote($this->language()) . " ORDER BY pages.order_home";
		
		$this->view->pages = PagesDescription::query_obj($sql);
		$this->view->tags = Tag::find('all');
		$this->view->title_action = 'List pages in home ('.$aCount[0]['pages'].')';
		//$this->view->aCount = $aCount[0]['pages'];
		//$this->view->current_page = $current_page;
		//$this->view->per_page = $per_page;
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		//move to before_filter
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
		//$this->view->link_paginator = '/admin/pages/pages_list_home';
		$this->view->template_action = 'admin/pages/pages_list';
		$this->view->menu_home_list = 'order_home';
	}
	
	
	public function pages_list_menu($value='', $current_page=0)
	{
		//$per_page = 20;
		//$current_page = (( $current_page * 1 )<=1) ? 0 : ( $current_page * 1 ) ;
		//$limit = ((($current_page-1) * $per_page) <= 1)? 0 : (($current_page-1) * $per_page);
		//$sql = "SELECT COUNT(*) as pages FROM pages, pages_descriptions WHERE pages.id=pages_descriptions.page_id AND pages.menu_id=".ActiveRecord::quote($value)." AND lang=".ActiveRecord::quote($this->language());
		//$aCount = Page::query($sql);
		$sql = "SELECT pages_descriptions.*, pages.active as active, pages.product as product FROM pages, pages_descriptions WHERE pages.id=pages_descriptions.page_id AND pages.menu_id=".ActiveRecord::quote($value)." AND lang=".ActiveRecord::quote($this->language()) . " ORDER BY pages.order_menu";// LIMIT $limit, $per_page";
		
		$this->view->pages = PagesDescription::query_obj($sql);
		$this->view->tags = Tag::find('all');

		$this->view->title_action = 'List pages of menu \''.Menu::find('first', array('conditions'=>'id='.ActiveRecord::quote($value.' AND lang='.ActiveRecord::quote($this->language()))))->name. '\'';
		//$this->view->aCount = $aCount[0]['pages'];
		//$this->view->current_page = $current_page;
		//$this->view->per_page = $per_page;
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		
		//move to before_filter
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
		//$this->view->link_paginator = '/admin/pages/pages_list_menu/'.$value;
		$this->view->template_action = 'admin/pages/pages_list';
		$this->view->menu_home_list = 'order_manufacture';
	}
	
	
	public function pages_list_manufacture($value='', $current_page=0)
	{
		$sql = "SELECT pages_descriptions.*, pages.active as active, pages.product as product FROM pages, pages_descriptions, pages_products WHERE pages_products.page_id=pages.id AND pages_products.manufacture_id=" . ActiveRecord::quote($value) . " AND pages.id=pages_descriptions.page_id AND lang=" . ActiveRecord::quote($this->language()) . " ORDER BY pages_products.order_manufacture";// LIMIT $limit, $per_page";
		
		$this->view->pages = PagesDescription::query_obj($sql);
		$this->view->tags = Tag::find('all');

		$this->view->title_action = 'List pages with manufacture \''.Manufacture::find('first', array('conditions'=>'id='.ActiveRecord::quote($value)))->name. '\'';
		//$this->view->aCount = $aCount[0]['pages'];
		//$this->view->current_page = $current_page;
		//$this->view->per_page = $per_page;
		$this->view->menu_selecte = $value;
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		
		//move to before_filter
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
		//$this->view->link_paginator = '/admin/pages/pages_list_menu/'.$value;
		$this->view->template_action = 'admin/pages/pages_list';
		$this->view->menu_home_list = 'order_manufacture';
	}
	
	public function orderspage($target)
	{
		if ($target=='list'):
			echo '<p class="notice">Cannot order this list</p>';
			exit();
		endif;
		foreach ($_POST['items'] as $key => $value) {
			
			if($target=='order_home'):
				$p = Page::find($value);
				$p->order_home = $key;
				$p->save();
			elseif($target=='order_menu'):
				$p = Page::find($value);
				$p->order_menu = $key;
				$p->save();
			elseif($target=='order_manufacture'):
				$p = PagesProduct::find('first', array('conditions'=>'page_id='.ActiveRecord::quote($value)));
				$p->order_manufacture = $key;
				$p->save();
			endif;
		}
		echo '<p class="success">List orderly '.$target.'</p>';
		exit();//No template
	}
	
	
	
	public function tag($value='', $name='', $current_page=0)
	{
		$this->view->tag = Tag::find((int)$value);
		$per_page = 20;
		$current_page = (( $current_page * 1 )<=1) ? 0 : ( $current_page * 1 ) ;
		$limit = ((($current_page-1) * $per_page) <= 1)? 0 : (($current_page-1) * $per_page);
		$sql = "SELECT COUNT(*) as pages FROM pages_tags, pages_descriptions WHERE pages_tags.page_id=pages_descriptions.page_id AND pages_tags.tag_id=".ActiveRecord::quote($value)." AND pages_descriptions.lang=".ActiveRecord::quote($this->language());
		$aCount = Page::query($sql);

		$sql = "SELECT * FROM pages_tags LEFT JOIN pages_descriptions ON  pages_tags.page_id= pages_descriptions.page_id INNER JOIN pages ON pages.id=pages_descriptions.page_id WHERE pages_tags.tag_id=".ActiveRecord::quote($value)." AND pages_descriptions.lang=".ActiveRecord::quote($this->language()) . " LIMIT $limit, $per_page";
		//view
		$this->view->pages = PagesDescription::query_obj($sql);
		$this->view->tags = Tag::find('all');
		$this->view->title_action = 'List pages with tag '.$name;
		$this->view->aCount = $aCount[0]['pages'];
		$this->view->current_page = $current_page;
		$this->view->per_page = $per_page;
		$this->view->menus = Menu::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()) ));
		//move to before_filter
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
		$this->view->link_paginator = '/admin/pages/'.$value.'/'.$name;
		$this->view->template_action = 'admin/pages/pages_list';
	}
	
	
	function not_permission(){
		$this->view->template_action = 'admin/pages/not_permission';
	}
	
	
//---------------------------------------------------
	protected function language()
	{
		if(!$_COOKIE['language_admin']){
			$_COOKIE['language_admin'] = Config::$languages[0];
			setcookie('language_admin', Config::$languages[0]);
		}
		return $_COOKIE['language_admin'];
	}
	
	protected function before_filter()
	{
		//Important order
		if (!User::logged()):
			$this->redirect_to('/admin/users/login');
		endif;
		$this->view->current_user = User::current_user();
		$this->view->config_site_name = 'Admin::'.Config::$site_name;
		if($GLOBALS['action']!='not_permission' && !$this->view->current_user->permission($GLOBALS['controller'].'controller', $GLOBALS['action'])){
			$this->redirect_to('/admin/pages/not_permission');
		}
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($this->language()),'order'=>'ord'));
	}
}

