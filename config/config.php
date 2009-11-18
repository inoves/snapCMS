<?php

date_default_timezone_set('Europe/Lisbon');
class Config{
	
	//Site name
	static $site_name = 'Snap DEMO';
	
	static $email_admin = 'email@gmail.com';
	static $send_error_reporting = true;
	
	static $session_customer = 'xpto_customer_session';

	//first item is default
	static $languages = array('pt', 'en', 'es');

	static $per_page_admin	= 100;
	static $per_page		= 10;
	static $elements_paginator 	= 7;
	static $admin_group_id		= 1;//in user permission 

	static $home_type 			= 'types/intro.tpl';//you can add personal template design 
	static $error_path			= '/400.html';


	//URLs and server addresss
	static $host_base				= 'http://localhost/';
	static $url_path 				=  '' ;//If your site hosting in subdirectories

	
	//You like caching?
	static $caching 				= false;
	static $folder_cache			= 'cache/';// . DIRECTORY_SEPARATOR ;//change in .htaccess to
	
	//method of athenticated
	static $method_authentication 	= 'Login';//'LDAP';
	
	//user account twitter
	static $twitter_u 				= '76yhnvfh';
	static $twitter_p 				= 'swvfgrt';
	static $twitter_key 			= '';
	static $twitter_cache_expireted_at	= 0.2;
	
	//usre account flickr if you used
	static $flickr_u 				= 'testssnso';
	static $flickr_p 				= 'msio19312';
	static $flickr_key 				= '0120391212938129389128';
	static $flickr_secret 			= 'mcsadiqw231092';
	static $flickr_user_id			= '23123123123@H12';
	
	
	
	//Templates of menu
	static $types_of_menu 		= array(
										//You can add personals designs how lists contents in menus
										'List 2 intros per line'=>'types/intro2.tpl', 
										'List 4 intros per line'=>'types/intro.tpl', 
										'Page'					=>'types/static.tpl', 
										'Only list title'		=>'types/list.tpl', 
										'Use homepage template'	=>'types/homepage.tpl',
										'Use product template'	=>'types/product.tpl', 
										'Use portifolio template'=>'types/portifolio.tpl', 
										'Use gallery template'	=>'types/gallery.tpl' , 
										'Select tag'			=>'tag',//No change this
										'Go to link'			=>'link'//No change this
										);
	//Templates of pages
	static $templates_names		= array( 
										//You can add personals designs how show pages
										'actions/page.tpl', 
										'actions/product.tpl' 
										);
										
	//Folder and files ---Not need change this
	static $path_webroot	= '';
	static $path_photos		= '';
}


//not change this
session_start();
if ($_SERVER['HTTP_HOST']!=Config::$host_base):
	define('ENVIRONMENT', 'dev');
else:
	define('ENVIRONMENT',  'prod');
endif;
Config::$path_webroot = dirname(__FILE__).DIRECTORY_SEPARATOR ."..".DIRECTORY_SEPARATOR;
Config::$path_photos = Config::$path_webroot."webroot".DIRECTORY_SEPARATOR."photos".DIRECTORY_SEPARATOR;