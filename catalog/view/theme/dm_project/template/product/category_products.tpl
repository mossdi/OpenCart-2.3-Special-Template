<?php if ($products_any_type) { ?>
<div class="product-grid-border">
    <?php foreach ($products_any_type as $product_any_type) { ?>
    <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12 col-padding-0">
        <div class="product-thumb" data-category-id="<?php echo $product_any_type['id']; ?>">
            <div class="product-thumb-layout">
                <div class="variant-item-preview">
                    <?php if (!empty($manufacturer_logo)) { ?>
                    <div class="parent-product-brand dropdown">
                        <img src="<?php echo $manufacturer_logo['image']; ?>" alt="<?php echo $manufacturer_logo['name']; ?>" title="<?php echo $manufacturer_logo['name']; ?>" class="item img-responsive" />
                    </div>
                    <?php } elseif (!empty($product_any_type['manufacturer']['image'])) { ?>
                    <div class="parent-product-brand dropdown">
                        <a href="#" data-toggle="dropdown">
                            <img src="<?php echo $product_any_type['manufacturer']['image']; ?>" alt="<?php echo $product_any_type['manufacturer']['name']; ?>" title="<?php echo $product_any_type['manufacturer']['name']; ?>" class="item img-responsive" />
                        </a>
                        <div class="dropdown-menu">
                            <?php if (isset($manufacturer_filter) && $manufacturer_filter != $product_any_type['manufacturer']['id']) { ?>
                            <a href="<?php echo $product_any_type['manufacturer']['filter_href']; ?>"><?php echo $text_filter_manufacturer; ?></a>
                            <?php } ?>
                            <a href="<?php echo $product_any_type['manufacturer']['href']; ?>"><?php echo $text_to_manufacturer_page; ?></a>
                        </div>
                    </div>
                    <?php } ?>
                    <div class="variant-item-preview-image row row-5">
                        <?php if ($product_any_type['variants_display']) { ?>
                        <div class="col-variants col-xs-2 col-padding-5">
                            <div id="variants-<?php echo !empty($unique_id) ? $unique_id . '-' : ''; ?><?php echo $product_any_type['id']; ?>">
                                <?php if (!empty($product_any_type['product_variants']['groups'])) { ?>
                                <?php foreach ($product_any_type['product_variants']['groups'] as $product_variants) { ?>
                                <?php foreach ($product_variants as $product_variant) { ?>
                                <span onclick="changeProduct('<?php echo $product_variant['product_id']; ?>', '<?php echo $product_any_type['id']; ?>', '<?php echo !empty($parent_id) ? $parent_id : ''; ?>', $(this).hasClass('active'));" class="variants-item <?php echo $product_variant['product_id'] == $product_any_type['product_preview']['product_id'] ? 'active' : false; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
                                    <?php if ($product_variant['special_percent']) { ?>
                                    <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
                                    <?php } ?>
                                    <img src="<?php echo $product_variant['image']; ?>" alt="<?php echo $product_variant['name']; ?>" title="<?php echo $product_variant['name']; ?>" class="item img-responsive"/>
                                    <?php if ($product_variant['attribute']) { ?>
                                    <span class="attribute-value"><?php echo $product_variant['attribute']; ?></span>
                                    <?php } ?>
                                </span>
                                <?php } ?>
                                <?php } ?>
                                <?php } else { ?>
                                <?php foreach ($product_any_type['product_variants'] as $product_variant) { ?>
                                <span onclick="changeProduct('<?php echo $product_variant['product_id']; ?>', '<?php echo $product_any_type['id']; ?>', '<?php echo !empty($parent_id) ? $parent_id : ''; ?>', $(this).hasClass('active'));" class="variants-item <?php echo $product_variant['product_id'] == $product_any_type['product_preview']['product_id'] ? 'active' : false; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
                                    <?php if ($product_variant['special_percent']) { ?>
                                    <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
                                    <?php } ?>
                                    <img src="<?php echo $product_variant['image']; ?>" alt="<?php echo $product_variant['name']; ?>" title="<?php echo $product_variant['name']; ?>" class="item img-responsive"/>
                                    <?php if ($product_variant['attribute']) { ?>
                                    <span class="attribute-value"><?php echo $product_variant['attribute']; ?></span>
                                    <?php } ?>
                                </span>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } else { ?>
                        <div class="col-xs-1 col-padding-5 pull-right"></div>
                        <?php } ?>
                        <div class="col-xs-10 col-padding-5 pull-right">
                            <a class="preview-href" href="<?php echo $product_any_type['product_preview']['href']; ?>">
                                <?php if ($product_any_type['product_preview']['special_percent']) { ?>
                                <span class="special-percent"><?php echo $product_any_type['product_preview']['special_percent']; ?></span>
                                <?php } ?>
                                <img src="<?php echo $product_any_type['product_preview']['image']; ?>" alt="<?php echo $product_any_type['product_preview']['name']; ?>" title="<?php echo $product_any_type['product_preview']['name']; ?>" class="img-responsive image-preview" />
                            </a>
                            <?php if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
                            <a href="javascript:void(0);" class="popup_view_button" onclick="getPopupView('<?php echo $product_any_type['product_preview']['product_id']; ?>');"><?php echo $popup_view_text['button_popup_view']; ?></a>
                            <?php } ?>
                        </div>
                    </div>
                    <?php if ($product_any_type['product_variants']) { ?>
                    <script type="text/javascript"><!--
                        $('#variants-<?php echo !empty($unique_id) ? $unique_id . '-' : ''; ?><?php echo $product_any_type['id']; ?>').slick({
                            infinite: false,
                            vertical: true,
                            verticalSwiping: true,
                            adaptiveHeight: false,
                            slidesToShow: 4,
                            slidesToScroll: 2,
                            arrows: true,
                            prevArrow:'<i class="slick-up fa fa-angle-up" aria-hidden="true"></i>',
                            nextArrow: '<i class=" slick-down fa fa-angle-down" aria-hidden="true"></i>',
                            responsive: [
                                {
                                    breakpoint: 1199,
                                    settings: {
                                        slidesToShow: 4,
                                    }
                                },
                                {
                                    breakpoint: 979,
                                    settings: {
                                        slidesToShow: 4,
                                    }
                                },
                                {
                                    breakpoint: 767,
                                    settings: {
                                        slidesToShow: 4,
                                    }
                                },
                                {
                                    breakpoint: 480,
                                    settings: {
                                        slidesToShow: 4,
                                    }
                                }
                            ]
                        });
                        //--></script>
                    <?php } ?>
                    <div class="caption">
                        <a href="<?php echo $product_any_type['product_preview']['href']; ?>" class="category-href">
                            <h2><?php echo $product_any_type['product_preview']['name']; ?></h2>
                        </a>
                    </div>
                    <div class="product-info row row-0">
                        <div class="text-center col-xs-6 col-sm-8 col-md-8 col-lg-7 col-padding-0">
                            <?php if ($product_any_type['product_preview']['price']) { ?>
                            <ul class="list-unstyled price-list">
                                <?php if (!$product_any_type['product_preview']['special']) { ?>
                                <li>
                                    <span class="price"><?php echo $product_any_type['product_preview']['price']; ?></span>
                                </li>
                                <?php } else { ?>
                                <li>
                                    <span class="old-price"><?php echo $product_any_type['product_preview']['price']; ?></span>
                                    <span class="special-price"><?php echo $product_any_type['product_preview']['special']; ?></span>
                                </li>
                                <?php } ?>
                                <?php if ($product_any_type['product_preview']['tax']) { ?>
                                <li><?php echo $text_tax; ?> <?php echo $product_any_type['product_preview']['tax']; ?></li>
                                <?php } ?>
                                <?php if ($product_any_type['product_preview']['points']) { ?>
                                <li><?php echo $text_points; ?> <?php echo $product_any_type['product_preview']['points']; ?></li>
                                <?php } ?>
                                <?php if ($product_any_type['product_preview']['discount']) { ?>
                                <li>
                                    <hr>
                                </li>
                                <?php foreach ($product_any_type['product_preview']['discount'] as $discount) { ?>
                                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                                <?php } ?>
                                <?php } ?>
                            </ul>
                            <?php } ?>
                            <?php if ($stock_display) { ?>
                            <div class="stock"><?php echo $product_any_type['product_preview']['stock']; ?></div>
                            <?php } ?>
                        </div>
                        <div class="button-group col-xs-6 col-sm-4 col-md-4 col-lg-5 col-padding-0">
                            <?php if ($product_any_type['product_preview']['stock_qty'] > 0) { ?>
                            <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product_any_type['product_preview']['product_id']; ?>', '<?php echo $product_any_type['product_preview']['minimum']; ?>');" data-product-id="<?php echo $product_any_type['product_preview']['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                            <?php } elseif ($stock_checkout) { ?>
                            <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product_any_type['product_preview']['product_id']; ?>', '<?php echo $product_any_type['product_preview']['minimum']; ?>');" data-product-id="<?php echo $product_any_type['product_preview']['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
                            <?php } else { ?>
                            <button class="btn-cart" type="button"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
<?php } ?>
