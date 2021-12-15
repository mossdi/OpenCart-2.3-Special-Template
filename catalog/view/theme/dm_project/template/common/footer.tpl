<footer>
    <div class="col-newsletter">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <a href="https://vk.com/shoprukzak_moscow" target="_blank"><i class="fa fa-vk"></i></a>
                    <a href="https://www.instagram.com/shoprukzak.ru" target="_blank"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <?php if ($map_data['status']) { ?>
    <div class="container-fluid container-map">
        <div class="row">
            <div class="col-footer-map">
                <button type="button" class="map-switch" onclick="switchMap('open');"><i class="fa fa-map-marker" aria-hidden="true"></i> <?php echo $text_open_map; ?></button>
                <div class="map-layout">
                    <div class="map-layout-filter"></div>
                    <div class="container">
                        <div class="map-layout-contacts">
                            <div class="contacts-title">
                                <span onclick="switchMap('open');"><?php echo $text_contacts; ?></span>
                            </div>
                            <ul class="list-unstyled fa-ul">
                                <li><i class="fa-li fa fa-phone"></i> <?php echo $telephone; ?></li>
                                <?php if (!empty($email)) { ?>
                                <li><i class="fa-li fa fa-envelope-o"></i> <?php echo $email; ?></li>
                                <?php } ?>
                                <li><i class="fa-li fa fa-home"></i> <?php echo $address; ?></li>
                                <?php if (!empty($open)) { ?>
                                <li><i class="fa-li fa fa-clock-o" aria-hidden="true"> </i> <?php echo $open; ?></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="footer-map" class="footer-map footer-map-filter"></div>
            </div>
        </div>
    </div>
    <?php } ?>
    <div class="container">
        <div class="footer-box">
            <div class="row">
                <div class="col-sm-3">
                    <?php if ($logo) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="shop-logo img-responsive" />
                    <?php } else { ?>
                    <h5 class="shop-name"><?php echo $name; ?></h5>
                    <?php } ?>
                    <ul class="list-unstyled">
                        <li><?php echo $address; ?></li>
                        <li><?php echo $telephone; ?></li>
                        <?php if (!empty($open)) { ?>
                        <li><?php echo $open; ?></li>
                        <?php } ?>
                        <?php if (!empty($email)) { ?>
                        <li><?php echo $email; ?></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php if ($categories) { ?>
                <div class="col-sm-3">
                    <a href="<?php echo $catalog; ?>"><h5><?php echo $text_catalog; ?></h5></a>
                    <ul class="list-unstyled">
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
                <div class="col-sm-6">
                    <div class="row">
                        <?php if ($informations) { ?>
                        <div class="col-sm-6">
                            <h5><?php echo $text_information; ?></h5>
                            <ul class="list-unstyled">
                                <?php foreach ($informations as $information) { ?>
                                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                <?php } ?>
                                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                            </ul>
                        </div>
                        <?php } ?>
                        <div class="col-sm-6">
                            <h5><?php echo $text_service; ?></h5>
                            <ul class="list-unstyled">
                                <?php if ($informations_help) { ?>
                                <?php foreach ($informations_help as $information_help) { ?>
                                <li><a href="<?php echo $information_help['href']; ?>"><?php echo $information_help['title']; ?></a></li>
                                <?php } ?>
                                <?php } ?>
                                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                            </ul>
                        </div>
                        <div class="col-sm-12">
                            <ul class="payments-list list-inline">
                                <li><img src="/image/icons/visa.png" alt="VISA"></li>
                                <li><img src="/image/icons/mastercard.png" alt="MASTERCARD"></li>
                                <li><img src="/image/icons/yandex-money.png" alt="YANDEX"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="powered">
        <div class="container">
            <?php echo $powered; ?>
        </div>
    </div>
</footer>
<?php if ($map_data['status']) { ?>
<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<script type="text/javascript"><!--
var settingMap = {
    shopName:  '<?php echo $name; ?>',
    latitude:  '<?php echo $map_data["latitude"]; ?>',
    longitude: '<?php echo $map_data["longitude"]; ?>',
    zoom:      '<?php echo $map_data["zoom"]; ?>'
}

ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('footer-map', {
        center: [settingMap.latitude, settingMap.longitude],
        zoom: settingMap.zoom
    });

    var myPlacemark = new ymaps.Placemark([settingMap.latitude, settingMap.longitude], {
        hintContent: settingMap.shopName,
        balloonContent: settingMap.shopName
    });

    myMap.geoObjects.add(myPlacemark);
}

function switchMap(switcher) {
    var button_text = {
        open:  '<?php echo $text_open_map; ?>',
        close: '<?php echo $text_close_map; ?>'
    }

    if (switcher == 'open') {
        $('.col-footer-map').css('height', '300px');
        $('button.map-switch').css('color', '#3a3a3a');
        $('button.map-switch').attr('onclick', 'switchMap(\'close\')');
        $('.contacts-title span').attr('onclick', 'switchMap(\'close\')');
        $('button.map-switch').html('<i class="fa fa-map-marker" aria-hidden="true"></i> ' + button_text.close);
        $('.footer-map').removeClass('footer-map-filter');
        $('.map-layout-filter').css({
            'background': 'rgba(0, 0, 0, 0.0)',
            'z-index': '0'
        });
    } else if (switcher == 'close') {
        $('.col-footer-map').css('height', '50px');
        $('button.map-switch').css('color', '#fff');
        $('button.map-switch').attr('onclick', 'switchMap(\'open\')');
        $('.contacts-title span').attr('onclick', 'switchMap(\'open\')');
        $('button.map-switch').html('<i class="fa fa-map-marker" aria-hidden="true"></i> ' + button_text.open);
        $('.footer-map').addClass('footer-map-filter');
        $('.map-layout-filter').css({
            'background': 'rgba(0, 0, 0, 0.5)',
            'z-index': '100'
        });
    }
}
//--></script>
<?php } ?>
<?php if ($analytics) { ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php } ?>
</body></html>
