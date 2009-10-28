<?php
ini_set("include_path", 
	"../plugins/:../config/:../lib/:./controllers/:./controllers/admin/:./views/:./models/generated_models/:./models/:../lib/db_adapter/:../lib/internals/:../lib/plugins:../lib/Zend/:../lib/Zend/Json/");

include_once('../config/config.php');

session_start();

//error_reporting(0);
//set_error_handler("personal_error");

try {
	$class = ucfirst(BaseController::dispatchcontroller()).'Controller';
	$controller_main = new $class;
	$controller_main->_run_controller();
} catch (Exception $e) {
	if(ENVIRONMENT == 'dev'):
		echo "<h1>Error:</h1><pre>";
		var_dump($e);
		echo "</pre>";
		exit();
	endif;
	
	//ERROR FROM BASECONTROLLER
	if ($e->getCode()>=63487):
		header('location: '.Config::$error_path);
	endif;
}

function __autoload($class_name){
	$file_class = strtolower($class_name) . '.php';
	if (!fclose(fopen($file_class, "r", true))):
		throw new Exception('File not found.' . $file_class , BaseController::NOT_FOUNT_FILE);
	endif;
	
	require_once($file_class);
	
	if (!class_exists($class_name, false)):
		throw new Exception('Class not found. ' . $class_name, BaseController::NOT_FOUNT_CLASS);
	endif;
}


