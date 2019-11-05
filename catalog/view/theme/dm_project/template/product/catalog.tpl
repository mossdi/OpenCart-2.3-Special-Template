<?php echo $header; ?>
<div id="catalog">
    <div class="container">
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
        <div class="row">
            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="catalog <?php echo $class; ?>">
                <?php echo $content_top; ?>
                <div class="dotted-background">
                    <h1 class="catalog-title"><?php echo $heading_title; ?></h1>
                </div>
                <?php if ($categories) { ?>
                <?php $num = 1; ?>
                <div id="category-wall" class="row">
                    <?php foreach ($categories as $category) { ?>
                    <div class="<?php echo ($num == 1 || $num == 6 || $num == 7) ? 'col-lg-6 col-md-6 col-sm-4 col-xs-12' : 'col-lg-3 col-md-3 col-sm-4 col-xs-12'; ?>">
                        <div class="category-wall-item">
                            <div class="image">
                                <a href="<?php echo $category['href']; ?>">
                                    <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" />
                                    <span class="category-name"><?php echo $category['name']; ?></span>
                                    <span class="green-square"></span>
                                </a>
                                <?php if ($category['children']) { ?>
                                <ul class="level-2 list-unstyled">
                                    <?php foreach ($category['children'] as $child) { ?>
                                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php $num++; ?>
                    <?php } ?>
                </div>
                <?php } ?>
                <?php if (!empty($description)) { ?>
                <div class="row">
                    <div class="col-xs-12"><?php echo $description; ?></div>
                </div>
                <?php } ?>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>
    <div class="container-fluid">
        <div class="content-bottom-catalog-page row">
            <?php echo $content_bottom; ?>
        </div>
    </div>
</div>
<div class="fix-footer-margin"></div>
<?php echo $footer; ?>