<div id="blueimp">
    <div id="slider" class="flexslider">
        <ul class="thumbnails slides">
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['big_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
</div>
<div class="flexslider-container"></div>
<?php if ($images) { ?>
<div id="carousel" class="flexslider">
    <ul class="thumbnails slides">
        <li><img src="<?php echo $small_thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
        <?php foreach ($images as $image) { ?>
        <li><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
        <?php } ?>
    </ul>
</div>
<?php } ?>
<script type="text/javascript">productCardImages();</script>
