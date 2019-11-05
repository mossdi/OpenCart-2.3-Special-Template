<?php echo $header; ?>
<div class="container" id="special-custom-template">
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
            <h1 class="h1-category-title"><?php echo $heading_title; ?></h1>
          </div>
        </div>
      </div>
      <?php if ($filter_selected) { ?>
      <?php echo $filter_selected; ?>
      <?php } ?>
      <?php if ($filter_manufacturer) { ?>
      <?php echo $filter_manufacturer; ?>
      <?php } ?>
      <?php if ($special_products) { ?>
      <div class="row row-5">
        <?php echo $filter_price; ?>
        <div class="col-md-2 col-xs-6 col-padding-5 pull-right">
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
        <div class="col-md-3 col-xs-6 col-padding-5 pull-right">
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
      </div>
      <div class="row row-0">
        <?php echo $special_products; ?>
        <?php if ($pagination) { ?>
        <div class="row">
          <div class="col-xs-12 text-center"><?php echo $pagination; ?></div>
        </div>
        <?php } ?>
      </div>
      <?php } else { ?>
      <div><?php echo $text_empty; ?></div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
