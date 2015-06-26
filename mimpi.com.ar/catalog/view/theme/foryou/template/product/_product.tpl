<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="product-info">
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
      <div class="zoom-section"> 
		<div class="zoom-small-image"><a href="<?php echo $popup; ?>" class = 'cloud-zoom' id='zoom1' rel="adjustX: 10, adjustY:-4" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" id="image"  /></a></div>
      </div>
	  <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
		<div id="carousel" style="background-repeat:no-repeat";>  
			<ul class="jcarousel-skin-opencart">
				<?php foreach ($images as $image) { ?>
				<li>
				<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox">
					<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
				</a>
				<li>
				<?php } ?>
			</ul>
		</div>
		<script type="text/javascript"><!--
		
		
		$('#carousel ul').jcarousel({
			vertical: false,
			visible: 4,
			scroll: 1,
			auto: 4,
			wrap: 'circular'
		});
		</script>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="right">
      <div class="title"><span style="color:rgb(196, 183, 183);"><?php echo $heading_title; ?></span></div>
      <div class="detail">
          <span style="color:rgb(196, 183, 183);"><?php echo $description; ?><span><br />
      </div>
      <div class="description">
        <span style="color:rgb(196, 183, 183);"><?php echo $text_model; ?></span><br /><?php echo $model; ?>
      </div>
      <?php if ($price) { ?>
      <div class="price"><span style="color:rgb(196, 183, 183);"><?php echo $text_price; ?></span><br/>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
      </div>
      <?php } ?>
      <?php if ($options) { ?>
      <div class="options">
        <h2 style="color:rgb(196, 183, 183);"><?php echo "Detalles"; ?></h2>
        <br />
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			<div>
				<?php if ($option['required']) { ?>
				<span class="required">*</span>
				<?php } ?>
				<?php $Opciones = explode("-",$option['name']);?>
				<div style="width:75px; display: inline-block;"><b><?php echo strtoupper($Opciones[0]); ?></b></div>
				<div style="width:60px; display: inline-block;"><b><?php echo strtoupper($Opciones[1]); ?></b></div>
				<div style="width:90px; display: inline-block;"><b>CANTIDAD</b></div>
			</div>
				<?php 
				$Color = "";
				$back1 = "#f4f4f4";
				$back2 = "#111";
				$backMostrar = "";
				$i = 0;
				foreach ($option['option_value'] as $option_value) { ?>
				<?php $OpcionesContenido = explode("-",$option_value['name']); //$option_value['name'] es rojo-s
				//Si cambia de color, debe crear una nueva tabla con un background distinto al que creo anteriormente;
				if ($OpcionesContenido[0] != $Color){
					$Color=$OpcionesContenido[0];
					$ColorMostrar = $OpcionesContenido[0];
					//echo $backMostrar." y ".$back2."</br>";
					if ($backMostrar == $back2){
						$backMostrar = $back1;
						?><table class="TablaProducto" style="width: 280px; background:#f4f4f4;">
						<tr style="background: #f4f4f4;"><?php
					}else{
						//echo "lalalalalalal";
						$backMostrar = $back2;
						?><table class="TablaProducto" style="width: 280px; background:rgb(228, 228, 228);">
						<tr style="background: rgb(228, 228, 228);"><?php
					}?>
					
				<?php }else{
					$ColorMostrar="";
				}?>
					<td style="width: 68px; text-align:left;"><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"> </label><b><?php echo $ColorMostrar;?></b></td>
					<td style="width: 68px; text-align:center;><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"> </label><?php echo $OpcionesContenido[1]; //$option_value['name'] es rojo-s?></td>
					<?php $i ++; ?>
					<td><input type="text" name="quantity-<?php echo $option_value['name'];?>" id="quantity-<?php echo $i;?>" style="width: 60px;" /></td> <?php //onchange="javascript:ValorCheckbox(echo $i;);" ?>
					<!-- <input id="checkbox-<?php //echo $i;?>" type="checkbox" style="display:none;" name="option[<?php //echo $option['product_option_id']; ?>][]" value="<?php //echo $option_value['product_option_value_id']; ?>" id="option-value-<?php //echo $option_value['product_option_value_id']; ?>" /> -->
				
					<?php if ($option_value['price']) { ?>
					(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
					<?php } ?>
				</tr>
				<?php } ?>
			</table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($attribute_groups) { ?>
      <div class="attributes">
        <table class="attribute" cellspacing="2px">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
        <?php if ($attribute_group['attribute_group_id'] == $size_attr_group_id) { ?>
        <thead>
            <tr>
            <td colspan="5"><?php echo $attribute_group['name']; ?></td>
            </tr>
        </thead>
        <tbody>
            <tr>
            <?php foreach ($sizes_attributes as $size_attribute) { ?>
            <?php if (in_array($size_attribute, $attribute_group['attribute'])) { ?>
            <td class="active"><?php echo $size_attribute; ?></td>
            <?php } else { ?>
            <td><?php echo $size_attribute; ?></td>
            <?php } ?>
            <?php } ?>
            </tr>
        </tbody>
        <?php } ?>
        <?php } ?>
        </table>
      </div>
      <?php } ?>
      <div class="cart">
        <div>
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          &nbsp;
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" style="background: rgb(235, 68, 68); height: 38px;"/>
        </div>
      </div>
      <div class="review">
        <div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a href="#"><img src="/catalog/view/theme/foryou/image/home/social_fb_off.png" style="margin-top: 2px;"/></a></div>
          <div class="addthis_default_style"><a href="#"><img src="/catalog/view/theme/foryou/image/home/social_twitter_off.png" style="margin-top: 5px;"/></a></div>
          <div class="addthis_default_style"><a href="#"><img src="/catalog/view/theme/foryou/image/home/IMPRESORA.png" style="margin-top: 5px; width: 27px; margin-left:-1px;"/></a></div>
          <div class="addthis_default_style"><a href="#"><img src="/catalog/view/theme/foryou/image/home/SOBRE.png" style="width: 25px; margin-top: 7px;"/></a></div>
          <!-- AddThis Button END --> 
        </div>
      </div>
    </div>
  </div>
  <div id="tabs" class="htabs">
    <?php if ($products) { ?>
    <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
  </div>
  <?php if ($products) { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--

function ValorCheckbox(sNum){
	/*if ($("#quantity-"+sNum).val() == ""){
		$('#checkbox-'+sNum).attr('checked', false);
	}else{
		$('#checkbox-'+sNum).attr('checked', true);
	}*/
	/*if($("#checkbox-"+sNum).is(':checked')) {  
		alert("Está activado");  
	} else {  
		alert("No está activado");  
	} */
}

$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});

$(document).ready(function() {
			Cufon.replace('.right .title', {fontSize: '22px'});
			Cufon.replace('.right .detail, .right .description, .right .price, .right .options', {fontSize: '18px'});
			Cufon.replace('.box-category', {fontSize: '14px'});
		});
		

//--></script> 
<?php echo $footer; ?>