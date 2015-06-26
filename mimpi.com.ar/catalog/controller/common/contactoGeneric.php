<?php   
class ControllerCommonContactoGeneric extends Controller {
	private function index() {
		$this->template = $this->config->get('config_template') . '/template/common/generic-contacto.tpl';
		
		$this->data['horastamp'] = time();
		
    	$this->response->setOutput($this->render());
	}
	
	public function enviar() {  
		
		$listaErrores = "<div id='error'><h3 stlye='text-align: center;'>No se pudo realizar el env&iacute;o.</h3><ul>";
	
		$errores = "";
		
		//Validaciones
		if($_POST['name'] == "")
			$errores .= "<li>El campo Nombre no puede estar vac&iacute;o</li>";
		
		if($_POST['email'] == "")
			$errores .= "<li>El campo Email no puede estar vac&iacute;o</li>";
				
		if($_POST['text'] == "")
			$errores .= "<li>El campo Mensaje no puede estar vac&iacute;o</li>";	
			
		if ($errores == "")
		{
			//Si tardó menos de 10 segundos, fue un robot
			$timeLapsed = time() - $_POST['timestamp'];
			if($timeLapsed <= 10)
			{
				$errores .= "<li>Ha ocurrido un error. Intente nuevamente en unos minutos.</li>";
				$listaErrores .= $errores;
				$listaErrores .= "</ul></div>";
				echo $listaErrores;
				return;
			}
		
			// email de destino
			//contacto@lomatsa.com.ar
			//, jesicaharari@gmail.com
			$email = "ventas@mimpi.com.ar";
			
			// asunto del email
			$subject = "Contacto de Mimpi";

			// Cuerpo del mensaje
			$mensaje = "---------------------------------- \n";
			$mensaje.= "            Contacto               \n";
			$mensaje.= "---------------------------------- \n";
			$mensaje.= "NOMBRE:	".$_POST['name']."\n";
			$mensaje.= "MAIL:	".$_POST['email']."\n";
			
			if (isset($_POST["tel"]) && !empty($_POST["tel"])) {
				$mensaje.= "TEL:	".$_POST['tel']."\n";
			}
			
			$mensaje.= "FECHA:	".date("d/m/Y")."\n";
			$mensaje.= "HORA:	".date("h:i:s a")."\n";
			$mensaje.= "---------------------------------- \n\n";
			$mensaje.= $_POST['text']."\n\n";
			$mensaje.= "---------------------------------- \n";
			$mensaje.= "Enviado desde http://www.mimpi.com.ar \n";

			// headers del email
			$headers = "From: ".$_POST['email']."\r\nBcc: jesicaharari@gmail.com\r\n";
			//$headers = "From: ".$_POST['email']."\r\n";

			// Enviamos el mensaje
			if (mail($email, $subject, $mensaje, $headers)) {
				$rta = "<div id='success'>Su mensaje fue enviado correctamente.</div>";
			} else {
				//$rta = "<div id='success'>Su mensaje fue enviado correctamente.</div>";
				$rta = "<div id='error'>Ocurri&oacute; un error en el env&iacute;o. Por favor, pruebe nuevamente en unos minutos...</div>";
			}
			echo $rta;
		}
		else
		{
			$listaErrores .= $errores;
			$listaErrores .= "</ul></div>";

			//echo "<div id='success'>Su mensaje fue enviado correctamente.</div>";
			echo $listaErrores;
		} 
	}
	public function newsletter() {  
		$errores = "";
		$hayArroba = strpos($_POST['email'], "@");
		
		if($_POST['email'] == ""|| $hayArroba === false)
			$errores .= "Email Inv&aacute;lido";
				
		if ($errores == "")
		{
			$content = $_POST['email'] . "\r\n";
			$fh = fopen("mails.txt", "a");

			fwrite($fh, $content);
			fclose($fh);
			
			echo "Su direcci&oacute;n de email fue agregada con &eacute;xito.";
		}
		else
		{
			echo $errores;
		} 
	}
}
?>
