<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="dotted-background">
        <h1 class="h1-category-title"><?php echo $heading_title; ?></h1>
      </div>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <?php if (!empty($filter_selected)) { ?>
      <?php echo $filter_selected; ?>
      <?php } ?>
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products || $in_stock) { ?>
      <div class="row row-5">
        <div class="col-md-2 col-sm-4 col-xs-6 col-padding-5">
          <div class="checkbox checkbox-in-stock">
            <label for="input-in-stock"><input type="checkbox" name="in_stock" id="input-in-stock" <?php echo ($in_stock) ? 'value="1" checked' : 'value="0"'; ?> /> <?php echo $entry_in_stock; ?></label>
          </div>
        </div>
        <div class="clearfix visible-xs visible-sm"></div>
        <?php if ($products) { ?>
        <div class="col-md-2 col-sm-6 col-xs-6 col-padding-5 pull-right">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-6 col-padding-5 pull-right">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row row-0">
        <div class="product-grid-border">
          <?php foreach ($products as $product) { ?>
          <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12 col-padding-0">
            <div class="product-thumb">
              <div class="product-thumb-layout">
                <div class="variant-item-preview">
                  <?php if ($product['manufacturer']) { ?>
                  <div class="parent-product-brand dropdown">
                    <?php if ($product['manufacturer']['image']) { ?>
                    <a href="#" data-toggle="dropdown">
                      <img src="<?php echo $product['manufacturer']['image']; ?>" alt="<?php echo $product['manufacturer']['name']; ?>" title="<?php echo $product['manufacturer']['name']; ?>" class="item img-responsive" />
                    </a>
                    <?php } else { ?>
                    <a href="#" data-toggle="dropdown"><?php echo $product['manufacturer']['name']; ?></a>
                    <?php } ?>
                    <div class="dropdown-menu">
                      <a href="<?php echo $product['manufacturer']['href']; ?>"><?php echo $text_to_manufacturer_page; ?></a>
                    </div>
                  </div>
                  <?php } ?>
                  <div class="variant-item-preview-image">
                    <a href="<?php echo $product['href']; ?>">
                      <?php if ($product['special_percent']) { ?>
                      <span id="special-percent-<?php echo $product['product_id']; ?>" class="special-percent"><?php echo $product['special_percent']; ?></span>
                      <?php } ?>
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                    </a>
                    <?php if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
                    <a href='javascript:void(0);' class='popup_view_button' onclick='getPopupView("<?php echo $product['product_id']; ?>");'><?php echo $popup_view_text['button_popup_view']; ?></a>
                    <?php } ?>
                  </div>
                  <div class="caption">
                    <a href="<?php echo $product['href']; ?>" class="product-href">
                      <h4><?php echo $product['name']; ?></h4>
                    </a>
                  </div>
                  <div class="product-info row row-0">
                    <div class="text-center col-xs-6 col-sm-8 col-md-8 col-lg-7 col-padding-0">
                      <?php if ($product['price']) { ?>
                      <ul class="list-unstyled price-list">
                        <?php if (!$product['special']) { ?>
                        <li>
                          <span class="price"><?php echo $product['price']; ?></span>
                        </li>
                        <?php } else { ?>
                        <li>
                          <span class="price-old"><?php echo $product['price']; ?></span>
                          <span class="special-price"><?php echo $product['special']; ?></span>
                        </li>
                        <?php } ?>
                        <?php if ($product['tax']) { ?>
                        <li>
                          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                        </li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                      <?php if ($stock_display) { ?>
                      <div class="stock"><?php echo $product['stock']; ?></div>
                      <?php } ?>
                    </div>
                    <div class="button-group col-xs-6 col-sm-4 col-md-4 col-lg-5 col-padding-0">
                      <?php if ($product['stock_qty'] > 0) { ?>
                      <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-product-id="<?php echo $product['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                      <?php } elseif ($stock_checkout) { ?>
                      <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" data-product-id="<?php echo $product['product_id']; ?>" data-loading-text="<?php echo $text_loading; ?>"><img src="/image/icons/cart-icon.png" class="cart-img" alt="Cart"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_pre_order; ?></span></button>
                      <?php } else { ?>
                      <button class="btn-cart" type="button"><i class="fa fa-info" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_no_stock; ?></span></button>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($pagination) { ?>
      <div class="row">
        <div class="col-xs-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
    var url_filter = '<?php echo $url; ?>';

    $('#content').on('click', '#input-in-stock', function() {
        url = url_filter;
        var in_stock = $('#content input[name=\'in_stock\']').val();

        if (in_stock == '0') {
            url += '&in_stock=true';
        }

        location = url;
    });
//--></script>
<?php echo $footer; ?>