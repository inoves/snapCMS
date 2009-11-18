<?php //-->
/**
* Admin Customers Controller
*/
class AdminCustomersController extends BaseController{
	public $layout = 'admin/layout/layout';
	
	
	function index()
	{
		$this->customers_list();
	}
	
	
	function customers_list($current_page=0){
		$per_page = Config::$per_page_admin;
		$current_page = (( $current_page * 1 )<=1) ? 0 : ( $current_page * 1 );
		$limit = ((($current_page-1) * $per_page) <= 1)? 0 : (($current_page-1) * $per_page);
		$aCount = Page::query('SELECT count(*) as aCount FROM customers');
		
		$this->view->aCount = $aCount[0]['aCount'];
		$this->view->customers = Customer::find('all', array('ORDER'=> 'updated_at DESC', 'LIMIT'=> $limit . ", " . $per_page));
		
		$this->view->title_action = 'List all customers';
		$this->view->current_page = $current_page;
		$this->view->per_page = $per_page;
		
		$this->view->link_paginator = '/admin/customers/customers_list';
		
		$this->view->template_action = 'admin/customers/list';
	}
	
	
	
	
	protected function before_filter()
	{
		$this->view->current_user = User::current_user();
		$this->view->config_site_name = 'Admin::'.Config::$site_name;
		if ( !User::logged()):
			$this->redirect_to('/admin/users/login');
		endif;
		//Name of controller is AdminCustomers + Controller word equal class name
		if(!$this->view->current_user->permission($GLOBALS['controller'].'Controller', $GLOBALS['action'])){
			$this->redirect_to('/admin/pages/not_permission');
		}
		
	}
}
