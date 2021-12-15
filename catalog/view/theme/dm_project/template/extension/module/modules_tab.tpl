<?php if ($featured_products || $special_products || $latest_products) { ?>
<ul id="modules-nav-tabs-<?php echo $module; ?>" class="nav nav-tabs text-center">
    <?php if ($featured_products) { ?>
    <li><a href="#tab-featured-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
    <?php } ?>
    <?php if ($special_products) { ?>
    <li><a href="#tab-special-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_special; ?></a></li>
    <?php } ?>
    <?php if ($latest_products) { ?>
    <li><a href="#tab-latest-<?php echo $module; ?>" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
    <?php } ?>
</ul>
<?php } ?>
<?php if ($featured_products || $special_products || $latest_products) { ?>
<div id="modules-tab-content-<?php echo $module; ?>" class="tab-content">
    <?php if ($featured_products) { ?>
    <!-- Featured products -->
    <div id="tab-featured-<?php echo $module; ?>" class="tab-pane fade row row-0">
        <?php echo $featured_products; ?>
    </div>
    <!-- end Featured products -->
    <?php } ?>
    <?php if ($special_products) { ?>
    <!-- Special products -->
    <div id="tab-special-<?php echo $module; ?>" class="tab-pane fade row row-0">
        <?php echo $special_products; ?>
        <div class="to-special-link col-xs-12 col-padding-0 text-right"><a href="<?php echo $special; ?>"><?php echo $text_special_all; ?></a></div>
    </div>
    <!-- end Special products -->
    <?php } ?>
    <?php if ($latest_products) { ?>
    <!-- Latest products -->
    <div id="tab-latest-<?php echo $module; ?>" class="tab-pane fade row row-0">
        <?php echo $latest_products; ?>
    </div>
    <!-- end Latest products -->
    <?php } ?>
</div>
<?php } ?>
<script type="text/javascript"><!--
    $("ul#modules-nav-tabs-<?php echo $module; ?> li:first").addClass("active");
    $("div#modules-tab-content-<?php echo $module; ?> .tab-pane:first").addClass("active in");
//--></script>