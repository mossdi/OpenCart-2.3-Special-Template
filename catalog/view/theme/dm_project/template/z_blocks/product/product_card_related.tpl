<?php if ($products) { ?>
<div id="related-products" class="col-xs-12">
    <div class="dotted-background">
        <h3 class="related-title"><?php echo $text_related; ?></h3>
    </div>
    <div class="row row-0">
        <div id="carousel-related">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-grid col-xs-12 col-padding-0">
                <div class="product-thumb">
                    <div class="product-thumb-layout">
                        <div class="related-product-preview-image">
                            <?php if ($product['manufacturer']) { ?>
                            <div class="related-product-brand">
                                <?php if ($product['manufacturer']['logo']) { ?>
                                <a href="<?php echo $product['manufacturer']['href']; ?>">
                                    <img src="<?php echo $product['manufacturer']['logo']; ?>" alt="<?php echo $product['manufacturer']['name']; ?>" title="<?php echo $product['manufacturer']['name']; ?>" class="item img-responsive" />
                                </a>
                                <?php } else { ?>
                                <a href="<?php echo $product['manufacturer']['href']; ?>"><?php echo $product['manufacturer']['name']; ?></a>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                            <?php if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
                            <a href='javascript:void(0);' class='popup_view_button' onclick='getPopupView("<?php echo $product['product_id']; ?>");'><?php echo $popup_view_text['button_popup_view']; ?></a>
                            <?php } ?>
                        </div>
                        <div class="caption">
                            <a href="<?php echo $product['href']; ?>" class="product-href"><h4><?php echo $product['name']; ?></h4></a>
                        </div>
                        <div class="related-product-info row row-0">
                            <div class="text-center col-xs-6 col-sm-8 col-md-8 col-lg-7 col-padding-0">
                                <?php if ($product['price']) { ?>
                                <ul class="list-unstyled price-list">
                                    <?php if (!$product['special']) { ?>
                                    <li>
                                        <span class="price"><?php echo $product['price']; ?></span>
                                    </li>
                                    <?php } else { ?>
                                    <li>
                                        <span class="old-price"><?php echo $product['price']; ?></span>
                                        <span class="special-price"><?php echo $product['special']; ?></span>
                                    </li>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                    <li><span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span></li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                                <?php if ($stock_display) { ?>
                                <div class="stock"><?php echo $product['stock']; ?></div>
                                <?php } ?>
                            </div>
                            <div class="button-group col-xs-6 col-sm-4 col-md-4 col-lg-5 col-padding-0">
                                <?php if ($product['stock_qty'] > 0) { ?>
                                <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                <?php } elseif ($stock_checkout) { ?>
                                <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
                                <?php } else { ?>
                                <button class="btn-cart" type="button"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
    <script type="text/javascript">
    $('#carousel-related').owlCarousel({
        items: 3,
        itemsCustom: false,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [991, 2],
        itemsTablet: [767, 1],
        itemsTabletSmall: [639, 1],
        itemsMobile: [479, 1],
        singleItem: false,
        itemsScaleUp: false,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left" aria-hidden="true"></i>', '<i class="fa fa-chevron-right" aria-hidden="true"></i>'],
        pagination: false,
        rewindNav: false
    });
    </script>
</div>
<?php } ?>