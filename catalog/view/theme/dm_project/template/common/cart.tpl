<div id="cart" class="btn-group btn-block">
  <?php if ($products || $vouchers) { ?>
  <button type="button" onclick="getPopupCart();" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><img src="/image/icons/cart-icon.png" alt="Cart"><span id="cart-total"><?php echo $text_items; ?></span></button>
  <?php } else { ?>
  <button type="button" onclick="getPopupCart();" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><img src="/image/icons/cart-icon.png" alt="Cart"><span id="cart-total"><?php echo $text_empty; ?></span></button>
  <?php } ?>
</div>
