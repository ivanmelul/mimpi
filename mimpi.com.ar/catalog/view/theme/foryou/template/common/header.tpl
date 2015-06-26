<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta name="description" content="Mimpi es una empresa familiar con una trayectoria de mas de 30 años en el rubro de indumentaria para chicos. Nuetro desafio es crear Ropa Divertida para Chicos." />
<meta name="keywords" content="ropa para chicos, ropa para niños, ropa para chicos por mayor, ropa para bebes, articulos para bebe, ropa por mayor para bebes, ropa para nenes, ropa para nenas, Mimpi " />
<meta name="author" content="Mimpi" />
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/foryou/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel="stylesheet" type="text/css">
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/cloud-zoom/css/main.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/cloud-zoom/css/cloud-zoom.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/cloud-zoom/jquery/cloud-zoom.1.0.2.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Rancho' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery.blockUI.js" type="text/javascript" charset="utf-8"></script>
<script src="catalog/view/javascript/responsiveslides.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/foryou/stylesheet/responsiveslides.css"/>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/foryou/stylesheet/responsiveslides-themes.css"/>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
 
  ga('create', 'UA-47695213-1', 'mimpi.com.ar');
  ga('send', 'pageview');
 
</script>
<script type="text/javascript">
					
	 $(document).ready( function(){	
		$("#cart").hover(function() {
			$(".heading").click();
		});
	});

		
</script>
</head>
<body>
<div id="container">

<div id="header">
<div id="search">
	<h4>buscador</h4>
	<div class="button-search">></div>
	<?php if ($filter_name) { ?>
	<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
	<?php } else { ?>
	<input type="text" name="filter_name" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" style="width: 206px; color:rgb(160, 160, 160);" />
	<?php } ?>
</div>



  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" style="width: 200px;" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>

  <div class="logcart">
	<div id="welcome">
		<?php if (!$logged) { ?>
		<?php echo $text_welcome; ?>
		<?php } else { ?>
		<?php echo $text_logged; ?>
		<?php } ?>
	</div>
	<?php echo $cart;?>
</div>
<div style="clear: both;"></div>
  
</div>
<?php
 //Eso es bastante feo..podría haber una mejor manera.
 
 $homeActive = '';
 $quienesSomosActive = '';
 $coleccionActive = '';
 $howToActive = '';
 $faqActive = '';
 $sucursalesActive = '';
 $contactoActive = '';
 $lookbookActive = '';
 
 if (isset($this->request->get['route']) && !empty($this->request->get['route'])) {
	$page = $this->request->get['route'];
	
	switch ($page)
	{
		case 'common/home':
			$homeActive = 'active';
			break;
		case 'information/request':
			{
				$path = $this->request->get['path'];
				switch ($path)
				{
					case 4:
						$quienesSomosActive = 'active';
						break;
					case 3:
						$howToActive = 'active';
						break;
					case 8:
						$faqActive = 'active';
						break;
					case 2:	
						$sucursalesActive = 'active';
						break;
					case 5:	
						$contactoActive = 'active';
						break;
					case 9:	
						$lookbookActive = 'active';
						break;
				}
				break;
			}
		case 'product/category':
			$coleccionActive = 'active';
			break;
		case 'product/product':
			$coleccionActive = 'active';
			break;
	}
 }else {
	$homeActive = 'active';
 }
?>


<div style="clear: both;"></div>
<div id="menu">
  <ul>
    <li>
        <a class="home <?php echo $homeActive;?>" href="<?php echo $home; ?>">home</a>
    </li>
    <li>
        <a class="quienes_somos <?php echo $quienesSomosActive;?>" href="<?php echo $whoweare; ?>">nosotros</a>
    </li>
    <li>
        <a class="coleccion <?php echo $coleccionActive;?>" href="<?php echo $lookbook; ?>">colecci&oacute;n</a>
    </li>
    <!--<li>
        <a class="pedido <?php echo $howToActive;?>" href="<?php echo $howbuy;?>">c&oacute;mo hacer tu pedido</a>
    </li>-->
	<li>
        <a class="faq <?php echo $faqActive;?>" href="<?php echo $howbuy;?>">preguntas frecuentes</a>
    </li>
	<li>
        <a class="sucursales <?php echo $sucursalesActive;?>" href="<?php echo $store; ?>">sucursales</a>
    </li>
	<li>
		<a class="lookbook <?php echo $lookbookActive;?>" href="<?php echo $lookbook; ?>">Lookbook</a>
    </li>
    <li>
		<a class="contacto <?php echo $contactoActive;?>" href="<?php echo $contacto; ?>">contacto</a>
    </li>
  </ul>
  <ul id="subnav">
    <li>
        <a href="<?php echo $lookbook; ?>&path=57_30">mini mimpi</a>
    </li>
    <li class="dot">
        <a>.</a>
    </li>
    <li>
        <a href="<?php echo $lookbook; ?>&path=3_50">beb&eacute;</a>
    </li>
    <li class="dot">
        <a>.</a>
    </li>
    <li>
        <a href="<?php echo $lookbook; ?>&path=4_44">beba</a>
    </li>
    <li class="dot">
        <a>.</a>
    </li>
    <li>
        <a href="<?php echo $lookbook; ?>&path=1_39">nena</a>
    </li>
    <li class="dot">
        <a>.</a>
    </li>
    <li>
        <a href="<?php echo $lookbook; ?>&path=2_47">var&oacute;n</a>
    </li>
  </ul>
</div>
<div id="notification"></div>
