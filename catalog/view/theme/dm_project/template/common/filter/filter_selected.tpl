<?php if ($filters_selected) { ?>
<div class="row">
    <div class="col-xs-12">
        <a href="<?php echo $filter_reset['href']; ?>" data-toggle="tooltip" title="<?php echo $filter_reset['name']; ?>" class="filter-reset pull-right"><i class="fa fa-times-circle-o" aria-hidden="true"></i></a>
        <ul class="selected-filters list-inline pull-right">
            <?php foreach ($filters_selected as $filter_selected) { ?>
            <li><?php echo $filter_selected; ?></li>
            <?php } ?>
        </ul>
    </div>
</div>
<?php } ?>
