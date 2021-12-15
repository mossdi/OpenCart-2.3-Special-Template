<style>
    .vue-carousel-featured {
        margin-bottom: 40px;
    }
    .carousel-3d-container figure {
        margin:0;
    }
    .carousel-3d-container figure .product-name {
        position: absolute;
        top: 0;
        padding: 10px;
        min-width: 100%;
        box-sizing: border-box;
        background: rgba(255, 255, 255, 0.5);
    }
    .carousel-3d-container figcaption {
        position: absolute;
        color: #fff;
        bottom: 0;
        padding: 10px;
        min-width: 100%;
        box-sizing: border-box;
    }
    .carousel-3d-container .carousel-3d-slide {
        border-color: #dddddd;
        -webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.2);
        -moz-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.2);
        box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.2);
    }
    .carousel-3d-container .product-thumb {
        border: none;
        margin-bottom: 0;
        overflow-y: hidden;
    }
    .carousel-3d-container .product-thumb .caption {
        min-height: 0;
    }
</style>
<div id="vue-carousel-featured-<?php echo $module; ?>" class="vue-carousel-featured">
    <?php $num = 0; ?>
    <carousel-3d :autoplay="true" :autoplay-timeout="5000" :controls-visible="true" :clickable="false" :height="360" :inverse-scaling="200">
        <?php foreach ($products as $product) { ?>
        <slide :index="<?php echo $num; ?>">
            <figure>
                <div class="product-thumb">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                    <div class="product-name">
                        <a href="<?php echo $product['href']; ?>"><h4><?php echo $product['name']; ?></h4></a>
                    </div>
                    <figcaption>
                        <div class="caption">
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($product['rating'] < $i) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <?php if ($product['price']) { ?>
                            <p class="price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                <?php } ?>
                            </p>
                            <?php } ?>
                        </div>
                        <div class="button-group">
                            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                        </div>
                    </figcaption>
                </div>
            </figure>
        </slide>
        <?php $num++; ?>
        <?php } ?>
    </carousel-3d>
</div>
<script type="text/javascript"><!--
    new Vue({
        el: '#vue-carousel-featured-<?php echo $module; ?>',
        components: {
            'carousel-3d': Carousel3d.Carousel3d,
            'slide': Carousel3d.Slide
        }
    })
//--></script>