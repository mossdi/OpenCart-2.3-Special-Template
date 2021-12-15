<?php if ($filter_manufacturers) { ?>
<div class="row row-5">
    <div class="manufacturers-filter">
        <?php foreach ($filter_manufacturers as $manufacturer) { ?>
        <div class="col-md-2 col-sm-4 col-xs-6 col-padding-5">
            <a class="text-center <?php echo $filter_manufacturer == $manufacturer['id'] ? 'active' : false; ?>" href="<?php echo $manufacturer['href']; ?>">
                <?php if ($manufacturer['image']) { ?>
                <img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['text']; ?>" title="<?php echo $manufacturer['text']; ?>" class="item img-responsive" />
                <?php } else { ?>
                <span><?php echo $manufacturer['text']; ?></span>
                <?php } ?>
            </a>
        </div>
        <?php } ?>
    </div>
</div>
<?php } ?>
