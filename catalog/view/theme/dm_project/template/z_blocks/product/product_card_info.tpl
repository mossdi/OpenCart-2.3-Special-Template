<?php if($attribute_groups) { ?>
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

    <div class="product-buttons row row-5">
        <?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_button_cart.tpl') ?>

        <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" class="qty-input" />
        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

        <!--<div class="col-xs-7 col-padding-5">
            <button id="wishlist" type="button" data-toggle="tooltip" class="btn btn-default btn-lg" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-star"></i></button>
            <button id="compare" type="button" data-toggle="tooltip" class="btn btn-default btn-lg" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-bar-chart"></i></button>
        </div>-->
    </div>
</div>

<?php if ($tags) { ?>
<?php require (DIR_TEMPLATE .  'dm_project/template/z_blocks/product/template_parts/product_tags.tpl') ?>
<?php } ?>