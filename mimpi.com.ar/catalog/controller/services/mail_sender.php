<?php
class ControllerServicesMailSender extends Controller {
    public function index() {
        $this->language->load('information/contact');
        $error = $this->validate();
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$error) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->hostname = $this->config->get('config_smtp_host');
            $mail->username = $this->config->get('config_smtp_username');
            $mail->password = $this->config->get('config_smtp_password');
            $mail->port = $this->config->get('config_smtp_port');
            $mail->timeout = $this->config->get('config_smtp_timeout');				
            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_smtp_username'));
            $mail->setSender($this->request->post['name']);
            $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
            $mail->setText($this->getText());
            if($mail->send()){
                echo "Su consulta ha sido enviada!";
            }else{
                echo "Error al enviar el mensaje, por favor intente nuevamente en unos instantes";
            }
    	} else {
            echo $error;
        }
        
        die();
    }
    
    private function getText() {
        $newline = "\n";
        $text = 'Contacto de ' . $this->request->post['name'];
        $text .= ' desde mimpi.com.ar' . $newline;
        $text .= 'Email: ' . $this->request->post['email'] . $newline;
        $text .= 'Consulta: ' . strip_tags(html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8'));
        $text .= $newline . $newline . "--";
        return $text;
    }
    
    private function validate() {
        $error_data = '';
    	if (!isset($this->request->post['name']) || (utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
            $error_data .= $this->language->get('error_name') . "\n";
    	}

    	if (!isset($this->request->post['email']) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
            $error_data .= $this->language->get('error_email') . "\n";
    	}

    	if (!isset($this->request->post['enquiry']) || (utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
            $error_data .= $this->language->get('error_enquiry')  . "\n";
    	}
        
        if(!empty($error_data)) $error_data = "Por favor revise los siguientes erores en el formulario:\n" . $error_data;
        
    	/*if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
            $this->error['captcha'] = $this->language->get('error_captcha');
    	}*/
        
        return $error_data;
    }
}

?>