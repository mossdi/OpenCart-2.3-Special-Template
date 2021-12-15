function masked(element, status) {
    if (status == true) {
        $('<div/>')
            .attr({ 'class':'masked' })
            .prependTo(element);
        $('<div class="masked_loading" />').insertAfter($('.masked'));
    } else {
        $('.masked').remove();
        $('.masked_loading').remove();
    }
}

function validate( input ) {
    input.value = input.value.replace( /[^\d,]/g, '' );
}

function addToWishlist(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.alert').remove();

            if (json['success']) {
                $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            if (json['info']) {
                $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            $('#wishlist-total span').html(json['total']);
            $('#wishlist-total').attr('title', json['total']);
        }
    });
}

function addToComapre(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.alert').remove();

            if (json['success']) {
                $('#popup-view-wrapper .popup-center').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                $('#compare-total').html(json['total']);
            }
        }
    });
}

function update_prices(product_id, minimum) {
    var input_val = $('#popup-product').find('input[name=quantity]').val();
    var quantity = parseInt(input_val);
    var minimum = minimum;

    if (minimum > 1) {
        if (quantity < minimum) {
            quantity = $('#popup-product').find('input[name=quantity]').val(minimum);
            masked('#popup-view-wrapper', false);
            return;
        }
    } else {
        if (quantity == 0) {
            quantity = $('#popup-product').find('input[name=quantity]').val(1);
            masked('#popup-view-wrapper', false);
            return;
        }
    }

    $.ajax({
        url: 'index.php?route=common/popup_view/update_prices&product_id=' + product_id + '&quantity=' + quantity,
        type: 'post',
        dataType: 'json',
        data: $('#popup-product').serialize(),
        beforeSend: function () {
            masked('#popup-view-wrapper', true);
        },
        success: function(json) {
            $('ul.price-list span.price').html(json['price']);
            $('ul.price-list span.old-price').html(json['price']);
            $('ul.price-list span.special-price').html(json['special']);
            $('ul.price-list span.tax').html(json['tax']);
            $('.special-price-logged span').html(json['special_logged']);

            masked('#popup-view-wrapper', false);
        }
    });
}

$(document).ready(flexslider());
function flexslider() {
    // The slider being synced must be initialized first
    $('div#slider').flexslider({
        animation: "slide",
        controlsContainer: $(".flexslider-container"),
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        prevText: '‹',
        nextText: '›',
        sync: "#carousel"
    });

    if(document.getElementById('carousel')) {
        $('div#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            prevText: '‹',
            nextText: '›',
            itemWidth: 250,
            itemMargin: 5,
            minItems: 6,
            asNavFor: '#slider'
        });
    }
}
