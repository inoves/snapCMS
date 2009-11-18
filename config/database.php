<?php 


if (ENVIRONMENT=='dev'):
	define('AR_HOST',    'localhost');
	define('AR_DB',      'survival2012');
	define('AR_USER',    'root');
	define('AR_PASS',    '');
elseif (ENVIRONMENT=='prod'):
	define('AR_HOST',    'localhost');
	define('AR_DB',      'survival2012');
	define('AR_USER',    'root');
	define('AR_PASS',    '');
endif;


define('AR_ADAPTER', 'MySQL'); // could be 'PDO'
define('AR_DRIVER',  'mysql');
define('AR_PREFIX', '');

/* used in generate.php to determine which tables we want models for
  remove or unset if all tables in a db are wanted */
$AR_TABLES = array(
	/*'manufactures'
	'tags',
	'pages_tags'
	'photos',
	'attributes',
	'comments',
	'containers',
	'customers',
	'menus',
	'pages',
	'pages_descriptions',
	'product_attributes',
	'pages_products',
	'pages_tags',
	'tags',
	'page_produtcs',
	'users'*/
);

