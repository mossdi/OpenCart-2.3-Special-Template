<?php if ($price_gap) { ?>
<div class="price-gap col-md-6 col-sm-9 col-xs-12 col-padding-0">
    <div class="col-sm-4 col-xs-12 col-padding-5">
        <button onclick="priceFilter('<?php echo $button_filter_price['route']; ?>');" id="price-filter" class="btn btn-primary"><?php echo $button_filter_price['text']; ?></button>
    </div>
    <div class="col-sm-4 col-xs-6 col-padding-5">
        <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_from; ?></label>
            <input type="text" name="min_price" id="minPrice" value="<?php echo $min_price ? $min_price : $price_gap['min_price']; ?>" class="form-control"/>
        </div>
    </div>
    <div class="col-sm-4 col-xs-6 col-padding-5">
        <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_to; ?></label>
            <input type="text" name="max_price" id="maxPrice" value="<?php echo $max_price ? $max_price : $price_gap['max_price']; ?>" class="form-control"/>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
var minPrice = <?php echo $price_gap['min_price']; ?>;
var maxPrice = <?php echo $price_gap['max_price']; ?>;

$('input#minPrice').change(function() {
    var valueMinPrice = $('input#minPrice').val();
    var valueMaxPrice = $('input#maxPrice').val();

    if (parseInt(valueMinPrice) > parseInt(valueMaxPrice)) {
        valueMinPrice = valueMaxPrice;
        $('input#minPrice').val(valueMinPrice);
    } else if (parseInt(valueMinPrice) < minPrice) {
        valueMinPrice = minPrice;
        $('input#minPrice').val(valueMinPrice);
    }
});

$('input#maxPrice').change(function() {
    var valueMinPrice = $('input#minPrice').val();
    var valueMaxPrice = $('input#maxPrice').val();

    if (valueMaxPrice > maxPrice) {
        valueMaxPrice = maxPrice;
        $('input#maxPrice').val(valueMaxPrice)
    }

    if(parseInt(valueMinPrice) > parseInt(valueMaxPrice)) {
        valueMaxPrice = valueMinPrice;
        $('input#maxPrice').val(valueMaxPrice);
    }
});
//--></script>
<?php } ?>
