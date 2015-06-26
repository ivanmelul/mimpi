<script type="text/javascript">
			
 $(document).ready( function(){	
	$("#btnSend").click(function(){
		var name, email, timestamp, text;
		
		name = $("#nombre").val();
		email = $("#mail_contacto").val();
		text = $("#consulta").val();
		timestamp = $("#timeStamp").val();
		
		var parameters = {
			'name'	: name,
			'email'	: email,
			'text'	: text,
			'timestamp'	: timestamp
		};
		
		sendData("<?php echo $this->url->link('common/contactoGeneric/enviar');?>",parameters,$("#emailSendResponse"), $("#contactForm"));
	});
	
	$("#mail_newsletter").click(function(){
		$(this).val("");
	});
	
	$(".enter").click(function() {
		var email = $("#mail_newsletter").val();
		
		var parameters = {
			'email'	: email
		};
		
		sendData("<?php echo $this->url->link('common/contactoGeneric/newsletter');?>",parameters,$("#newsletterResponse"), $(".newsletter"));
	});
	
});

	function sendData(url,params,responseContainer, blockContainer){
		$(blockContainer).block({ message: '<h3><img src="image/busy.gif" />Enviando...</h3>',
									css: { padding: '30px 20px 20px 20px'}}); 
		$.ajax({
			url: url,
			type: "POST",
			data: params,
			success: function(datos) {
				$(responseContainer).html(datos);
				$(blockContainer).unblock(); 
			}
		});
	}	
</script>
<div style="clear:both"></div>
<div id="footer" style="margin-top:20px; padding: 0 0px;">

<div style="border: 1px solid black; margin-bottom: 0px; padding: 20px;">
	
	<div class="contact-footer">
		<div class="newsletter left">
			<h3>Suscribite al newsletter</h3>
			<div class="separador"></div>
			<div id="newsletterResponse"></div>
			<input type="text" value="Ingres&aacute; tu email aqu&iacute;" name="mail" id="mail_newsletter" class="input-text"/>
			<span class="enter">></span>
			<span class="clear"></span>
		</div>
		<div class="contact left">
			<h3>Contacto</h3>
			<div class="separador"></div>
			<span class="datos">Horario de atenci&oacute;n 9:00 a 18:00hs</span>
			<span class="datos">Atenci&oacute;n al cliente 4637-6203</span>
			<span class="datos">ventas@mimpi.com.ar</span>
		</div>
		<div class="follow left">
			<h3>Seguinos</h3>
			<div class="separador"></div>
			<div style="width: 84px; margin: 0 auto;">
				<a href="https://www.facebook.com/Mimpikids" target="_BLANK"><span class="fb"></span></a>
				<a href="http://instagram.com/mimpikids" target="_BLANK"><span class="instagram"></span></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
</div>

	<div id="footer_down" <?php if(strrpos($_SERVER["REQUEST_URI"], "common/home" ) > 0 || strrpos($_SERVER["REQUEST_URI"], "route=" ) === false){echo "style='display:none'";}?>>
		<div class="left">
			<h4>mimpi</h4>
			<span class="info">Una empresa familiar con una trayectoria de m&aacute;s de 30 a&ntilde;os dedicada a la indumentaria para chicos.</span>
			<ul>
				<li><a href="<?php echo $this->url->link('information/request&path=3');?>">C&oacute;mo comprar</a></li>
				<li><a href="<?php echo $this->url->link('account/login');?>">Login</a></li>
				<li><a href="<?php echo $this->url->link('information/request&path=8');?>">Preguntas Frecuentes</a></li>
				<li><a href="<?php echo $this->url->link('account/register');?>">Registrarse</a></li>
				<li><a href="<?php echo $this->url->link('information/request&path=2');?>">Sucursales</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<div class="left">
			<h4>colecci&oacute;n '15</h4>
			<span class="info high-size">Mimpi Summer 2015</span>
			<div>
				<ul>
					<li><a href="<?php echo $this->url->link('product/category');?>">Nuestros Productos</a></li>
					<li><a href="<?php echo $this->url->link('product/category&path=3');?>">Beb&eacute;</a></li>
					<li><a href="<?php echo $this->url->link('product/category&path=1');?>">Nena</a></li>
					<li><a href="<?php echo $this->url->link('product/category&path=4');?>">Beba</a></li>
					<li><a href="<?php echo $this->url->link('product/category&path=2');?>">Var&oacute;n</a></li>
					<li><a href="<?php echo $this->url->link('product/category&path=3');?>">Reci&eacute;n Nacido</a></li>
					<div class="clear"></div>
				</ul>
			</div>
		</div>
		<div class="left">
			<h4>contacto</h4>
			<form class="contact-form" id="contactForm" style="display: block;">
				<div id="emailSendResponse"></div>
				<input type="hidden" name="timeStamp" id="timeStamp" value="<?php echo time();?>"/>
				<div>
					<span class="field">Nombre</span><input type="text" name="nombre" id="nombre"/>
				</div>
				<div>
					<span class="field">E-mail</span><input type="text" name="mail_contacto" id="mail_contacto"/>
				</div>
				<div>
					<textarea name="consulta" id="consulta"></textarea>
				</div>
				<div class="form-action">
					<input type="button" value="enviar" name="enviar" id="btnSend"/>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</form>
		</div>
		<div class="clear"></div>
	</div>
	<div class="copyright">
		<h4>Todos los derechos reservados Mimpi 2014.</h4>
		<a href="http://www.whif.com.ar/" target="_BLANK"><span class="whif-logo"></span></a>
	</div>

</div>
<!--<a class="right" href="http://www.whif.com.ar/" target="_blank" style="height: 0px;">
    <div id="whif-logo" alt="whif media group" title="Whif Media Group" style="padding-right: 60px;"></div>
</a>-->
</body>
</html>