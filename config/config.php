<?php

date_default_timezone_set('Europe/Lisbon');


class Config{
	
	//Site name
	static $site_name = 'Snap DEMO';
	static $session_customer = 'xpto_customer_session';

	//first is default
	static $languages = array('pt', 'en', 'es');

	static $per_page_admin	= 100;
	static $per_page		= 10;
	static $elements_paginator = 7;
	static $admin_group_id		= 1;//in user permission 

	static $home_type 			= 'types/intro.tpl';//'home/homepage.tpl';
	static $error_path			= '/not_found';

	static $types_of_menu 		= array(
										'List introductions'	=>'types/intro.tpl', 
										'Page'					=>'types/static.tpl', 
										'Only list title'		=>'types/list.tpl', 
										'Use homepage template'	=>'types/homepage.tpl',
										'Use product template'	=>'types/product.tpl', 
										'Use portifolio template'=>'types/portifolio.tpl', 
										'Use gallery template'	=>'types/gallery.tpl' , 
										'Select tag'			=>'tag',
										'Go to link'			=>'link'
										);

	static $templates_names		= array( 'actions/page.tpl', 'actions/product.tpl' );

	//URLs and server addresss
	static $url_path 				=  '' ;//If your site hosting in subdirectories
	static $host_base				= 'http://wcm.local/';

	//Folder and files
	static $path_webroot 			= '/Users/stevenkoch/Sites/snapframework/webroot/';
	static $path_photos				= '/Users/stevenkoch/Sites/snapframework/webroot/photos/';
	//You like caching?
	static $caching 				= false;
	static $folder_cache			= 'cache/';//change in .htaccess to
	
	//method of athenticated
	static $method_authentication 	= 'Login';//'LDAP';
	
	//user account twitter
	static $twitter_u 				= 'usernametwitter';
	static $twitter_p 				= '12345678';
	static $twitter_key 			= '';
	static $twitter_cache_expireted_at	= 0.2;
	
	//usre account flickr
	static $flickr_u 				= 'testssnso';
	static $flickr_p 				= 'msio19312';
	static $flickr_key 				= '123123123123123123';
	static $flickr_secret 			= 'mcsadiqw231092';
	static $flickr_user_id			= '23123123123@H12';

}