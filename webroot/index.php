<?php
// 1 +++
set_exception_handler('SnapException');
set_error_handler("SnapError", E_ALL ^ E_NOTICE ^ E_WARNING);
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
//---

//2
ini_set("include_path", "../plugins/:../config/:../lib/:./controllers/:./controllers/admin/:./views/:./models/generated_models/:./models/:../lib/db_adapter/:../lib/internals/:../lib/plugins:../lib/Zend/:../lib/Zend/Json/");

//3
include_once('../config/config.php');

//4
try {
	$class = ucfirst(BaseController::dispatchcontroller()).'Controller';
	$controller_main = new $class;
	$controller_main->_run_controller();
} catch (Exception $e) {
	SnapException($e);
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

function SnapException($e){
	if(ENVIRONMENT == 'dev'):
		echo "<h1>Error:</h1><pre>";
		var_dump($e);
		echo "</pre>";
	else:
		header('location: '.Config::$error_path);
		if (Config::$send_error_reporting):
			mail(Config::$email_admin, 'Error reporting', $e->getMessage());
		endif;
	endif;
	die();
}
function SnapError($errno, $errstr, $errfile, $errline){
	$err = "<b>Custom error:</b> [$errno] $errstr<br />";
	$err .= " Error on line $errline in $errfile<br />";
	$err .= "Ending Script";
	if(ENVIRONMENT == 'dev'):
		echo "<h1>Error:</h1><pre>".$err."</pre>";
		die();
	else:
		header('location: '.Config::$error_path);
		if (Config::$send_error_reporting):
			mail(Config::$email_admin, 'Error reporting', $err);
		endif;
	endif;
  die();
  }



