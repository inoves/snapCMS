<?php 

/**
* 
*/
class AdminMenusController extends BaseController
{
	
	public $layout = 'admin/layout/layout';
	
	function index()
	{
		$this->menus_list();
	}
	
	public function container_remove($id='')
	{
		$menus = Menu::query('SELECT * FROM menus WHERE container_id='.ActiveRecord::quote($id));
		if(count($menus)==0):
			Container::query("DELETE FROM containers WHERE id=".ActiveRecord::quote($id));
			$this->view->flash = '<p class="success">Container removed</p>';
		else:
			$this->view->flash = '<p class="error">Container is not empty</p>';
		endif;
		$this->redirect_to('/admin/menus');
	}
	public function containers_new()
	{
		$edit_containers = array();
		$new_id = Container::last_id() + 1;
		$active = 1;
		$visible = 1;
			foreach (Config::$languages as $lang) {
				$container = new Container();
				$container->lang = $lang;
				$container->active = 1;
				$container->visible = 1;
				if($_POST):
					$_POST['container'][$lang]['active'] = (int)$_POST['active'];
					$_POST['container'][$lang]['visible'] = (int)$_POST['visible'];
					$_POST['container'][$lang]['id'] = $new_id;
					$_POST['container'][$lang]['ord'] = 1;
					$container->update_attributes($_POST['container'][$lang]);
					
				endif;
				$this->view->active = $container->active;
				$this->view->visible = $container->visible;
				$edit_containers[] = $container;
			}
		if ($_POST):
			$this->view->flash = '<p class=success>Container successfully created!</p>';
			$this->redirect_to('admin/menus');
		endif;
		$this->view->edit_containers = $edit_containers;
		$this->view->title_form = 'New container';
		$this->view->template_action = 'admin/menus/container_form';
		
		$this->view->tags = Tag::find('all');
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($_COOKIE['language_admin']),'order'=>'ord'));
	}
	public function container_edit($id='')
	{
		$edit_containers = array();
		foreach (Config::$languages as $lang) {
			$container = Container::find('first', array('conditions'=>"lang=".ActiveRecord::quote($lang)." AND id=".ActiveRecord::quote($id)));
			if(!$container):
				$container = new Container();
				$container->lang = $lang;
				$container->id = $id;
			endif;
			if($_POST):
				$_POST['ord'] = ((int)$_POST['ord']>(int)$container->ord) ? (int)$_POST['ord'] : (int)$container->ord ;
				$_POST['container'][$container->lang]['active'] = (int)$_POST['active'];
				$_POST['container'][$container->lang]['visible'] = (int)$_POST['visible'];
				$_POST['container'][$container->lang]['ord'] = $_POST['ord'];
				$container->update_attributes($_POST['container'][$container->lang]);
			endif;
			$this->view->active = $container->active;
			$this->view->visible = $container->visible;
			$edit_containers[] = $container;
		}
		if ($_POST):
			$this->view->flash = '<p class="success">Container successfully edited!</p>';
			$this->redirect_to('/admin/menus');
		endif;
		$this->view->edit_containers = $edit_containers;
		$this->view->container_id = $id;
		
		$this->view->title_form = 'Edit container';
		$this->view->template_action = 'admin/menus/container_form';
		$this->view->tags = Tag::find('all');
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($_COOKIE['language_admin']),'order'=>'ord'));
		
	}
	
	
	
	
	
	public function menu_edit($id='')
	{
		$edit_menus = array();
		$container_id = 0;
		$menu_id = 0;
		$ord = 0;
		$active = 1;
		$visible = 1;
		$type_selected = '';
		foreach (Config::$languages as $lang) {
			$menu = Menu::find('first', array('conditions'=>'lang='.ActiveRecord::quote($lang).' AND id='.ActiveRecord::quote($id)));
			if(!$menu):
				$menu = new Menu();
				$menu->lang = $lang;
			endif;
			$container_id = ( 0 == (int)$menu->container_id ) ? $container_id : $menu->container_id ;
			$active = ( 0 == (int)$menu->active ) ? $active : $menu->active ;
			$visible = ( 0 == (int)$menu->visible ) ? $visible : $menu->visible ;
			$ord = ( 0 == (int)$menu->ord ) ? $ord : $menu->ord ;
			$value_typeof = ($menu->value_typeof=='') ? $value_typeof : $menu->value_typeof;
			$type_selected = ($menu->typeof=='') ? $type_selected : $menu->typeof;
			if ($_POST):
				$_POST['menu'][$lang]['id'] = $id;
				$_POST['menu'][$lang]['typeof'] = $_POST['typeof'];
				$_POST['menu'][$lang]['value_typeof'] = $_POST['value_typeof'];
				$_POST['menu'][$lang]['active'] = (int)$_POST['active'];
				$_POST['menu'][$lang]['container_id'] = (int)$_POST['container_id'];
				//$_POST['menu'][$lang]['ord'] = 0;
				$_POST['menu'][$lang]['parent_id'] = (int)$_POST['parent_id'];
				$menu->update_attributes($_POST['menu'][$lang]);
			endif;
			$edit_menus[] = $menu;
		}
		if ($_POST):
			$this->view->flash = '<p class="success">Menu successfully edited!</p>';
			$this->redirect_to('/admin/menus');
		endif;
		$this->view->value_typeof = $value_typeof;
		$this->view->type_selected = $type_selected;
		$this->view->types = Config::$types_of_menu;
		$this->view->active = $active;
		$this->view->menu_id = $id;
		$this->view->container_id = $container_id;
		$this->view->menus = $edit_menus;
		$this->view->tags = Tag::find('all');
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($_COOKIE['language_admin']),'order'=>'ord'));
		$this->view->title_form = 'Edit menu';
		$this->view->template_action = 'admin/menus/menu_form';

	}
	public function menu_new()
	{
		$edit_menus = array();
		$container_id = 0;
		$menu_id = Menu::last_id() + 1;
		$ord = 0;
		$active = 1;
		$visible = 1;
		$type_selected = '';
		foreach (Config::$languages as $lang) {
			$menu = new Menu();
			$menu->lang = $lang;
			$menu->active = 1;
			$container_id = ( 0 == (int)$menu->container_id ) ? $container_id : $menu->container_id ;
			$active = ( 0 == (int)$menu->active ) ? $active : $menu->active ;
			$visible = ( 0 == (int)$menu->visible ) ? $visible : $menu->visible ;
			$ord = ( 0 == (int)$menu->ord ) ? $ord : $menu->ord ;
			$value_typeof = ('' == $menu->value_typeof) ? $value_typeof : $menu->value_typeof;
			$type_selected = ('' == $menu->typeof) ? $type_selected : $menu->typeof;
			if ($_POST):
				$_POST['menu'][$lang]['id'] = $menu_id;
				$_POST['menu'][$lang]['typeof'] = $_POST['typeof'];
				$_POST['menu'][$lang]['value_typeof'] = $_POST['value_typeof'];
				$_POST['menu'][$lang]['active'] = (int)$_POST['active'];
				$_POST['menu'][$lang]['container_id'] = (int)$_POST['container_id'];
				$_POST['menu'][$lang]['ord'] = 0;
				$_POST['menu'][$lang]['parent_id'] = (int)$_POST['parent_id'];
				$menu->update_attributes($_POST['menu'][$lang]);
			endif;
			$edit_menus[] = $menu;
		}
		if ($_POST):
			$this->view->flash = '<p class="success">Menu successfully created!</p>';
			$this->redirect_to('/admin/menus');
		endif;
		$this->view->value_typeof = $value_typeof;
		$this->view->type_selected = $type_selected;
		$this->view->types = Config::$types_of_menu;
		$this->view->active = $active;
		$this->view->menu_id = $id;
		$this->view->container_id = $container_id;
		$this->view->menus = $edit_menus;
		$this->view->title_form = 'New menu';
		$this->view->template_action = 'admin/menus/menu_form';
		$this->view->tags = Tag::find('all');
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($_COOKIE['language_admin']),'order'=>'ord'));
	}
	public function menu_remove($id='')
	{
		if(!Page::find('all', array('conditions'=>'menu_id='.ActiveRecord::quote($id)))):
			Menu::query("DELETE FROM menus WHERE id=".ActiveRecord::quote($id));
			$this->view->flash = '<p class="success">Removed menu</p>';
			$this->redirect_to('/admin/dashboard');			
		endif;
		$this->view->flash = '<p class="error">Menu not empty</p>';
		$this->redirect_to('/admin/dashboard');
	}
	public function menus_list()
	{
		$this->view->containers = Container::find('all', array('conditions'=>'lang='.ActiveRecord::quote($_COOKIE['language_admin']),'order'=>'ord'));
		$this->view->tags = Tag::find('all');
		$this->view->template_action = 'admin/menus/menus_list';
	}
	public function order_menu($container_id=0)
	{
		foreach ($_POST['menus_'.$container_id] as $ord => $id) {
			Container::query("UPDATE menus SET ord=".ActiveRecord::quote($ord) . " WHERE id=".ActiveRecord::quote($id));
		}
		echo '<p class="success">Menus orderly successfully!</p>';
		exit();
	}
	public function order_container()
	{
		foreach ($_POST['containers'] as $ord => $id) {
			Container::query("UPDATE containers SET ord=".ActiveRecord::quote($ord) . " WHERE id=".ActiveRecord::quote($id));
		}
		echo '<p class="success">Containers orderly successfully!</p>';
		exit();
	}
	
	
	protected function language()
	{

	}
	
	
	protected function before_filter()
	{
		//Important order
		if (!User::logged()):
			$this->redirect_to('/admin/users/login');
		endif;
		$this->view->current_user = User::current_user();
		$this->view->config_site_name = 'Admin::'.Config::$site_name;
		if(!$this->view->current_user->permission($GLOBALS['controller'].'controller', $GLOBALS['action'])){
			$this->redirect_to('/admin/pages/not_permission');
		}
	}
}
