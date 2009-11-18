<?php
/*
 * Class assign to template for help routines htmls 
 */
class Helper{
	
	public static function link_to($name='', $to='', $html_options=''){
		$a = '<a href="' . self::url($to) . '" ' . $html_options . '>' . $name . '</a>';	
		return $a;
	}

	public static function checkbox($name, $value='',$check_value='', $id='_')
	{
		$html = '<input id="'.$id.'" value="1" type="checkbox" name="'.$name.'" ';
		if( $value == $check_value )
			$html .= 'checked="checked"';
			$html .= '/>';
			return $html;
	}
	public static function select_option($name, $value, $check_value, $prename='', $option='')
	{
		$html = '<option '.$option.' value="'.$value.'" ';
		if($value==$check_value)
			$html .= 'selected="selected"';
		$html.='>'.$prename.$name.'</option>';
		return $html;
	}
	/*
	 * verifica se utilizador esta connectado nas views
	 */
	public static function user_logged(){
		if(Session::get('user_id'))
			return true;
		else
			return false;		
	}
	
	public static function url_photo($photo, $version='', $field='name', $subfolder='photos')
	{
		return Helper::url(DIRECTORY_SEPARATOR.$subfolder.DIRECTORY_SEPARATOR.$photo->id.DIRECTORY_SEPARATOR.$version.DIRECTORY_SEPARATOR.$photo->$field);
	}
	
	public static function url($to){
		if(strcmp($to, 'back')==0):
            if(isset($_ENV["HTTP_REFERER"]))
                return $_ENV["HTTP_REFERER"];
            else
                return 'javascript:history.back()';
        else:
			$to = strtr($to, " ", "_");
			return Config::$url_path . Config::$url_path . $to;
		endif;
	}
	
	public static function img($to, $html_options='', $alt='', $border=0){
		return '<img src="'.self::url($to).'" '.$html_options.' alt="'.$alt.'" title="'.$alt.'" border="'.$border.'"/>';
	}
	
	function rand(){
		return mt_rand();
	}
	
	public static function select_language()
	{
		$html = '<select name="language" onchange="window.location = \'?lang=\'+this.options[this.selectedIndex].value"';
	}
	
	
	/**
	     * PAGINADOR DE QUALQUER TIPO DE DADOS
	     * Description: Retorna um html de paginação
	     *
	     * Ex: //..codigo que lista sua consulta
	            $records = $mymodel->find("SELECT * FROM mytable where name LIKE '%Pedro%' LIMIT " . ($resultsPerPag * $_REQUEST['p'] . " , $resultsPerPag");
	            showtablewithrecords( $records );
	            $totalsearch = $mymodel->count("SELECT * FROM mytable where name LIKE '%Pedro%'"
	     *        echo paginator($totalsearch, $resultsPerPage, $urlmysearch, 7);
	     *
	     * @param $aCount
	     * - quantidade total de dados que a consulta retorna =     COUNT(*)
	     * @param $resultsPerPage
	     * - Quantos registos por pagina esta definido em sua consulta
	     * @param $url
	     * - url que o paginador deve redirecionar para que voce possa tratar da pagina seguinte 
	     * @param $elements
	     * - quantidade de elementos que o paginador deve tratar
	     * @return $html gerado com as paginas
	     */
	    public function paginator($current_page, $aCount, $resultsPerPage=20, $url = '', $elements = 7, $previous_label = 'Anterior', $next_label = 'Proximo' ){
	        $page = ($current_page==0) ? 1 : $current_page;
	        $totalPages = round(($aCount / $resultsPerPage ) + 0.499, 0);
	        if($totalPages <=1)
	            return '';
	        $html = ($page > 1) ? self::link_to($previous_label, $url.'/'.($page-1), 'class="prev"' ) : '<span class="prev">'.$previous_label.'</span>';
	        $ii = $page - round(($elements-0.49)/2);
	        if($ii<1){
	            $ii=1;
	            $runpages = ($totalPages>$elements)? $elements : $totalPages;
	        }else if( ($page + round(($elements-0.49)/2)) > $totalPages){
	            $ii = $totalPages - ($elements - 1);
	            $runpages = $totalPages;
	        }else{
	            $runpages = $page + round(($elements-0.49)/2);
	            $ii = $page - round(($elements-0.49)/2);
	        }
	        if($totalPages<=$elements){    $runpages = $totalPages; $ii=1; }
	        for($i=$ii;$i<=$runpages; $i++){
	            $html .= ($page==$i) ? "<span class=\"current\">$i</span>" : self::link_to($i, $url.'/'.$i ); 
	        }
	        if($page < $totalPages){
	            $p = $page+1;
	            $html .= self::link_to($next_label, $url.'/'.$p, 'class="next"' );
	        }else{
	            $html .= '<span class="next">'.$next_label.'</span>';
	        }
	        return  $html;
	    }
	
	
	
	
	
	
}
?>