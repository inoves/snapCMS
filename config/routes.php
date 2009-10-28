<?php
	$routes = array( 
		'/^home/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'index'
					),
		'/^not_found/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'not_found'
					),
		'/^page\/(.+)/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'page',
						'id'			=> '${1}'
					),
		'/^menu/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'menu'
					),
		'/^search/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'search'
					),
		'/^lang/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'lang'
					),
		//'/^store/'
		//	=> array(	'controller'	=> 'home',
		//				'action'		=> 'store'
		//			),
		'/^login/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'login'
					),
		'/^logout(\/$|$)/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'logout'
					),
		'/^tag/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'tag'
					),
		'/^manufacture/'
			=> array(	'controller'	=> 'home',
						'action'		=> 'manufacture'
					),
		'/^admin\/dashboard(\/$|$)/'
			=> array(	'controller'	=> 'adminpages',
						'action'		=> 'dashboard'
					),
		'/^admin\/(.+)\/(.+)(\/$|$)/'
			=> array(	'controller'	=> 'admin$1',
						'action'		=> '$2'
					),
		'/^admin\/(.+)(\/$|$)/'
			=> array(	'controller'	=> 'admin$1',
						'action'		=> 'index'
					),
		'/^admin\/(.*)/' //Translate to AdminMycontroller/Action...
			=> array(	'controller'	=> 'admin$1'
					),
		'/^admin(\/$|$)/' //If only match admin or admin/ translate to AdminPages/dashboard
			=> array(	'controller'	=> 'adminpages', 
						'action'		=> 'dashboard'
					),
		'/^(\w+)(\/$|$)/'
			=> array( 	'controller'	=> '$1',
						'action'		=> 'index'
					),
		//default "" or "/"
		'/^(\/$|$)/'
			=> array( 	'controller'	=> 'home',
						'action'		=> 'index'
					),
		/*,/*,
		'/.* /'
			=> array( 	'controller'	=> 'home',
						'action'		=> 'erro'
					)*/
	);
