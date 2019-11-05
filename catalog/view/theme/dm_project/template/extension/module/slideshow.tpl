<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['description']) { ?>
    <div class="visible-md visible-lg"><?php echo htmlspecialchars_decode($banner['description']);?></div>
    <?php } ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
    items: 6,
    autoPlay: 5000,
    transitionStyle: "goDown",
    stopOnHover: true,
    singleItem: true,
    navigation: true,
    navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
    pagination: true,
    addClassActive : true,
<?php if ($banner['description']) { ?>
    afterAction: function(){
        $('.owl-item').find('.text-slider-one').removeClass('ef-slider-one');
        $('.owl-item.active').find('.text-slider-one').addClass('ef-slider-one');
        $('.owl-item').find('.text-slider-two').removeClass('ef-slider-two');
        $('.owl-item.active').find('.text-slider-two').addClass('ef-slider-two');
        $('.owl-item').find('.text-slider-three').removeClass('ef-slider-three');
        $('.owl-item.active').find('.text-slider-three').addClass('ef-slider-three');
        $('.owl-item').find('.text-slider-four').removeClass('ef-slider-four');
        $('.owl-item.active').find('.text-slider-four').addClass('ef-slider-four');
    }
<?php } ?>
});
//--></script>