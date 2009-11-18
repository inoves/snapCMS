<?php

/*
 * Add skills for import functions from other class
 */
class SnapClass{
	public static $_class_instance=null;
	public static function get_instance(){
		if (self::$_class_instance):
			return self::$_class_instance;
		else:
			self::$_class_instance = new super();
		endif;
	}
	private $imported = array();  
	private $imported_functions= array();
	public $view = array();
	public $_values = array();
	
	public function __get($name){return $this->_values[$name];}
	public function __set($name, $new_value){$this->_values[$name] = $new_value;
	}
   
     protected function imports($object)  
     {  
         // the new object to import  
         $new_import         = new $object();  
         // the name of the new object (class name)  
         $import_name        = get_class($new_import);  
         // the new functions to import  
         $import_functions   = get_class_methods($new_import);  
   
         // add the object to the registry  
         array_push($this->imported, array($import_name, $new_import));  
   
         // add teh methods to the registry  
         foreach($import_functions as $key => $function_name)  
         {  
             $this->imported_functions[$function_name] = &$new_import;  
         }  
     }  
   
     public function __call($method, $args){
         if(array_key_exists($method, $this->imported_functions))  
         {  
             $args[] = $this;  
             // invoke the function  
             return call_user_func_array(array($this->imported_functions[$method], $method), $args);  
         }  
   
         throw new Exception ('Call to undefined method/class function: ' . $method);  
     }
 }