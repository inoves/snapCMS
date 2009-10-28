<?php
class StoreController extends BaseController
{
	
	//move applicationcontroller public $layout = 'layout/default';
	
	public function index(){
		$this->show();
	}
	public function show(){
		$this->view->template_action = 'store/show';
	}
	
	public function add($page_id=0, $attrib=null){
		try {
			if( $attrib == null && Page::find($page_id)->product_attributes() ):
				$this->view->flash = '<p class="notice">' . Labels::$lang[$this->get_language()]['select_attrib'] . '</p>';
				$this->redirect_to( '/page/' . $page_id );
			endif;
			$this->view->cart->add_item($page_id, $attrib);
			$_SESSION['cart'] = $this->view->cart;
			$this->redirect_to('/store');
		} catch (Exception $e){
			//Logger
			$this->view->flash = '<p class="error">Error. Try again. (Tente novamente)</p>';
			$this->redirect_to('/');
			
		}
	}
	public function remove($uuid=false){
		$this->view->cart->remove_item($uuid);
		$_SESSION['cart'] = $this->view->cart;
		//$this->show();
		$this->redirect_to('/store');
	}
	public function update($id=0){$this->redirect_to('/store');}
	
}
//TODO: Como calcular o transporte
//TODO: como calcular a cobrança
//TODO: Ver em Amazon como é mostrado o IVA