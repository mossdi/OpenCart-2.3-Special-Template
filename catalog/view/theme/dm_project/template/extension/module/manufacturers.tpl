<div class="col-carousel-manufacturers">
  <div id="carousel-manufacturers">
    <?php foreach ($manufacturers as $manufacturer) { ?>
    <div class="col-xs-12 item">
      <a href="<?php echo $manufacturer['href']; ?>">
        <img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" class="img-responsive" />
      </a>
    </div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--
  $('#carousel-manufacturers').slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    arrows:true,
    prevArrow:' <i class="slick-prev fa fa-angle-left" aria-hidden="true"></i>',
    nextArrow: '<i class=" slick-next fa fa-angle-right" aria-hidden="true"></i>',
    responsive: [
      {
        breakpoint: 1199,
        settings: {
          slidesToShow: 4,
        }
      },
      {
        breakpoint: 979,
        settings: {
          slidesToShow: 3,
        }
      },
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });
//--></script>
