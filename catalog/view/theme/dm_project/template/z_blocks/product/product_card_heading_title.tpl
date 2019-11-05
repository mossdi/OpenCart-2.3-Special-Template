<div class="row col-banner">
    <?php if (isset($category_thumb) && isset($parent_heading_title)) { ?>
        <?php if ($category_thumb) { ?>
            <div class="container">
                <div class="product-banner">
                    <span class="parent-product-banner-title"><?php echo $parent_heading_title; ?></span>
                    <img src="<?php echo $category_thumb['thumb']; ?>" alt="<?php echo $parent_heading_title; ?>" title="<?php echo $parent_heading_title; ?>" class="img-responsive" />
                </div>
            </div>
            <?php echo $category_thumb['background']; ?>
        <?php } else { ?>
            <div class="container">
                <div class="dotted-background">
                    <span class="parent-product-title"><?php echo $parent_heading_title; ?></span>
                </div>
            </div>
        <?php } ?>
    <?php } else { ?>
        <div class="row col-banner">
            <div class="container">
                <div class="dotted-background">
                    <span class="parent-product-title"><?php echo $heading_title; ?></span>
                </div>
            </div>
        </div>
    <?php } ?>
</div>
