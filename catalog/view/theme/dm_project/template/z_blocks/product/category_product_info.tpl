<div class="text-center col-xs-6 col-sm-8 col-md-8 col-lg-7 col-padding-0">
    <?php if ($price) { ?>
    <ul class="list-unstyled price-list">
        <?php if (!$special) { ?>
        <li>
            <span class="price"><?php echo $price; ?></span>
        </li>
        <?php } else { ?>
        <li>
            <span class="old-price"><?php echo $price; ?></span>
            <span class="special-price"><?php echo $special; ?></span>
        </li>
        <?php } ?>
        <?php if ($tax) { ?>
        <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
        <?php } ?>
        <?php if ($points) { ?>
        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
        <?php } ?>
        <?php if ($discounts) { ?>
        <li>
            <hr>
        </li>
        <?php foreach ($discounts as $discount) { ?>
        <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
        <?php } ?>
        <?php } ?>
    </ul>
    <?php } ?>
    <?php if ($stock_display) { ?>
    <div class="stock"><?php echo $stock; ?></div>
    <?php } ?>
</div>
<div class="button-group col-xs-6 col-sm-4 col-md-4 col-lg-5 col-padding-0">
    <?php if ($stock_qty > 0) { ?>
    <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');" data-product-id="<?php echo $product_id; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
    <?php } elseif ($stock_checkout) { ?>
    <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');" data-product-id="<?php echo $product_id; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
    <?php } else { ?>
    <button class="btn-cart" type="button"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
    <?php } ?>
</div>