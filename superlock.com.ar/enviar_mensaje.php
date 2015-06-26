<?php

	//log 	
	$date = date('d/m/Y H:i:s');

	$file = 'log.txt';
	$message = "\n".$date."\n".$_REQUEST['nombre_apellido']."\n".$_REQUEST['email']."\n".$_REQUEST['telefono']."\n".$_REQUEST['mensaje']."\n";
	file_put_contents($file, $message, FILE_APPEND | LOCK_EX);

	// email de destino
	$email = "info@puertassuperlock.com.ar";

	// asunto del email
	$subject = "Contacto Superlock";

	// Cuerpo del mensaje
	$mensaje = "---------------------------------- \n";
	$mensaje.= "            Contacto               \n";
	$mensaje.= "---------------------------------- \n";
	$mensaje.= "NOMBRE:	".$_REQUEST['nombre_apellido']."\n";
	$mensaje.= "MAIL:	".$_REQUEST['email']."\n";
	$mensaje.= "TEL:	".$_REQUEST['telefono']."\n";
	$mensaje.= "FECHA:	".date("d/m/Y")."\n";
	$mensaje.= "HORA:	".date("h:i:s a")."\n";
	$mensaje.= "---------------------------------- \n\n";
	$mensaje.= $_REQUEST['mensaje']."\n\n";
	$mensaje.= "---------------------------------- \n";
	$mensaje.= "Enviado desde http://www.superlock.com.ar \n";

	
	// Enviamos el mensaje
	if (mail($email, $subject, $mensaje))
		echo "Su mensaje ha sido enviado!!";
	else
		echo "Ha ocurrido un error, por favor, pruebe en unos minutos..";
?>
