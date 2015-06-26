<?php

class ControllerInformationRequest extends Controller {
    public function index() {
		
		if(!empty($_GET["path"])){
			switch ($_GET["path"]){
				case "2":		
					$this->document->setTitle("Nuestros locales");
				break;
				case "3":
					$this->document->setTitle("Como Comprar");
				break;
				case "4":
					$this->document->setTitle("Quienes Somos");
				break;
				case "5":
					$this->document->setTitle("Contacto");
				break;
				case "8":
					$this->document->setTitle("Preguntas Frecuentes");
				break;
				case "9":
					$this->document->setTitle("Lookbook");
					$this->load->model('design/banner');
					$this->data['banner'] = $this->model_design_banner->getBanner(15);
				break;
			}
		}else{
			$this->document->setTitle($this->language->get('Looks we love'));
		}
		
		$this->language->load('information/request');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/request.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/request.tpl';
		} else {
			$this->template = 'default/template/information/request.tpl';
		}
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
		$this->response->setOutput($this->render());
    }
}

?>
