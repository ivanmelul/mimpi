<?php echo $header; ?>
		
		<script type="text/javascript">
					
		 $(document).ready( function(){	
			$("#btnEnviar").click(function(){
				var name, email, tel, timestamp, text;
				
				name = $("#nombre").val();
				email = $("#email").val();
				tel = $("#tel").val();
				text = $("#mensaje").val();
				timestamp = $("#timeStamp").val();
				
				var parameters = {
					'name'	: name,
					'email'	: email,
					'tel'	: tel,
					'text'	: text,
					'timestamp'	: timestamp
				};
				
				sendData("<?php echo $this->url->link('common/contactoGeneric/enviar');?>",parameters,$("#emailSendResponse"), $("#contactForm"));
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
		
		<div id="content" class="faq" style="padding-top: 0;">
			<div id="contact-top" style="border: 1px solid grey; border-top: none; height: 100px;"></div>
			<div id="contacto">
				<div class="left informacion-contacto">
					<h3>Contacto</h3>
					<h4>MIMPI</h4>
					<h4>Por consultas o información:</h4>
					<div class="contact-header">					
						<h4><a href="http://www.mimpi.com.ar">www.mimpi.com.ar</a></h4>
						<h4>ventas@mimpi.com.ar</h4>
					</div>	
					<div class="contact-seccion">
						<h4>Horario de atención</h4>
						<h4>Lunes a viernes de 9:00 a 18:00 HS.</h4>
					</div>	
					<div class="contact-seccion">
						<h4>Info y ventas</h4>
						<h4>(011) 4611-4762 Ó 4637-6203</h4>
					</div>	
					<div class="contact-seccion">
						<h4>Showroom</h4>
						<h4>Neuquén 2778 - Flores - Capital Federal</h4>
					</div>
				</div>
				<div class="left formulario">
					<h3>Formulario de contacto</h3>
					<form class="contact-form" id="contactForm">
						<div id="emailSendResponse"></div>
						<input type="hidden" name="timeStamp" id="timeStamp" value="<?php echo time();?>"/>
						<div class="contact-field">
							<label for="nombre">Nombre</label>
							<input type="text" name="nombre" id="nombre" />
						</div>
						<div class="contact-field">
							<label for="email">E-mail</label>
							<input type="text" name="email" id="email"/>
						</div>
						<div class="clear"></div>
						<div class="contact-field">
							<label for="tel">Tel + cod. &aacute;rea</label>
							<input type="text" name="tel" id="tel"/>
						</div>
						<div class="clear"></div>
						<div class="contact-field textarea">
							<label for="mensaje">Mensaje</label>
							<textarea id="mensaje"></textarea>
						</div>
						<div class="clear"></div>
						<div class="contact-buttons">
							<input class="send-input" id="btnEnviar" type="button" value="enviar" />
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
			<?php echo $content_top; ?>
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $footer;?>
 </div>