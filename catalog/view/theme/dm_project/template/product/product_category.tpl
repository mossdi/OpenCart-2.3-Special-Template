<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php $breadcount = count($breadcrumbs) - 1; ?>
    <?php foreach ($breadcrumbs as $iterator => $breadcrumb) { ?>
    <?php if ($iterator != $breadcount) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } else { ?>
    <li class="end"><a href="<?php echo $breadcrumb['href']; ?>"></a><span><?php echo $breadcrumb['text']; ?></span></li>
    <?php } ?>
    <?php } ?>
  </ul>
</div>
<div class="container-fluid">
  <div class="row col-banner">
    <?php if ($thumb) { ?>
    <div class="container">
      <div class="product-banner">
        <h1 class="h1-category-banner-title"><?php echo $heading_title; ?></h1>
        <img src="<?php echo $thumb['thumb']; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" />
      </div>
    </div>
    <?php echo $thumb['background']; ?>
    <?php } else { ?>
    <div class="container">
      <div class="dotted-background">
        <h1 class="h1-category-title"><?php echo $heading_title; ?></h1>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
<?php $num = 1; ?>
<?php if ($products) { ?>
<div id="product-list-container" class="container-fluid">
    <?php foreach ($products as $product) { ?>
    <div class="row <?php echo ($num % 2 != 0) ? 'grey-background-to-left' : 'grey-background-to-right'; ?>">
        <div class="container">
            <div class="row">
                <div class="product-layout product-list col-xs-12">
                    <div class="product-thumb">
                        <div class="row">
                            <div id="product-images-<?php echo $product['product_id']; ?>" class="col-md-6 col-xs-12 <?php echo ($num % 2 == 0) ? 'col-md-push-6' : false; ?>">
                                <?php if ($product['manufacturer_img']) { ?>
                                <div class="parent-product-brand dropdown">
                                    <?php if ($product['manufacturer_img']['image']) { ?>
                                    <a href="#" data-toggle="dropdown">
                                        <img src="<?php echo $product['manufacturer_img']['image']; ?>" alt="<?php echo $product['manufacturer_img']['name']; ?>" title="<?php echo $product['manufacturer_img']['name']; ?>" class="item img-responsive" />
                                    </a>
                                    <?php } else { ?>
                                    <a href="#" data-toggle="dropdown"><?php echo $product['manufacturer_img']['name']; ?></a>
                                    <?php } ?>
                                    <div class="dropdown-menu">
                                        <a href="<?php echo $product['manufacturer_img']['href']; ?>"><?php echo $text_to_manufacturer_page; ?></a>
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="slider">
                                    <div id="blueimp-<?php echo $product['product_id']; ?>">
                                        <div id="slider<?php echo $product['product_id']; ?>" class="flexslider">
                                            <ul class="thumbnails slides">
                                                <li><a class="thumbnail" href="<?php echo $product['popup']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></li>
                                                <?php if ($product['images']) { ?>
                                                <?php foreach ($product['images'] as $image) { ?>
                                                <li><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['big_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                                                <?php } ?>
                                                <?php } ?>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="flexslider-container-<?php echo $product['product_id']; ?>"></div>
                                    <?php if ($product['images']) { ?>
                                    <div id="carousel<?php echo $product['product_id']; ?>" class="flexslider">
                                        <ul class="thumbnails slides">
                                            <li><img src="<?php echo $product['small_thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></li>
                                            <?php foreach ($product['images'] as $image) { ?>
                                            <li><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div id="product-specification-<?php echo $product['product_id']; ?>" class="col-md-6 col-xs-12 <?php echo ($num % 2 == 0) ? 'col-md-pull-6' : false; ?>">
                                <div class="product-info">
                                    <a href="<?php echo $product['href']; ?>" class="product-href">
                                        <h2><?php echo $product['name']; ?></h2>
                                    </a>
                                    <hr>
                                    <?php if($product['attribute_groups']) { ?>
                                    <div id="tab-attribute-<?php echo $product['product_id']; ?>">
                                        <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>
                                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <p><strong><?php echo $attribute['name']; ?>:</strong> <?php echo $attribute['text']; ?></p>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                    <?php if ($product['manufacturer']) { ?>
                                    <p><strong><?php echo $text_manufacturer; ?></strong> <a href="<?php echo $product['manufacturers']; ?>"><?php echo $product['manufacturer']; ?></a></p>
                                    <?php } ?>
                                    <p><strong><?php echo $text_model; ?></strong> <?php echo $product['model']; ?></p>
                                    <?php if ($product['reward']) { ?>
                                    <p><strong><?php echo $text_reward; ?></strong> <?php echo $product['reward']; ?></p>
                                    <?php } ?>
                                    <p class="stock"><strong><?php echo $text_stock; ?></strong> <?php echo $product['stock']; ?></p>
                                    <?php if ($product['price']) { ?>
                                    <div id="tab-price-<?php echo $product['product_id']; ?>">
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
                                            <li>
                                                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                        <?php if ($product['special_logged']) { ?>
                                        <div class="special-price-logged"><?php echo $product['special_logged']; ?></div>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                    <div class="row row-5">
                                        <div class="col-sm-4 col-padding-5">
                                            <div class="button-group">
                                                <?php if ($product['stock_qty'] > 0) { ?>
                                                <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-product-id="<?php echo $product['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                                <?php } elseif ($stock_checkout) { ?>
                                                <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-product-id="<?php echo $product['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
                                                <?php } else { ?>
                                                <button class="btn-cart" type="button"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript"><!--
            document.getElementById("blueimp-<?php echo $product['product_id']; ?>").onclick = function (event) {
                event = event || window.event;
                var target = event.target || event.srcElement,
                    link = target.src ? target.parentNode : target,
                    options = {index: link, event: event},
                    links = this.getElementsByClassName('thumbnail');
                blueimp.Gallery(links, options);
            };
            // The slider being synced must be initialized first
            $("div#slider<?php echo $product['product_id']; ?>").flexslider({
                animation: "slide",
                controlsContainer: $(".flexslider-container-<?php echo $product['product_id']; ?>"),
                controlNav: false,
                animationLoop: false,
                slideshow: false,
                prevText: '‹',
                nextText: '›',
                sync: "#carousel<?php echo $product['product_id']; ?>"
            });

            if (document.getElementById("carousel<?php echo $product['product_id']; ?>")) {
                $("div#carousel<?php echo $product['product_id']; ?>").flexslider({
                    animation: "slide",
                    controlNav: false,
                    animationLoop: true,
                    slideshow: false,
                    prevText: '‹',
                    nextText: '›',
                    itemWidth: 250,
                    itemMargin: 5,
                    minItems: 6,
                    asNavFor: "#slider<?php echo $product['product_id']; ?>"
                });
            }
        //--></script>
    </div>
    <?php $num++; ?>
    <?php } ?>
</div>
<?php } ?>
<?php if (!$categories && !$products) { ?>
<div class="container">
    <p><?php echo $text_empty; ?></p>
    <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
</div>
<?php } ?>
<?php if ($description) { ?>
<div class="container-fluid">
  <div class="category-description row <?php echo ($num % 2 != 0) ? 'grey-background-to-left' : 'grey-background-to-right'; ?>">
    <div class="container">
      <div class="row">
        <div class="col-sm-12"><?php echo $description; ?></div>
      </div>
    </div>
  </div>
</div>
<?php } ?>
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
  <div class="slides"></div>
  <a class="prev">‹</a>
  <a class="next">›</a>
  <a class="close">×</a>
  <a class="play-pause"></a>
  <ol class="indicator"></ol>
</div>
<div class="fix-footer-margin"></div>
<?php echo $footer; ?>
