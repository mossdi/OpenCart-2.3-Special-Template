<?php if (!empty($product_variants['groups'])) { ?>
    <?php foreach ($product_variants['groups'] as $attribute_group => $product_variants) { ?>
        <div class="variants row row-5">
            <div class="col-xs-12 col-padding-5"><strong><?php echo $attribute_group; ?></strong></div>
            <?php foreach ($product_variants as $product_variant) { ?>
            <div class="chart-item col-xs-3 col-padding-5">
                <span onclick="changeProductCard('<?php echo $product_variant['product_id']; ?>',  $(this).hasClass('active'));" class="variants-item <?php echo $product_id == $product_variant['product_id'] ? 'active' : ''; ?>" data-current-category-id="<?php echo $product_variant['current_category_id']; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
                    <?php if ($product_variant['special_percent']) { ?>
                    <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
                    <?php } ?>
                    <img src="<?php echo $product_variant['thumb']; ?>" alt="<?php echo $product_variant['name']; ?>" title="<?php echo $product_variant['name']; ?>" class="img-responsive">
                </span>
            </div>
            <?php } ?>
        </div>
    <?php } ?>
<?php } elseif ($product_variants && count($product_variants) > 1) { ?>
<div class="variants row row-5">
    <?php foreach ($product_variants as $product_variant) { ?>
    <div class="chart-item col-xs-3 col-padding-5">
        <span onclick="changeProductCard('<?php echo $product_variant['product_id']; ?>',  $(this).hasClass('active'));" class="variants-item <?php echo $product_id == $product_variant['product_id'] ? 'active' : ''; ?>" data-current-category-id="<?php echo $product_variant['current_category_id']; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
            <?php if ($product_variant['special_percent']) { ?>
            <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
            <?php } ?>
            <img src="<?php echo $product_variant['thumb']; ?>" alt="<?php echo $product_variant['name']; ?>" title="<?php echo $product_variant['name']; ?>" class="img-responsive">
        </span>
    </div>
    <?php } ?>
</div>
<?php } ?>
