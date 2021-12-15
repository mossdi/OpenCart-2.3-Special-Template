<?php if (!empty($product_variants['groups'])) { ?>
    <?php foreach ($product_variants['groups'] as $attribute_group => $product_variants) { ?>
        <div class="variants group row row-0">
            <div class="attribute-group-name col-xs-12 col-padding-0"><strong><?php echo $attribute_group; ?></strong></div>
            <?php foreach ($product_variants as $product_variant) { ?>
            <div class="chart-item size-item pull-left">
                <span onclick="changeProductCard('<?php echo $product_variant['product_id']; ?>',  $(this).hasClass('active'));" class="variants-item <?php echo $product_id == $product_variant['product_id'] ? 'active' : ''; ?>" data-current-category-id="<?php echo $product_variant['current_category_id']; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
                    <?php if ($product_variant['special_percent']) { ?>
                    <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
                    <?php } ?>
                    <span><?php echo $product_variant['attribute']; ?></span>
                </span>
            </div>
            <?php } ?>
        </div>
    <?php } ?>
<?php } elseif ($product_variants && count($product_variants) > 1) { ?>
<div class="variants row row-5">
    <?php foreach ($product_variants as $product_variant) { ?>
    <div class="chart-item size-item pull-left">
        <span onclick="changeProductCard('<?php echo $product_variant['product_id']; ?>',  $(this).hasClass('active'));" class="variants-item <?php echo $product_id == $product_variant['product_id'] ? 'active' : ''; ?>" data-current-category-id="<?php echo $product_variant['current_category_id']; ?>" data-product-id="<?php echo $product_variant['product_id']; ?>">
            <?php if ($product_variant['special_percent']) { ?>
            <span class="special-percent"><?php echo $product_variant['special_percent']; ?></span>
            <?php } ?>
            <span><?php echo $product_variant['attribute']; ?></span>
        </span>
    </div>
    <?php } ?>
</div>
<?php } ?>
