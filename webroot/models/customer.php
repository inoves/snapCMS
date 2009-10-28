<?php
class Customer extends CustomerBase {
	
	/**
	 * 
	 */
	static function login($username, $password){
		return false;
	}
	
	/**
	 * 
	 */
	static function logout(){
		return false;
	}
	
	/**
	 * Get e set customer in session
	 */
	static function current($customer=false){
		if($customer)
			$_SESSION[Config::$session_customer]=$customer;
		return $_SESSION[Config::$session_customer];
	}
}

