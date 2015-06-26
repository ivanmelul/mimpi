<?php

class ControllerProductCampaign extends Controller {

    public function index() {
        $this->document->setTitle('Pido Gancho :: Campaña');
        $this->document->setDescription('Campaña');

        $this->data['heading_title'] = 'Campaña';

        $this->load->model('design/banner');
        $this->load->model('tool/image');

        $results = $this->model_design_banner->getBanner(CAMPAIGN_BANNER_ID);

        $width = 156;
        $height = 206;

        foreach ($results as $result) {
            if (file_exists(DIR_IMAGE . $result['image'])) {
                $this->data['banners'][] = array(
                    'title' => $result['title'],
                    'link' => $result['link'],
                    'image' => $this->model_tool_image->resize($result['image'], $width, $height)
                );
                $this->data['tooltips'][] = array(
                    'title' => $result['title'],
                    'link' => $result['link'],
                    'image' => $this->model_tool_image->resize($result['image'], 120, 51)
                );
            }
        }

        $this->document->addScript('catalog/view/javascript/campaign/js/slider.js');
        $this->document->addScript('catalog/view/javascript/campaign/js/jquery.easing.1.3.js');
        
        $this->document->addStyle('catalog/view/javascript/campaign/css/jquery.ui.core.css');
        $this->document->addStyle('catalog/view/javascript/campaign/css/jquery.ui.slider.css');
        $this->document->addStyle('catalog/view/javascript/campaign/css/jquery.ui.theme.css');
        $this->document->addStyle('catalog/view/javascript/campaign/css/style.css');
        
        $this->template = $this->config->get('config_template') . '/template/product/campaign.tpl';

        $this->children = array(
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

}

?>