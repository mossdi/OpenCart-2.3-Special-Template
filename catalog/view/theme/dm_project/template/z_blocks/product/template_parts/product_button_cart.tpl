<?php if ($minimum > 1) { ?>
<div id="alert-minimum">
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
</div>
<?php } ?>
<div id="btn-cart" class="col-xs-5 col-padding-5">
    <?php if ($stock_qty > 0) { ?>
    <button class="btn-cart" type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
    <?php } elseif ($stock_checkout) { ?>
    <button class="btn-cart" type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
    <?php } else { ?>
    <button class="btn-cart" type="button" id="button-nostock"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
    <?php } ?>
</div>
<div class="col-xs-12 col-padding-5 stock">
    <br>
    <?php echo $stock; ?>
</div>
