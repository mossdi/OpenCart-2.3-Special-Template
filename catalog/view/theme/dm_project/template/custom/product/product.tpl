<?php echo $header; ?>
<div class="container" id="product-custom-template">
  <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/common/breadcrumbs.tpl') ?>
</div>

<div class="container-fluid">
  <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_heading_title.tpl') ?>
</div>

<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div id="col-product-info" class="row">
        <div id="product-images" class="col-md-7 col-sm-12 col-xs-12">
          <?php if ($manufacturer && $manufacturer_img) { ?>
          <img src="<?php echo $manufacturer_img; ?>"
               title="<?php echo $manufacturer; ?>"
               alt="<?php echo $manufacturer; ?>"
               class="manufacturer-logo" />
          <?php } ?>

          <div class="slider">
            <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_images.tpl') ?>
          </div>
        </div>

        <div id="product-specification" class="col-md-5 col-sm-12 col-xs-12">
          <div class="product-name">
            <h1 class="h1-product-title"><?php echo $heading_title; ?></h1>
            <span class="model"><?php echo $text_model; ?> <span id="product-model"><?php echo $model; ?></span></span>
          </div>

          <?php if ($product_variants) { ?>
          <?php echo $product_variants; ?>
          <?php } ?>

          <div class="product-info">
            <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_info.tpl') ?>
          </div>
        </div>

        <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_nav_tabs.tpl') ?>

        <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_related.tpl') ?>
      </div>
    </div>
  </div>
</div>

<?php if ($content_bottom) { ?>
<?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_content_bottom.tpl') ?>
<?php } ?>

<?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/product_card_blueimp_control.tpl') ?>

<script src="catalog/view/theme/dm_project/js/product_card.js?v.2.6" type="text/javascript"></script>

<?php echo $footer; ?>
