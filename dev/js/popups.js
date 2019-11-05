"use strict";
jQuery(function($) {
    var popup = {
        init: function() {
            this.init_cache();
            this.events();
            this.init_auth();
            if (
                this.page.replace(/\.[^.]+$/, "") === "index" ||
                !this.page.length
            ) {
                //this.call_subscribe();
            }
        },

        init_cache: function() {
            this.pathname_arr = window.location.pathname.split("/");
            this.page = this.pathname_arr[this.pathname_arr.length - 1];
            this.$overlay = $(".js-overlay");
            this.$btn_close = $(".js-close-popup");
            this.$btn_call = $(".js-call-popup");
            this.$popups = $(".js-popup");
            this.$loader = $(".js-loader");

            this.subscribe_wait_time = 20000;

            //auth
            this.$auth_nav = $(".js-auth-nav");
            this.$auth_slider = $(".js-auth-slider");

            //product pop up
            this.$prod_popup = $(".js-prod-popup");
        },

        events: function() {
            this.$btn_close.add(popup.$overlay).click(function() {
                popup.close_popup();
            });

            this.$btn_call.click(function(e) {
                var $btn = $(this),
                    parameters = $btn.data("popup");

                if (!$btn.hasClass("js-btn-relative-active")) {
                    e.preventDefault();

                    popup.call_popup(parameters);
                } else {
                    if (!$btn.hasClass("_active")) {
                        popup.call_popup(parameters);
                    }
                }
            });
            $(document).on("custom_ajax", ".js-card-form", function() {
                var $form = $(this),
                    data = $form.serializeArray();

                popup.$loader.addClass("_active");

                $.ajax({
                    type: "POST",
                    url: $form.attr("action"),
                    data: data
                })
                    .success(function(data) {
                        popup.call_popup({ target: "add-to-cart", data: data });
                    })
                    .fail(function(data) {
                        var alertText =
                            data && data.responseJSON
                                ? data.responseJSON.message || data.statusText
                                : "loading error";

                        alert(alertText);
                    })
                    .always(function() {
                        popup.$loader.removeClass("_active");
                    });
            });
        },

        call_subscribe: function() {
            setTimeout(function() {
                if (!popup.$popups.hasClass("_active")) {
                    popup.$overlay
                        .add(".js-popup-subscribe")
                        .addClass("_active");
                }
            }, popup.subscribe_wait_time);
        },

        call_popup(params) {
            var target = params.target,
                $popup = $(".js-popup-" + params.target);

            if (popup.$popups.hasClass("_active")) {
                popup.$popups.removeClass("_active");
            }

            if (target === "add-to-cart") {
                this.add_to_cart(params.data);
            }
            if (target === "quick-view") {
                this.init_product_popup(params);
            }

            popup.$overlay.addClass("_active");
            $popup.addClass("_active");
        },

        close_popup: function() {
            var $popup_active = $(".js-popup._active");

            popup.$overlay.removeClass("_active");
            $popup_active.removeClass("_active");
        },

        init_auth: function() {
            this.$auth_nav.click(function() {
                var $btn = $(this),
                    index = $btn.index();

                if (!$btn.hasClass("_disabled")) {
                    popup.$auth_nav.removeClass("_active");
                    $btn.addClass("_active");
                    popup.$auth_slider.slick("slickGoTo", index);
                }
            });

            this.$auth_slider
                .slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    arrows: false,
                    dots: false,
                    accessibility: false,
                    adaptiveHeight: true,
                    draggable: false,
                    swipe: false,
                    touchMove: false,
                    infinite: false,
                    speed: 300
                })
                .on("beforeChange", function() {
                    popup.$auth_nav.addClass("_disabled");
                })
                .on("afterChange", function() {
                    popup.$auth_nav.removeClass("_disabled");
                });
        },

        add_to_cart: function(data) {
            var $container = $(".js-added-to-cart-inner");

            $container.html(data);
        },
        init_product_popup: function(param) {
            popup.$loader.addClass("_active");

            $.ajax({
                url: param.action,
                method: "POST",
                data: { productId: param.id, category: param.category }
            })
                .success(function(data) {
                    popup.$prod_popup.html(template(data));
                    form_adjuster.init({
                        $form: $(".js-card-form ")
                    });
                    $(".js-prod-popup-slider").slick({
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        arrows: false,
                        dots: false,
                        fade: true,
                        accessibility: false,
                        draggable: false,
                        swipe: false,
                        touchMove: false,
                        asNavFor: $(".js-prod-popup-preview-slider")
                    });

                    $(".js-prod-popup-preview-slider").slick({
                        slidesToShow: 5,
                        slidesToScroll: 1,
                        arrows: true,
                        dots: false,
                        focusOnSelect: true,
                        asNavFor: $(".js-prod-popup-slider")
                    });
                })
                .fail(function(data) {
                    var alertText =
                        data && data.responseJSON
                            ? data.responseJSON.message || data.statusText
                            : "loading error";

                    alert(alertText);
                })
                .always(function() {
                    popup.$loader.removeClass("_active");
                });

            function template(data) {
                var data = JSON.parse(data);

                let template = `<div class="prod-popup">
                    <div class="prod-popup__col prod-popup__col_gallery">
                        <div class="merch-labels merch-labels_big">
                            ${data.label
                                .map(
                                    (item, index) =>
                                        `<div class="merch-labels__item h5 ${
                                            item.className
                                        }" style="border:2px solid ${
                                            item.altcolor
                                        };color:${item.altcolor}">${
                                            item.text
                                        }</div>`
                                )
                                .join("")}
                        </div>
                        <div class="prod-popup-gallery-big js-prod-popup-slider">
                            ${data.images
                                .map(
                                    (item, index) =>
                                        `<div class="prod-popup-gallery-big__item"><div class="object-fit-wrap object-fit-wrap_contain"><div class="object-fit-wrap__img-wrapper"><img class="object-fit-wrap__img" src="${item}"/></div></div></div>`
                                )
                                .join("")}
                        </div>
                        <div class="prod-popup__small-slider">
                            <div class="prod-popup-gallery-small js-prod-popup-preview-slider">
                                ${data.images
                                    .map(
                                        (item, index) =>
                                            `<div class="prod-popup-gallery-small__item"><div class="object-fit-wrap object-fit-wrap_contain"><div class="object-fit-wrap__img-wrapper"><img class="object-fit-wrap__img" src="${item}"/></div></div></div>`
                                    )
                                    .join("")}
                            </div>
                        </div>
                    </div>
                    <div class="prod-popup__col prod-popup__col_content">
                        <div class="prod-popup__row">
                            <div class="prod-popup__wrapper">
                                <h3 class="prod-popup__title">${data.title}</h3>
                                <div class="prod-popup__description p3">${
                                    data.description
                                }</div>
                            </div>
                        </div>
                        <div class="prod-popup__row">
                            <div class="prod-popup__wrapper prod-popup__wrapper_grey">
                                <div class="prod-popup__avalibility p4 ${
                                    data.availability.className
                                }">
                                    <span>${data.availability.text}</span>
                                    <i class="prod-popup__avalibility-icon ${
                                        data.availability.icon
                                    }" style="color:${
                    data.availability.color
                }"></i>
                                </div>
                                <div class="prod-popup__price-block">
                                    <div class="prod-popup__price prod-popup__price_current p1">
                                        <span>${data.price}</span> руб
                                    </div>
                                    ${
                                        data.altprice
                                            ? `<div class="prod-popup__price prod-popup__price_alt p3">
                                        <span>${data.altprice}</span> руб
                                    </div>`
                                            : ""
                                    } 
                                </div>
                                <form class="prod-popup__form js-card-form js-custom-ajax js-form-adjuster" action="${
                                    data.route
                                }">
                                    <input type="hidden" name="productId" value="${
                                        data.id
                                    }"/>
                                    <input type="hidden" name="quantity" value="${
                                        data.id
                                    }"/>    
                                    <button class="btn-style">
                                        <span class="btn-style__wrapper">
                                            <span class="btn-style__text">В корзину</span>
                                        </span>
                                    </button>
                                </form>
                            </div>        
                        </div>
                        <div class="prod-popup__row">
                            <div class="prod-popup__wrapper">
                                ${
                                    data.characteristic
                                        ? `<div class="prod-popup__subtitle h5">ХАРАКТЕРИСТИКИ</div>`
                                        : ""
                                }
                                <div class="prod-popup__characteristic">
                                    ${data.characteristic
                                        .map(
                                            item =>
                                                `<div class="prod-popup__characteristic-item p4">
                                                <span class="prod-popup__characteristic-cell prod-popup__characteristic-cell_grey">${
                                                    item.label
                                                }</span>
                                                <span class="prod-popup__characteristic-cell">${
                                                    item.value
                                                }</span>
                                            </div>`
                                        )
                                        .join("")}        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`;
                return template;
            }
        }
    };

    $(window).load(function() {
        popup.init();
    });
});
