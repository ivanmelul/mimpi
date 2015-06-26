<?php echo $header; ?>
<!--<img class="category-header-image" alt="Mimpi" src="image/coleccion/banner.jpg" width="100%" />-->
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" style="min-height: 590px;"><?php echo $content_top; ?>
	
    <?php 
	
	
	if(!$isLogged){
		echo "<br/><br/><p style='font-size:16px;color:red'>Para ver los productos de nuestro catálogo es necesario que se <a style='font-size:16px' href='index.php?route=account/register'>registre</a> o que <a style='font-size:16px' href='index.php?route=account/login'>inicie sesión</a> <br/><br/> Muchas gracias.</p>";
		$showProducts = false;
	}
	else
	{

		if (isset($this->request->get['path']) && !empty($this->request->get['path'])) {
			$parts = explode('_', (string) $this->request->get['path']);
			if (count($parts) == 1)
			{
				$showProducts = true;
				switch ($parts[0])
				{
					case 1:
						header("Location:index.php?route=product/category&path=1_36");
					break;
					case 2:
						header("Location:index.php?route=product/category&path=2_46");
					break;
					case 3:
						header("Location:index.php?route=product/category&path=3_49");
					break;
					case 4:
						header("Location:index.php?route=product/category&path=4_41");
					break;
					case 57:
						header("Location:index.php?route=product/category&path=57_30");
					break;
				}

				/*switch ($parts[0])
				{
					case 1:
						echo "<a href=". $this->url->link('product/category&path=1_32') . "><img src='image/coleccion/nena.jpg' title='Nena' /></a>";
						break;
					case 2:
						echo "<a href=". $this->url->link('product/category&path=2_12') . "><img src='image/coleccion/varon.jpg' title='Varon' /></a>";
						break;
					case 3:
						echo "<a href=". $this->url->link('product/category&path=3_18') . "><img src='image/coleccion/bebe.jpg' title='Bebe' /></a>";
						break;
					case 4:
						echo "<a href=". $this->url->link('product/category&path=4_24') . "><img src='image/coleccion/beba.jpg' title='Beba' /></a>";
						break;
					case 30:
						echo "<a href=". $this->url->link('product/category&path=30_33') . "><img src='image/coleccion/mini_bebe.jpg' title='Reci&eacute;n Nacido' /></a>";
						echo "<a href=". $this->url->link('product/category&path=30_34') . "><img src='image/coleccion/mini_beba.jpg' title='Reci&eacute;n Nacido' /></a>";
						break;
					default:
					   $showProducts = true;
				}*/
			}
			else
			{
				$showProducts = true;
			}
		}
		else
		{
			echo "<a href=". $this->url->link('product/category&path=1') . "><img  width='785'src='image/coleccion/general.jpg' title='Colecci&oacute;n' /></a>";
			
			$showProducts = false;
		}


		if ($products && $showProducts) { ?>
	    <div class="product-list">
	        <?php foreach ($products as $product) { ?>
	        <div>
	            <?php if ($product['thumb']) { ?>
	            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
	            <?php } ?>
	            <div class="name"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" ><?php echo $product['name']; ?></a></div>
	            <?php if ($product['price']) { ?>
	            <div class="price">
	                <?php if (!$product['special']) { ?>
	                <?php echo $product['price']; ?>
	                <?php } else { ?>
	                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
	                <?php } ?>
	            </div>
	            <div class="detail"><a href="<?php echo $product['href']; ?>"><?php echo $text_view_detail; ?></a></div>
	            <?php } ?>
	            <div class="cart">
	                <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button add-to-cart" />
	            </div>
	        </div>
	        <?php } ?>
	    </div>
	    <div class="pagination"><?php echo $pagination; ?></div>
	    <?php } 
	}?>
    <?php if (!$categories && !$products) { ?>
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
    <?php echo $content_bottom; ?></div>
	<div class="category_slider" style="display: none;">
		<div id="simple-slider">
			<?php foreach ($banners_slider as $banner) { ?>
			<div>
				<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>" alt="<?php echo $banner['title']; ?>">
						<img src="image/<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
					</a>
				<?php } else { ?>
						<img src="image/<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
<script type="text/javascript">
 $(document).ready( function(){	
	$('#simple-slider div:gt(0)').hide();
    setInterval(function(){
      $('#simple-slider div:first-child').fadeOut(0)
         .next('div').fadeIn(2000)
         .end().appendTo('#simple-slider');}, 4000);
		 
	$("#column-left").append($(".category_slider"));
	$(".category_slider").show();
});
</script>
<script type="text/javascript"><!--
function display(view) {
    $('.product-list').attr('class', 'product-grid <?php echo $grid_class; ?>');
	$('.product-grid > div').each(function(index, element) { 
	
        html = '';

        var image = $(element).find('.image').html();
		
        if (image != null) {
			var imgParts = image.split(">");
			
			var CadenaGris = imgParts[1].split("data/");
			
			var idGris = CadenaGris[1].split("-");
			
			var ImageName = imgParts[0] +">"+imgParts[1]+">"+imgParts[2]+">";
			var StatusDisplayOver = "$('#detail"+idGris[0]+"').show()";
			var StatusDisplayOut = "$('#detail"+idGris[0]+"').hide()";
			
			html += "<div class='detail' onmouseover="+StatusDisplayOver+"; onmouseout="+StatusDisplayOut+" style='z-index:1500; opacity:.7;' id='detail"+idGris[0]+"'>" + $(element).find('.detail').html() + '</div>';
			html += "<div class='image' onmouseover="+StatusDisplayOver+"; onmouseout="+StatusDisplayOut+">"+ ImageName + '</div>';
			
        }
        html += '<div class="name" style="text-align:center;">' + $(element).find('.name').html() + '</div>';
        //html += '<div class="description">' + $(element).find('.description').html() + '</div>';

        var price = $(element).find('.price').html();

        if (price != null) {
            html += '<div class="price">' + price  + '</div>';
        }

        var rating = $(element).find('.rating').html();
        if (rating != null) {
            //html += '<div class="rating">' + rating + '</div>';
        }

        //html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
        //html += '<div class="product-shadow"></div>';
		$(element).html(html);
    });
    $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
}

display('grid');

//--></script> 
<?php echo $footer; ?>