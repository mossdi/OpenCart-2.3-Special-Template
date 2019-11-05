<?php echo $header; ?>
<div id="content">
  <div class="container-fluid">
    <div class="content-top-home-page row">
      <?php echo $content_top; ?>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div class="<?php echo $class; ?>">
        <?php echo $content_middle; ?>
      </div>
      <?php echo $column_right; ?>
    </div>
  </div>
  <div class="container-fluid">
    <div class="content-bottom-home-page row">
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>