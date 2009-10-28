<?php //-->
/**
* Admin User Controller
*/
class AdminUsersController extends BaseController
{
	public $layout = 'admin/layout/layout';
	
	/**
	* permission enable
	*/
	function index()
	{
		$this->users_list();
	}
	/**
	* permission enable
	*/
	function users_list($current_page=0)
	{
		//Controller-Action
		$this->view->users = User::query_obj('SELECT * FROM users');
		//View
		$this->view->title_action = 'List all users ('. count($this->view->users) .')';
		$this->view->template_action = 'admin/users/list';
	}
	
	/**
	* permission enable
	*/
	function edit($user_id='')
	{
		$this->view->user = User::find($user_id);
		if ($_POST):
			try {
				if($_POST['user']['group_id']=='new'){
					$group = new Group(array('name'=>$_POST['group_name']));
					$group->save();
					$_POST['user']['group_id'] = $group->id;
				}
				$this->view->user->update_attributes($_POST['user']);
				$this->view->flash = "<p class='success'>Updated user with success.</p>";
				$this->redirect_to('/admin/users');
			} catch (Exception $e) {
				$this->view->flash = "<p class='error'><b>Error</b><br/>".$e->getMessage()."</p>";
			}
		endif;
		$this->view->groups = Group::find('all');
		$this->view->title_action = 'Edit user';
		$this->view->template_action = 'admin/users/edit';
	}
	
	
	function new_user()
	{
		if ($_POST):
			$user = new User($_POST['user']);
			if($_POST['user']['group_id']=='new'){
				$group = new Group(array('name'=>$_POST['group_name']));
				$group->save();
				$user->group_id = $group->id;
			}
			try {
				$user->save();
				$this->view->flash = "<p class='success'>Created new user with success.</p>";
				$this->redirect_to('/admin/users');
			} catch (Exception $e) {
				$this->view->flash = "<p class='error'>Error: ".$e->getMessage()."</p>";
			}
			
		endif;
		$this->view->groups = Group::find('all');
		$this->view->title_action = 'New user';
		$this->view->template_action = 'admin/users/edit';
	}
	
	
	function remove($id)
	{
		if ($id):
			$user = User::find($id);
			$user->destroy();
			$this->view->flash = "<p class='success'>Removerd user with success.</p>";
			$this->redirect_to('/admin/users');
		else:
			$this->view->flash = "<p class='notice'>Please, select user first.</p>";
			$this->redirect_to('/admin/users');
		endif;
	}
	
	
	//Only affect permissions
	function permissions($group_id=null)
	{
		if ($group_id==null):
			$this->view->flash = '<p class="error">Please, select one group.</p>';
		else:
			if ($group_id==1):
				$this->view->flash = '<p class="notice">Please, You cannot change admin group.</p>';
			elseif ($_POST):
				Permission::query("DELETE FROM permissions where group_id=".$group_id);
				foreach ($_POST['permissions'] as $key => $value) {
					list($controller, $action) = explode('::', $key);
					$permission = new Permission( array('group_id'=>$group_id,'controller'=>$controller,'action'=>$action) );
					$permission->save();
				}
				$this->view->flash = '<p class="success">Save permissions.</p>';
			endif;
		endif;
		
		//Get controllers and actions fo admin
		$class_permissions = array();
		$handle = opendir(__DIR__);
		while (false !== ($file = readdir($handle))) {
			if ($file=='.' || $file=='..')
				continue;
			$class = str_replace('.php', '', $file);
			$class = str_replace(__DIR__, '', $class);
			$rClass = new ReflectionClass($class);
			foreach ($rClass->getMethods() as $method)
			{
				$match = "/".strtolower($file)."/";
				if ($method->isPublic() && preg_match($match, strtolower($method->getFileName()))):
					$class_permissions[$class][] = $method->getName();
				endif;
			}
			
		}
		closedir($handle);
		
		// title with Select box groups 
		$groups = Group::find('all');
		$title_txt =  'Select group: <select onchange="window.location = \'/admin/users/permissions/\'+$F(this)">';
		$title_txt .= Helper::select_option('', '', '');
		foreach ($groups as $group) {
			$title_txt .= Helper::select_option($group->name, $group->id, $group_id);
		}
		$title_txt .= '</select>';
		$this->view->title_action = $title_txt;
		
		$this->view->group_id = $group_id;
		$this->view->class_permissions = $class_permissions;
		$this->view->template_action = 'admin/users/permissions';
	}
	
	function login(){
		if ($_POST):
			if (User::login($_POST['username'], $_POST['password'])):
				$this->redirect_to( '/admin/' );
			else:
				$this->view->flash = '<p class="error">The password you gave was incorrect. Please try again.</a>';
			endif;
		endif;
		$this->layout=false;
		$this->view->template_action = 'admin/users/login';
		$this->view->no_layout = true;
	}
	
	function logout(){
		unset($_SESSION['current_user']);
		$this->view->flash = '<p class="notice">Logout.</a>';
		$this->redirect_to( '/admin/users' );
	}
	
	protected function before_filter()
	{
		$this->view->current_user = User::current_user();
		$this->view->config_site_name = 'Admin::'.Config::$site_name;
		//Important order
		if (!($GLOBALS['action']=='login' || $GLOBALS['action']=='logout')){
			if ( !User::logged()):
				$this->redirect_to('/admin/users/login');
			endif;
			//Name class is AdminUser + Controller
			if(!$this->view->current_user->permission($GLOBALS['controller'].'controller', $GLOBALS['action'])){
				$this->redirect_to('/admin/pages/not_permission');
			}
		}
	}
}
//?/>