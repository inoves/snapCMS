<?php //-->
/**
* Admin Manufactures Controller
*/
class AdminManufacturesController extends BaseController
{
	public $layout = 'admin/layout/layout';
	
	/**
	* permission enable
	*/
	function index()
	{
		$this->manufactures_list();
	}
	
	/**
	* permission enable
	*/
	function manufactures_list()
	{
		//Controller-Action
		$this->view->manufactures = Manufacture::query_obj('SELECT * FROM manufactures');
		//View
		$this->view->title_action = 'List all manufactures ('. count($this->view->manufactures) .')';
		$this->view->template_action = 'admin/manufactures/list';
	}
	
	/**
	* permission enable
	*/
	function edit($manufacture_id='')
	{
		$this->view->manufacture = Manufacture::find($manufacture_id);
		if ($_POST):
			try {
				if($_POST['remove_image']){
					$this->view->manufacture->image = null;
				}
					
				if($_FILES['image']['size']>0){
					$this->view->manufacture->upload_for_image($_FILES['image']);
				}
				$this->view->manufacture->update_attributes($_POST['manufacture']);
				$this->view->flash = "<p class='success'>Updated manufacture with success.</p>";
				$this->redirect_to('/admin/manufactures');
			} catch (Exception $e) {
				$this->view->flash = "<p class='error'><b>Error</b><br/>".$e->getMessage()."</p>";
			}
		endif;
		$this->view->title_action = 'Edit manufacture';
		$this->view->template_action = 'admin/manufactures/edit';
	}
	
	/**
	* permission enable
	*/
	function manufacture_new()
	{
		if ($_POST):
			$manufacture = new Manufacture($_POST['manufacture']);
			try {
				if($_POST['remove_image'])
					$manufacture->image = null;
				if($_FILES['image'])
					$manufacture->upload_for_image($_FILES['image']);
				$manufacture->save();
				$this->view->flash = "<p class='success'>Created new manufacture with success.</p>";
				$this->redirect_to('/admin/manufactures');
			} catch (Exception $e) {
				$this->view->flash = "<p class='error'>Error: ".$e->getMessage()."</p>";
			}
			
		endif;
		$this->view->title_action = 'New manufacture';
		$this->view->template_action = 'admin/manufactures/edit';
	}
	
	/**
	* permission enable
	*/
	function remove($id)
	{
		try {
			if ($id):
				$manufacture = Manufacture::find($id);
				$manufacture->destroy();
				$this->view->flash = "<p class='success'>Removerd manufacture with success.</p>";
				$this->redirect_to('/admin/manufactures');
			else:
				$this->view->flash = "<p class='warning'>Please, select manufacture first.</p>";
				$this->redirect_to('/admin/manufactures');
			endif;
		} catch (Exception $e) {
			$this->view->flash = "<p class='warning'>Error, try again.</p>";
			$this->redirect_to('/admin/manufactures');
		}
	}
	
	protected function before_filter()
	{
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
//?/>