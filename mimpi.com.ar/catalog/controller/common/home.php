<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->load->model('design/banner');
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}

        //Banner slider
        $this->data['banners'] = array();
        
        //15 es el banner de home
        $results = $this->model_design_banner->getBanner(15);
              
        foreach ($results as $result) {
            if (file_exists(DIR_IMAGE . $result['image'])) {
                $this->data['banners'][] = array(
                    'title' => $result['title'],
                    'link'  => $result['link'],
                    'image' => $result['image']
                );
            }
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