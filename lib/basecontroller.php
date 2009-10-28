<?php
	/**
	 * TODO:doc
	 */
	class BaseController extends ApplicationController{
		
		const NOT_FOUNT 		= 63487;
		const NOT_FOUNT_METHOD 	= 129023;
		const NOT_FOUNT_CLASS 	= 260096;
		const NOT_FOUNT_FILE 	= 522239;
		/**
		 * Object VIEW of BaseController. Here assing variables and objects to Smarty Template Engine
		 * @var View Object
		 */
		public $view ;
		
		/**
		 * @var boolean
		 */
		public $caching = false;
		
		/**
		 * location of layout file
		 * @var string
		 */
		public $layout 	= 'layout/default';
		
		//TODO:translate
		/**
		 * Determina quais as actions que deseja cachear, ou ent‹o atribui 'all' para todos os actions
		 * @var array or string
		 */
		public $cache	 = array();

		static $_instance = null;
		static $_request = null;
		
		/**
		 * TODO:doc
		 */
		function __construct(){}
		
		
		/**
		 * TODO:doc
		 */
		public function _run_controller(){
			$this->view = new View();
			$this->view->register_compiler_function('content_action',array($this->view, 'content_action'));
			
			//flash mensage of redirect_to command
			if( $this->view->flash == '' && isset($_COOKIE['flash_xpto']) ){
				$this->view->flash = urldecode($_COOKIE['flash_xpto']);
				unset($_COOKIE['flash_xpto']); setcookie('flash_xpto','', time()-3600 , '/');
			}
			
			$this->view->layout = $this->layout;
			
			//run function of application controller before any action
			if (isset($this->before_filter)) {
				foreach($this->before_filter as $method ){
					$this->{$method}();
				}
			}
			
			//run function of controller before filter any action
			$this->before_filter();

			
			$this->run_action();
			$this->view->caching = $this->caching;
			if ($this->view->_get_output!=true):
				$this->display();
			endif;
			
			//run function application controller after action
			if (isset($this->after_filter)) {
				foreach($this->after_filter as $method ){
					$this->{$method}();
				}
			}
			$this->after_filter();
		}
		
		
		/**
		 * TODO:doc
		 */
		private function run_action(){
			if( !isset($GLOBALS['action']) || !method_exists( $this , $GLOBALS['action']) ){
				throw new Exception('Method not found', self::NOT_FOUNT_METHOD);
				//return $this->error404();
			}
			$ar_params = BaseController::dispatchurl(BaseController::$_instance);
			switch(count($ar_params)){
				case 3:
			 		return $this->{$GLOBALS['action']}($ar_params[2]);
				case 4:
				 	return $this->{$GLOBALS['action']}($ar_params[2], $ar_params[3]);
				case 5:
					return $this->{$GLOBALS['action']}($ar_params[2], $ar_params[3], $ar_params[4]);
				case 6:
					return $this->{$GLOBALS['action']}($ar_params[2], $ar_params[3], $ar_params[4], $ar_params[5]);
				case 7:
					return $this->{$GLOBALS['action']}($ar_params[2], $ar_params[3], $ar_params[4], $ar_params[5], $ar_params[6]);
				default:
					return $this->{$GLOBALS['action']}();
			}
		}
		
		
		/**
		 * TODO:doc
		 */
		private function cache_file()
		{
			return Config :: $path_webroot . 'cache/'. BaseController :: $_instance . "/index.html";//BaseController::request() . "/index.html";
		}
		
		/**
		 * TODO:doc
		 */
		private function cache_dir()
		{
			return Config :: $path_webroot . 'cache/'. BaseController :: $_instance;//BaseController::request();
		}
		
		
		/**
		 * TODO:doc
		 */
		private function save_cache( $out_put)
		{
			mkdir( $this->cache_dir(), 0777, true );
			file_put_contents($this->cache_file() , $out_put);
		}
		
		/**
		 * Get content of templates layout and action and save in cache
		 */
		private function display(){
			$out_put = $this->view->display();
			if ( @in_array( $GLOBALS['action'], $this->cache ) ||  $this->cache=='all'):
				//Save cache
				@$this->save_cache( $out_put );
			endif;
			echo $out_put;
		}
		
		
		/**
		 * Return request address
		 */
		public static function request()
		{
			if (BaseController :: $_request == null):
				$request = $_SERVER['REQUEST_URI'];
				if(Config::$url_path != '/')://Sanatize url path
					$request = str_replace(Config::$url_path, '', $request);
				endif;
				$request = preg_replace ('/^\//', '', $request);//remove first bar
				$request = preg_replace ('/#.*/', '', $request);//remove ancor
				if (preg_match('/\?/', $request)):
					$ar = split('\?', $request);
					$_GET = BaseController::unserialize_get($ar[1]);
					$request = $ar[0];
				endif;
				BaseController :: $_request = preg_replace ('/\/$/', '', $request);
			endif;
			
			return BaseController :: $_request;
		}
		
		
		/**
		 * TODO:doc
		 */
		private function unserialize_get($get){
			$ar = split('&', $get);
			foreach ($ar as $value)
				{$_get = split('=', $value); $_gets[$_get[0]]=$_get[1];}
			return $_gets;
		}
		
		
		/**
		 * TODO:doc
		 */
		private static function dispatchurl( $request ){
			$paramsurl = explode("/", $request);
			return $paramsurl;
		}
		
		
		/**
		 * TODO:doc
		 */
		public static function routes($request)
		{
			$routes = array();
			@include('routes.php');
			foreach ($routes as $route => $values):
				$count = 0;
				$request2 = preg_replace( $route, join('/', $values), $request, 1, $count );
				if( $count > 0 ):
					return $request2;
					break;
				endif;
			endforeach;
			return $request;
		}
		
		
		/**
		 * TODO:doc
		 */
		public static function dispatchcontroller(){
			if(!$GLOBALS['controller']):
				BaseController::$_instance = BaseController::routes(BaseController::request());
				$ar_params = BaseController::dispatchurl(BaseController :: $_instance);
				$GLOBALS['controller'] = $ar_params[0] ;
				$GLOBALS['action'] = $ar_params[1];
			endif;
			return $GLOBALS['controller'];
			
		}
		
		
		/**
		 * TODO:doc Smarty
		 */
		private function clear_cache_action($action_name=false){
			if($action_name)
				$this->view->clear_cache($this->view->path_view_action());
			else
				$this->view->clear_cache($action_name);
		}
		
		/**
		 * TODO:doc
		 */
		/*public function url($ary){
			if(is_array($ary))
				$url = implode("/", $ary);
			return $url;
		}*/
		
		/**
		 * TODO:doc
		 */
		public function error404($value='<h1>Nao foi possivel encontrar recurso.</h1>'){
			return $value;
		}
		
		/**
		 * Function redirect_to
		 * Redirect action to parameter address
		 * If set flash mesage, save for show in next template
		 *
		 * @param $to String
		 * return void()
		 */
		public function redirect_to($to){
			$helper = new Helper();
			if( $this->view->flash != '' ){
				setcookie('flash_xpto',urlencode($this->view->flash), time()+3600, '/');
			}
			header('location:'. $helper->url($to));
			exit;
		}
		
		protected function after_filter()
		{
			//code...
		}
		protected function before_filter()
		{
			//code...
		}
		
	}
	
	
	
?>