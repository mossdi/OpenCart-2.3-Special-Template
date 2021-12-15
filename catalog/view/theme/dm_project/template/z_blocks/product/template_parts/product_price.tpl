<div id="tab-price">
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
    <?php if ($special_logged) { ?>
    <div class="special-price-logged"><?php echo $special_logged; ?></div>
    <?php } ?>
</div>
