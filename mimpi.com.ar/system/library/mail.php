<?php
class Mail {
    protected $to;
    protected $from;
    protected $sender;
    protected $subject;
    protected $text;
    protected $html;
    protected $attachments = array();
    public $protocol = 'mail';
    public $hostname;
    public $username;
    public $password;
    public $port = 25;
    public $timeout = 5;
    public $newline = "\n";
    public $crlf = "\r\n";
    public $verp = false;
    public $parameter = '';

    public function setTo($to) {
        $this->to = $to;
    }

    public function setFrom($from) {
        $this->from = $from;
    }

    public function setSender($sender) {
        $this->sender = $sender;
    }

    public function setSubject($subject) {
        $this->subject = $subject;
    }

    public function setText($text) {
        $this->text = $text;
    }

    public function setHtml($html) {
        $this->html = $html;
    }

    public function addAttachment($filename) {
        $this->attachments[] = $filename;
    }

    public function send() {
        if (!$this->to) {
            trigger_error('Error: E-Mail to required!');
            exit();			
        }

        if (!$this->from) {
            trigger_error('Error: E-Mail from required!');
            exit();					
        }

        if (!$this->sender) {
            trigger_error('Error: E-Mail sender required!');
            exit();					
        }

        if (!$this->subject) {
            trigger_error('Error: E-Mail subject required!');
            exit();					
        }

        if ((!$this->text) && (!$this->html)) {
            trigger_error('Error: E-Mail message required!');
            exit();					
        }

        $mail  = new PHPMailer();

        if (is_array($this->to)) {
            foreach ($this->to as $toTmp){
                $mail->AddAddress($toTmp);
            }
        } else {
            $mail->AddAddress($this->to);
        }

        $mail->Subject = $this->subject;

        $mail->AddReplyTo($this->from, $this->sender);
        $mail->SetFrom($this->from, $this->sender);
        $mail->AddReplyTo($this->from, $this->sender);

        if (!$this->html) {
            $mail->Body = $this->text;
        } else {
            $mail->MsgHTML($this->html);
            if ($this->text) {
                $mail->AltBody = $this->text;
            } else {
                $mail->AltBody = 'This is a HTML email and your email client software does not support HTML email!';
            }
        }

        foreach ($this->attachments as $attachment) {
            if (file_exists($attachment['file'])) {
                $mail->AddEmbeddedImage($attachment['file'], $attachment['filename']);
            }
        }

        if ($this->protocol == 'smtp') {
            $mail->IsSMTP();
            $mail->Host = $this->hostname;
            $mail->Port = $this->port;
            if($this->port == '587'){
                $mail->SMTPAuth = true;
                $mail->SMTPSecure = "tls";
            } elseif ($this->port == '465') {
                $mail->SMTPAuth = true;
                $mail->SMTPSecure = "ssl";
            }
            if (!empty($this->username) && !empty($this->password)) {
                $mail->SMTPAuth = true;
                $mail->Host = $this->hostname;
                $mail->Username = $this->username;
                $mail->Password = $this->password;
            }
        }
        try{ 
            if(!$mail->Send()){
				
                trigger_error('Could not send email');
                return false;
            }else{
                return true;
            }
        }catch(Exception $e){
            //trigger_error($e->getMessage);
            return false;
        }
    }
}
?>