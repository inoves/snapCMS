<?php
class AccountController extends BaseController
{

	/**
	* 
	*/
	public function index(){
		$this->show();//show account page
	}
	
	
	/**
	* 
	*/
	public function show(){
		$this->view->customer = Customer::current();
		$this->view->template_action = '/account/show';
	}
	
	
	/**
	* 
	*/
	public function edit($id){
		$this->view->customer = Customer::current();
		if ($_POST):
			$error_msg = '';
			//Validations
			if(''==$_POST['name'])
				$error_msg.= $this->view->language['your_name'].': '.$this->view->language['required'].'<br>';
			if(''==$_POST['address'])
				$error_msg.= $this->view->language['your_address'].': '.$this->view->language['required'].'<br>';
			if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
				$error_msg .= $this->view->language['your_email'].': '.$this->view->language['invalid'];
			$this->view->customer->name = ActiveRecord::quote($_POST['name']);
			$this->view->customer->address = ActiveRecord::quote($_POST['address']);
			$this->view->customer->country = ActiveRecord::quote($_POST['country']);
			$this->view->customer->ZIP = ActiveRecord::quote($_POST['ZIP']);
			$this->view->customer->location = ActiveRecord::quote($_POST['location']);
			$this->view->customer->state = ActiveRecord::quote($_POST['state']);
			$this->view->customer->email = ActiveRecord::quote($_POST['email']);
			if(''==$error_msg)
				$this->view->customer->save();
			else:
				$this->view->flash = '<p class="notice">'.$error_msg.'</p>';
			endif;
		endif;
	}
	
	/**
	* 
	*/
	public function account_new(){
		$this->view->customer = new Customer();
		if ($_POST):
			$error_msg = '';
			//Validations
			if(''==$_POST['name'])
				$error_msg.= $this->view->language['your_name'].': '.$this->view->language['required'].'<br>';
			if(''==$_POST['address'])
				$error_msg.= $this->view->language['your_address'].': '.$this->view->language['required'].'<br>';
			if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
				$error_msg .= $this->view->language['your_email'].': '.$this->view->language['invalid'];
			$this->view->customer->name = ActiveRecord::quote($_POST['name']);
			$this->view->customer->address = ActiveRecord::quote($_POST['address']);
			$this->view->customer->country = ActiveRecord::quote($_POST['country']);
			$this->view->customer->ZIP = ActiveRecord::quote($_POST['ZIP']);
			$this->view->customer->location = ActiveRecord::quote($_POST['location']);
			$this->view->customer->state = ActiveRecord::quote($_POST['state']);
			$this->view->customer->email = ActiveRecord::quote($_POST['email']);
			if(''==$error_msg)
				$this->view->customer->save();
			else:
				$this->view->flash = '<p class="notice">'.$error_msg.'</p>';
			endif;
		endif;
	}
	public function unsubcription($id=0){}
	public function update($id=0){}
	
	
	protected function before_filter(){
		if ($GLOBALS['action']= && Customer::current()==false)://Not logged
			$this->view->flash = '<p class="notice">'.$this->view->language['restrict_area'].'</p>';
			$this->redirect_to('/login');
		endif;
	}
}