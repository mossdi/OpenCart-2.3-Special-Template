<div class="col-slideshow hidden-xs">
	<div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="opacity: 1;">
		<?php foreach ($banners as $banner) { ?>
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
		<?php } else { ?>
		<img src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
		<?php } ?>
		<?php } ?>
	</div>
</div>
<div id="htmlcaption" class="nivo-html-caption"></div>
<script type="text/javascript"><!--
	$('#slideshow<?php echo $module; ?>').nivoSlider({
		effect:'random',
		pauseTime: 7000,
		directionNav: true,
		controlNav: true,
        prevText: '<i class="fa fa-angle-left" aria-hidden="true"></i>',
        nextText: '<i class="fa fa-angle-right" aria-hidden="true"></i>',
        directionNavContainer: '<div class="nav-direction container"></div>',
        controlNavContainer: '<div class="nav-control container"></div>'
	});
//--></script>