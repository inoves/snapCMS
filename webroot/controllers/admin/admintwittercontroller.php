<?php 

/**
* controller Twitter
*/
class AdminTwitterController extends BaseController
{
	
	public $layout = 'admin/layout/layout';
	
	public function index()
	{
		$twitter = new MyTwitter();
		
		if(!$twitter){
			$this->view->flash = "<div class=\"error\">Cannot login in twitter</div>";
			$this->redirect_to('/admin/');
		}
		if ($_POST):
			$resp = $twitter->create($_POST['message']);
			$this->view->flash = "<div class=success>yes! Sended with sucess!!!.</div>";
		endif;
			$this->view->my_twitters_xml = $twitter->my_twitters();
			$this->view->my_replies_xml = $twitter->my_replies();
			
			//Select 20 users of twitter
			$users = array(); $k = 1;
			foreach($twitter->my_friends()->user as $user):
				$users[] = $user;
				if($k++ > 19) break;
			endforeach;
			
			$this->view->my_friends_xml = $users;
			$this->view->template_action = 'admin/twitter/list';
	}

	public function remove($id='')
	{
		$twitter = new MyTwitter();
		$twitter->remove($id);
		$this->view->flash = '<div class="notice">ok! Your tweet removed!!!</div>';
		$this->index();//redirect_to('admin/twitter');
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

