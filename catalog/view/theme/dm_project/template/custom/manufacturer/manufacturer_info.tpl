<?php echo $header; ?>
<div class="container" id="manufacturer-thumb-template">
  <ul class="breadcrumb">
    <?php $breadcount = count($breadcrumbs) - 1; ?>
    <?php foreach ($breadcrumbs as $iterator => $breadcrumb) { ?>
    <?php if ($iterator != $breadcount) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } else { ?>
    <li class="end"><a href="<?php echo $breadcrumb['href']; ?>"></a><span><?php echo $breadcrumb['text']; ?></span></li>
    <?php } ?>
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
      <div class="row">
        <div class="col-xs-12">
          <div class="dotted-background">
            <h1 class="h1-manufacturer-title"><?php echo $heading_title; ?></h1>
          </div>
        </div>
        <?php if ($thumb || $description) { ?>
        <div class="manufacturer-description col-xs-12">
          <?php if ($thumb) { ?>
          <div class="pull-left"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="media-object" /></div>
          <?php } ?>
          <?php if ($description) { ?>
          <div><?php echo $description; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php if ($filter_selected) { ?>
      <?php echo $filter_selected; ?>
      <?php } ?>
      <?php if ($parents_categories || $in_stock) { ?>
      <div class="row" style="margin-bottom: 10px;">
        <div class="col-md-2 col-xs-6">
          <div class="checkbox checkbox-in-stock">
            <label for="input-in-stock"><input type="checkbox" name="in_stock" id="input-in-stock" <?php echo ($in_stock) ? 'value="1" checked' : 'value="0"'; ?> /> <?php echo $entry_in_stock; ?></label>
          </div>
        </div>
        <?php if ($parents_categories) { ?>
        <?php echo $filter_price; ?>
        <div class="col-md-3 col-xs-6 pull-right">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($product_sorts as $sorts) { ?>
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
      <?php if ($parents_categories) { ?>
      <?php foreach ($parents_categories as $parents_category) { ?>
      <div class="row">
        <div class="col-xs-12">
          <div class="dotted-background">
            <h2 class="h2-manufacturer-category-title"><?php echo $parents_category['name']; ?></h2>
          </div>
        </div>
      </div>
      <?php if ($parents_category['products']) { ?>
      <div class="row">
        <div class="col-xs-12">
          <?php echo $parents_category['products']; ?>
        </div>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($pagination) { ?>
      <div class="row">
        <div class="col-xs-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
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
