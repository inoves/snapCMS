<?php
class TracksController extends BaseController
{
	//All actions need to be logged
	var $before_filter = array('logged');
	
	//Change default Template//  var $layout = 'layout/template';
	var $layout = 'layout/layout';
	
	
	/*
	 * redirect to list sites
	 */
	function index(){
		//List sites
		$this->sites();
		$this->view->template_action = 'sites';
	}

	
	/*
	 * List sites
	 */
	function sites(){
		$sites = Site::find('all');
		$this->view->sites = $sites;
	}
	
	
	/*
	 * List campaigns to site
	 */
	function campaigns($site=''){
		if($site!=''){
			//select site
			$s = Site::find('first', array(
				'conditions'	=> "name = ".ActiveRecord::quote($site)
			));
			
			$this->view->site = $s->name;
			if($site != 'all'){
				//list campaigns
				setcookie('site', $site);
				$_COOKIE['site'] = $site;
				$this->view->campaigns = $s->my_campaigns();
			}else{
				$this->view->campaigns = Campaign::find('all', array('order'=>'id DESC'));
				
			}
			
			
		}else{
			//List sites
			$this->sites();
			$this->view->template_action = 'sites';
			
		}
	}
	
	
	/*
	 * Make Charts
	 */
	function chart($campaign_id=''){
		
		$campaign = Campaign::find(intval($campaign_id));
		$site = Site::find($campaign->site_id);
		$this->view->campaign = $campaign;
		$this->view->site = $site;
		
		$sql = 'SELECT hit_date as d, count(*) as c FROM hits WHERE campaign_id='. $campaign->id .' GROUP BY hit_date ORDER BY hit_date';
		$hits = Hit::query($sql);
		
		//scope and start values for data loops
		$data = ''; $xaxis = ''; $i = 1;$count = 0;
		$count_date = count($hits);
		$line_point = $count_date / 30;
		$date_point = $count_date / 10;
		$i_l = 0;
		$i_d = 0;
		foreach($hits as $h){
			$data .= '['.$i.', '.$h['c'].'], ';
			if( $i_d >= $date_point ){
				$xaxis .= '['.$i.', "'.$h['d'].'"], ';
				$i_d=0;
			}/*elseif( $i_l >= $line_point ){
				$xaxis .= '['.$i.'], ';
				$i_l=0;
			}*/
			$i_d++; $i_l++; $i++;
			$count = $count + intval($h['c']);
		}
		
		$data = substr_replace($data,"",-2);
		$xaxis = substr_replace($xaxis,"",-2);
		
		$this->view->xaxis 	= $xaxis;
		$this->view->data 	= $data;
		$this->view->count 	= $count;
	}
	
	/*
	 * Add new campaign
	 */
	function new_campaign(){
		
		if($_POST){
			$site = Site::find( $_REQUEST['site_id'] );
			if($site){
				$camp = new Campaign(array(
					'name'			=>	$_REQUEST['name'],
					'description'	=>	$_REQUEST['description'],
					'site_id'		=>	$site->id
				));
				$camp->save();
			}
		}

		$sites = Site::find('all');
		$this->view->sites = $sites;
		
		
	}
	
	
	/*
	 * Verify if user logged, before any methods.
	 */
	protected function logged(){
		if(!User::logged())
			$this->redirect_to('home/login');
	}
	
}
?>