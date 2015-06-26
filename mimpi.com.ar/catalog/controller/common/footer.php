<?php

class ControllerCommonFooter extends Controller {

    protected function index() {
        $this->language->load('common/footer');

        $this->data['text_site'] = $this->language->get('text_site');
        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_products'] = $this->language->get('text_products');
        $this->data['text_contact'] = $this->language->get('text_contact');
        $this->data['text_stores'] = $this->language->get('text_stores');
        $this->data['text_request'] = $this->language->get('text_request');
        $this->data['text_sale'] = $this->language->get('text_sale');
        $this->data['text_voucher'] = $this->language->get('text_voucher');
        $this->data['text_affiliate'] = $this->language->get('text_affiliate');
        $this->data['text_special'] = $this->language->get('text_special');
        $this->data['text_account'] = $this->language->get('text_account');
        $this->data['text_order'] = $this->language->get('text_order');
        $this->data['text_wishlist'] = $this->language->get('text_wishlist');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');

        $this->data['home'] = $this->url->link('common/home');
        $this->data['contact'] = $this->url->link('information/contact');
        $this->data['products'] = $this->url->link('product/category');
        $this->data['faqs'] = $this->url->link('information/request');
        $this->data['sale'] = $this->url->link('product/category') . '&path=' . SALE_CATEGORY_ID;
        $this->data['year'] = date('Y');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
        } else {
            $this->template = 'default/template/common/footer.tpl';
        }

        $this->render();
    }

}

?>