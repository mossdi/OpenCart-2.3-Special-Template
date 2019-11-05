"use strict";
jQuery(function($) {
    var ya_map = {
        init: function() {
            this.init_cache();

            if (this.$map.length > 0) {
                this.api(this.src, this.create);
            }
        },

        init_cache: function() {
            this.$map = $("#ya-map");

            if (this.$map.length > 0) {
                this.coords = this.$map.data("coords");
                this.marker = this.$map.data("marker");
            }

            this.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU";
        },

        api: function(src, callback) {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = src;

            document.getElementsByTagName("head")[0].appendChild(script);

            if (callback) script.onload = callback;
        },

        create: function() {
            ymaps.ready(function() {
                var myMap = new ymaps.Map(
                    "ya-map",
                    {
                        center: ya_map.coords,
                        zoom: 15
                    },
                    {
                        searchControlProvider: "yandex#search"
                    }
                );
                if (ya_map.marker) {
                    var myPlacemark = new ymaps.Placemark(
                        myMap.getCenter(),
                        {
                            balloonContent: ya_map.balloon
                        },
                        {
                            iconLayout: "default#imageWithContent",
                            iconImageHref: ya_map.marker,
                            iconImageSize: [62, 77],
                            iconImageOffset: [-31, -77]
                        }
                    );
                } else {
                    var myPlacemark = new ymaps.Placemark(myMap.getCenter());
                }

                myMap.geoObjects.add(myPlacemark);
                myMap.behaviors.disable("scrollZoom");
            });
        }
    };

    $(window).load(function() {
        ya_map.init();
    });
});
