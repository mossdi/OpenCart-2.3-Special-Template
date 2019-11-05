<div id="popup-view-wrapper">
  <div id="content">
    <?php if ($popup_view_data['heading']) { ?>
    <div class="popup-heading"><?php echo $heading_title; ?></div>
    <?php } ?>
    <div class="popup-center">
      <?php if ($popup_view_data['no_stock'] && $stock_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $stock_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <div class="row">
        <?php if ($popup_view_data['image'] || $popup_view_data['additional_image']) { ?>
        <div id="product-images" class="col-sm-7">
          <?php if ($manufacturer && $manufacturer_img) { ?>
          <img src="<?php echo $manufacturer_img; ?>" title="<?php echo $manufacturer; ?>" alt="<?php echo $manufacturer; ?>" class="manufacturer-logo" />
          <?php } ?>
          <div class="slider">
            <div id="slider" class="flexslider">
              <ul class="thumbnails slides">
                <li><a class="thumbnail"><img src="<?php echo $thumb; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" id="popup-main-image"/></a></li>
                <?php if ($popup_view_data['additional_image'] && $images) { ?>
                <?php foreach ($images as $image) { ?>
                <li><a class="thumbnail"><img src="<?php echo $image['big_thumb']; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" /></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
            <?php if ($popup_view_data['additional_image'] && $images) { ?>
            <div id="carousel" class="flexslider">
              <ul class="thumbnails slides">
                <li><img src="<?php echo $small_thumb; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" id="popup-main-image"/></li>
                <?php foreach ($images as $image) { ?>
                <li><img src="<?php echo $image['thumb']; ?>" title="<?php echo $product_name; ?>" alt="<?php echo $product_name; ?>" /></li>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <div class="product-info col-sm-5">
          <div class="product-name">
          <a href="<?php echo $product_href; ?>"><h1 class="h1-product-title"><?php echo $product_name; ?></h1></a>
          <span class="model"><?php echo $text_model; ?> <span id="product-model"><?php echo $model; ?></span></span>
          </div>

          <?php if ($popup_view_data['specification'] && $attribute_groups) { ?>
          <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_attributes.tpl') ?>
          <?php } ?>

          <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_specification.tpl') ?>

          <?php if ($price) { ?>
          <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_price.tpl') ?>
          <?php } ?>

          <div id="product">
            <?php if ($options) { ?>
            <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_option.tpl') ?>
            <?php } ?>

            <?php if ($recurrings) { ?>
            <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_recurrings.tpl') ?>
            <?php } ?>

            <div class="form-group">
              <?php if ($popup_view_data['quantity'] && $stock_qty > 0 || $popup_view_data['quantity'] && $stock_checkout) { ?>
              <div class="payment-quantity">
                <label><?php echo $entry_qty; ?></label>
                <div class="qty-edit">
                  <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden" />
                  <div class="frame-change-count">
                    <div class="btn-plus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update_prices('<?php echo $product_id; ?>, <?php echo $minimum; ?>');">
                        <span class="icon-plus"></span>
                      </button>
                    </div>
                    <div class="btn-minus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update_prices('<?php echo $product_id; ?>, <?php echo $minimum; ?>');">
                        <span class="icon-minus"></span>
                      </button>
                    </div>
                  </div>
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" maxlength="3" class="plus-minus" onchange="update_prices( '<?php echo $product_id; ?>, <?php echo $minimum; ?>' ); return validate(this);" onkeyup="update_prices( '<?php echo $product_id; ?>, <?php echo $minimum; ?>' ); return validate(this);" />
                </div>
              </div>
              <?php } else { ?>
              <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" />
              <?php } ?>

              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

              <div class="product-buttons row row-5">
                <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_button_cart.tpl') ?>

                <?php if ($popup_view_data['wishlist'] || $popup_view_data['compare']) { ?>
                  <div class="add-btn col-xs-7 col-padding-5">
                    <?php if ($popup_view_data['wishlist']) { ?>
                      <button type="button" id="popup-add-to-wishlist" data-toggle="tooltip" class="btn" title="<?php echo $button_wishlist; ?>" onclick="addToWishlist('<?php echo $product_id; ?>');"><i class="fa fa-star"></i> <?php echo $button_wishlist; ?></button>
                    <?php } ?>
                    <?php if ($popup_view_data['compare']) { ?>
                      <button type="button" id="popup-add-to-compare" data-toggle="tooltip" class="btn" title="<?php echo $button_compare; ?>" onclick="addToComapre('<?php echo $product_id; ?>');"><i class="fa fa-bar-chart"></i> <?php echo $button_compare; ?></button>
                    <?php } ?>
                  </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </div>

        <?php if ($popup_view_data['description'] && $description) { ?>
          <div class="col-sm-12">
            <div id="tab-description"><?php echo $description; ?></div>
          </div>
        <?php } ?>
      </div>
    </div>

    <div class="popup-footer">
      <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
      <a id="popup-view-button" href="<?php echo $view_product_link; ?>"><?php echo $button_view; ?></a>
    </div>
  </div>
</div>

<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

<script src="catalog/view/theme/dm_project/js/product_card.js?v.2.6" type="text/javascript"></script>
<script src="catalog/view/theme/dm_project/js/product_card_popup.js?v.2.6" type="text/javascript"></script>

<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
