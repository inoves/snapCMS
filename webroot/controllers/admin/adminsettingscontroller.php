<?php
/**
* 
*/
class AdminSettingsController extends BaseController
{
	
	public $layout = 'admin/layout/layout';
	
	function index(){
		$content = file_get_contents('../config/config.php');
		echo $content;
		if($_POST){
			//Save data
		}
		$this->view->template_action = 'admin/pages/setting';
	}
}