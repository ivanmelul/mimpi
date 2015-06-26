$(document).ready(function() {
    /* Search */
    $('.button-search').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';
				 
        var filter_name = $('input[name=\'filter_name\']').attr('value');
		
        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }
		
        location = url;
    });
    
    $("#contact-submit-button").click(function() {
        if($(this).html() == 'enviando...') {
            alert('Enviando consulta');
            return;
        }
        var control = $(this).html('enviando...');
        $.ajax({
            url: 'index.php?route=services/mail_sender',
            type: 'POST',
            data: $("#contact-form-data").serialize(),
            success: function(data) {
                alert(data);
                control.html('enviar');
            },
            fail: function() {
                alert("Error al enviar el mail, por favor intente nuevamente mas tarde");
                control.html('enviar');
            },
            error: function(error, message) {
                alert(message);
                control.html('enviar');
            }
        });
    });
    
    /* Nenas */
    $('#nenas').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/category&path=59';
        location = url;
    });
    
    /* Varones */
    $('#varones').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/category&path=60';
        location = url;
    });
    
    /* Pedido */
    $('#pedido').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=information/request';
        location = url;
    });
    
    /* Contacto */
    $('#contact-link').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=information/contact';
        location = url;
    });
    
    /* Newsletter */
    $('#newsletter').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=account/register';
        location = url;
    });
    
    $('#header input[name=\'filter_name\']').bind('keydown', function(e) {
        if (e.keyCode == 13) {
            url = $('base').attr('href') + 'index.php?route=product/search';
			 
            var filter_name = $('input[name=\'filter_name\']').attr('value');
			
            if (filter_name) {
                url += '&filter_name=' + encodeURIComponent(filter_name);
            }
			
            location = url;
        }
    });
	
    /* Ajax Cart */
    $('#cart > .heading').live('click', function() {
        $('#cart').addClass('active');
		
        $('#cart').load('index.php?route=module/cart #cart > *');
		
        $('#cart').live('mouseleave', function() {
            $(this).removeClass('active');
        });
    });
	
    /* Mega Menu */
    $('#menu ul > li > a + div').each(function(index, element) {
        // IE6 & IE7 Fixes
        if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
            var category = $(element).find('a');
            var columns = $(element).find('ul').length;
			
            $(element).css('width', (columns * 143) + 'px');
            $(element).find('ul').css('float', 'left');
        }		
		
        var menu = $('#menu').offset();
        var dropdown = $(this).parent().offset();
		
        i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
        if (i > 0) {
            $(this).css('margin-left', '-' + (i + 5) + 'px');
        }
    });

    // IE6 & IE7 Fixes
    if ($.browser.msie) {
        if ($.browser.version <= 6) {
            $('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
            $('#column-right + #content').css('margin-right', '195px');
		
            $('.box-category ul li a.active + ul').css('display', 'block');	
        }
		
        if ($.browser.version <= 7) {
            $('#menu > ul > li').bind('mouseover', function() {
                $(this).addClass('active');
            });
				
            $('#menu > ul > li').bind('mouseout', function() {
                $(this).removeClass('active');
            });	
        }
    }
    
    $("#up-button").click(function() {
        $("html, body").animate({ scrollTop: 0 }, 'slow');
        return false;
    });
    
    $('.success img, .warning img, .attention img, .information img').live('click', function() {
        $(this).parent().fadeOut('slow', function() {
            $(this).remove();
        });
    });	
});

function getURLVar(urlVarName) {
    var urlHalves = String(document.location).toLowerCase().split('?');
    var urlVarValue = '';
	
    if (urlHalves[1]) {
        var urlVars = urlHalves[1].split('&');

        for (var i = 0; i <= (urlVars.length); i++) {
            if (urlVars[i]) {
                var urlVarPair = urlVars[i].split('=');
				
                if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
                    urlVarValue = urlVarPair[1];
                }
            }
        }
    }
	
    return urlVarValue;
} 

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();
			
            if (json['redirect']) {
                location = json['redirect'];
            }
			
            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
                $('.success').fadeIn('slow');
				
                $('#cart-total').html(json['total']);
				
                $('html, body').animate({
                    scrollTop: 0
                }, 'slow'); 
            }	
        }
    });
}
function addToWishList(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();
						
            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
                $('.success').fadeIn('slow');
				
                $('#wishlist-total').html(json['total']);
				
                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');
            }	
        }
    });
}

function addToCompare(product_id) { 
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();
						
            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
                $('.success').fadeIn('slow');
				
                $('#compare-total').html(json['total']);
				
                $('html, body').animate({
                    scrollTop: 0
                }, 'slow'); 
            }	
        }
    });
}