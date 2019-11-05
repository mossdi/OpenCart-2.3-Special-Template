"use strict";
jQuery(function($) {
    var $_ = {
        init: function() {
            this.initCache();
            this.events();
            this.initMagic();
            this.initBodyClickClose();
            this.init_merch_gallery();
            this.initSlider();
            this.initForms();
            this.initProductSliders();
            this.initColorPicker();
            this.initTabsContent();
            this.checkout_tabs_init();
            this.initShippingPriceForm();
            this.init_custom_scroll();
            this.initDelayImagesLoad();
        },
        initCache: function() {
            this.$body = $("body");
            this.$header = $(".js-header");
            this.$bar = $(".js-hamburger");
            this.$form_reset_btn = $(".js-form-reset");
            this.$scroll = $(".js-custom-scroll");
            this.$btn_toggle = $(".js-toggle-active");
            this.$call_search = $(".js-call-search");
            this.$header_search = $(".js-search-popup");
            this.$overlay = $(".js-overlay");
            this.$overlay_header = $(".js-overlay-header");
            this.$touch_relative = $(".js-touch-relative");

            this.$shippingPriceForm = $(".js-shipping-price-form");
            this.$shippingPricePopupClose = $(".js-shipping-price-popup-close");

            //sliders
            this.$mainslider = $(".js-mainslider");
            this.$optionSlide = $(".js-option-slide");

            //checkout tabs
            this.$check_tab_module = $(".js-checkout-tabs-module");
            this.$check_tab_item = $(".js-checkout-tab");
            this.$check_tab_body_item = $(".js-checkout-tabs-body-item");

            //footer nav
            this.$footer_nav_item = $(".js-footer-nav-item");
            this.$footer_nav_btn = $(".js-footer-nav-btn");
            this.$footer_nav_list = $(".js-footer-nav-list");

            //menu
            this.$menu_category = $(".js-menu-category");
            this.$menu_back = $(".js-menu-back");

            this.$radio = $(".js-radio-btn");
            this.points = {
                laptop: 1500,
                tablet: 1200,
                mobile: 900,
                mobile_small: 550
            };
        },

        initMagic: function() {
            document.addEventListener("touchstart", function() {}, true);

            if (!("ontouchstart" in document.documentElement)) {
                $_.$touch_relative.removeClass("touch");
            } else {
                $_.$touch_relative.addClass("touch");
            }

            function is_touch_device() {
                return !!("ontouchstart" in window);
            }
            is_touch_device();
        },

        checkout_tabs_init: function() {
            this.$check_tab_item.click(function() {
                var $btn = $(this),
                    $module = $btn.closest($_.$check_tab_module),
                    $items = $module.find($_.$check_tab_body_item),
                    anchor = $btn.data("anchor"),
                    $need_item = $items.filter(`[data-anchor=${anchor}]`);

                $items.add($_.$check_tab_item).removeClass("_active");
                $need_item.add($btn).addClass("_active");
            });
        },

        events: function() {
            $_.$body.on("trigger:init-product-card-slider", function() {
                $_.initProductSliders();
            });

            $_.$body.on("trigger:init-tabs-content", function() {
                $_.initTabsContent();
            });

            $_.$body.on("trigger:init-product-color-picker", function() {
                $_.initColorPicker();
            });

            $_.$body.on("trigger:init-products-list-slider", function() {
                $_.init_merch_gallery();
            });

            this.$bar.click(function() {
                var $btn = $(this);

                $_.close_search();
                $btn.add($_.$header).toggleClass("_active");
            });

            $("input, textarea")
                .on("click", function() {
                    $(this).addClass("_active");
                })
                .focusout(function() {
                    $_.inspect_input($(this));
                })
                .change(function() {
                    $_.inspect_input($(this));
                });
            $("input, textarea").each(function() {
                $_.inspect_input($(this));
            });

            $(".pseudo-hidden").on("change", function(e) {
                var $el = $(e.currentTarget);
                if ($el.val().length) $el.removeClass("error");
            });

            this.$form_reset_btn.click(function() {
                var $form = $(this).closest("form"),
                    $range = $form.find(".js-range-module");

                $form.trigger("reset");

                if ($range.length) {
                    var $range_input = $range
                        .find(".js-range-input")
                        .data("ionRangeSlider");

                    $range_input.reset();
                }
            });

            this.$radio.change(function() {
                if ($(this).hasClass("js-call-parameters")) {
                    $(".js-pickup-block").slideDown(400);
                } else {
                    $(".js-pickup-block").slideUp(400);
                }
            });

            this.$btn_toggle.click(function(e) {
                e.preventDefault();

                $(this).toggleClass("_active");
            });

            this.$call_search.click(function(e) {
                e.preventDefault();

                if ($_.$header.hasClass("_active")) {
                    $_.$bar.add($_.$header).removeClass("_active");
                }

                $_.$header_search.stop().slideToggle(500);
                $_.$overlay_header.toggleClass("_active");
            });
            this.$overlay_header.click(function() {
                $_.close_search();
            });

            this.$footer_nav_btn.click(function() {
                if (window.matchMedia("(max-width: 900px)").matches) {
                    var $btn = $(this),
                        $item = $btn.closest($_.$footer_nav_item),
                        $list = $item.find($_.$footer_nav_list);

                    if (!$btn.hasClass("_active")) {
                        $_.$footer_nav_btn.removeClass("_active");
                        $btn.addClass("_active");
                        $_.$footer_nav_list.stop().slideUp(500);
                        $list.stop().slideDown(500);
                    } else {
                        $btn.removeClass("_active");
                        $list.stop().slideUp(500);
                    }
                }
            });

            this.$menu_category.click(function() {
                $(this).toggleClass("_active");
            });

            this.$menu_back.click(function() {
                $_.$menu_category.removeClass("_active");
            });
        },

        close_search: function() {
            $_.$header_search.stop().slideUp(500);
            $_.$overlay_header.removeClass("_active");
        },

        initBodyClickClose: function() {
            $_.$body.on("click", function(e) {
                var $el = $(e.target),
                    $elements = $(".js-body-click-close"),
                    hasClass = $el.hasClass("js-body-click-close"),
                    $closest = $el.closest(".js-body-click-close");

                if (!hasClass && !$closest.length) {
                    $.each($elements, function(key, item) {
                        var $item = $(item),
                            isTrigger = $item.hasClass("js-bcc-trigger");

                        if (isTrigger) {
                            $item.trigger("trigger:bcc-close");
                        } else if (!($item.is("input") && $item.val())) {
                            $item.removeClass("_active");
                        }
                    });
                } else {
                    var $bcc = hasClass
                        ? $el
                        : $closest.length
                        ? $closest
                        : false;

                    if ($bcc) $elements.not($bcc).removeClass("_active");
                }
            });
        },
        initShippingPriceForm: function() {
            var sendPrevent = false;

            $_.$shippingPriceForm.on("custom_ajax", function(e) {
                if (!sendPrevent) {
                    sendPrevent = true;
                    sendAjax(e);
                }
            });

            $_.$shippingPricePopupClose.on("click", function(e) {
                var $btn = $(e.currentTarget),
                    $popup = $btn.closest(".js-shipping-price-popup");

                $popup.removeClass("_active");
            });

            function sendAjax(e) {
                var $form = $(e.currentTarget),
                    $shippingPriceBlock = $form.closest(
                        ".js-shipping-price-block"
                    ),
                    $loader = $shippingPriceBlock.find(
                        ".js-shipping-price-loader"
                    ),
                    formData = $form.serializeArray(),
                    url = $form.attr("action");

                $loader.addClass("_active");

                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData
                })
                    .success(function(data) {
                        setData($form, data);

                        setTimeout(function() {
                            $form.trigger("reset");
                        }, 500);
                    })
                    .fail(function(data) {
                        var alertText =
                            data && data.responseJSON
                                ? data.responseJSON.message || data.statusText
                                : "loading error";
                        alert(alertText);
                    })
                    .always(function() {
                        sendPrevent = false;
                        $loader.removeClass("_active");
                    });
            }

            function setData($form, data) {
                var $shippingPriceBlock = $form.closest(
                        ".js-shipping-price-block"
                    ),
                    $shippingPricePopup = $shippingPriceBlock.find(
                        ".js-shipping-price-popup"
                    ),
                    $shippingPriceTitle = $shippingPricePopup.find(
                        ".js-shipping-price-popup-title"
                    ),
                    $shippingPriceDelivery = $shippingPricePopup.find(
                        ".js-shipping-delivery"
                    ),
                    $shippingPricePostamat = $shippingPricePopup.find(
                        ".js-shipping-postamat"
                    ),
                    $shippingPricePost = $shippingPricePopup.find(
                        ".js-shipping-post"
                    ),
                    $shippingPricePoints = $shippingPricePopup.find(
                        ".js-shipping-points"
                    ),
                    obj = JSON.parse(data);

                $shippingPriceTitle.html(obj.title);
                $shippingPriceDelivery.html(obj.delivery);
                $shippingPricePoints.html(obj.points);
                $shippingPricePost.html(obj.post);
                $shippingPricePostamat.html(obj.postamat);

                $shippingPricePopup.addClass("_active");
            }
        },

        initColorPicker: function() {
            var $colorPickerBtn = $(".js-color-picker-btn");

            $colorPickerBtn.on("click", function(e) {
                var $el = $(e.currentTarget);

                $el.parent().toggleClass("_active");
            });
        },

        initTabsContent: function() {
            var $tabsWrap = $(".js-tabs-wrap"),
                tabsLink = $(".js-tabs-link"),
                $tabsContent = $(".js-tabs-content");

            tabsLink.on("click", function(e) {
                var $el = $(e.currentTarget),
                    $wrap = $el.closest($tabsWrap),
                    $tabs = $wrap.find($tabsContent),
                    index = $el.index(),
                    $relatedTab = $tabs.eq(index);

                $el.addClass("_active")
                    .siblings()
                    .removeClass("_active");
                $relatedTab
                    .addClass("_active")
                    .siblings()
                    .removeClass("_active");
            });
        },

        initProductSliders: function() {
            var $productSliderFull = $(".js-product-slider-full"),
                $productSliderNav = $(".js-product-slider-nav");

            $productSliderFull.slick({
                lazyLoad: "progressive",
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                dots: false,
                fade: true,
                asNavFor: $productSliderNav,
                responsive: [
                    {
                        breakpoint: $_.points.mobile + 1,
                        settings: {
                            dots: true,
                            arrows: true
                        }
                    }
                ]
            });
            $productSliderNav.slick({
                lazyLoad: "progressive",
                slidesToShow: 5,
                slidesToScroll: 1,
                asNavFor: $productSliderFull,
                dots: false,
                arrows: true,
                focusOnSelect: true
            });
        },

        initSlider: function() {
            this.$mainslider.slick({
                lazyLoad: "progressive",
                fade: true,
                arrows: false,
                dots: true,
                speed: 700
            });
            this.$optionSlide.slick({
                vertical: true,
                slideToShow: 3,
                slideToScroll: 1
            });
        },
        init_merch_gallery: function() {
            var $slider_novelty = $(".js-slider-novelty"),
                $merch_gallery = $(".js-merch-gallery"),
                nov_count = 0;

            if ($slider_novelty.length) {
                $slider_novelty
                    .on("init", function() {
                        nov_count++;

                        if ($slider_novelty.length === nov_count) {
                            $_.init_merch_gallery_small($merch_gallery);
                        }
                    })
                    .slick({
                        infinite: false,
                        arrows: false,
                        dots: true,
                        slidesToShow: 4,
                        slidesToScroll: 4,
                        responsive: [
                            {
                                breakpoint: $_.points.tablet + 1,
                                settings: {
                                    slidesToShow: 3,
                                    slidesToScroll: 3
                                }
                            },
                            {
                                breakpoint: $_.points.mobile + 1,
                                settings: {
                                    slidesToShow: 2,
                                    slidesToScroll: 2
                                }
                            },
                            {
                                breakpoint: $_.points.mobile_small + 1,
                                settings: {
                                    slidesToShow: 1,
                                    slidesToScroll: 1
                                }
                            }
                        ]
                    });
            } else {
                $_.init_merch_gallery_small($merch_gallery);
            }
        },

        init_merch_gallery_small: function($merch_gallery) {
            var $slider_merch_preview = $(".js-slider-merch-preview"),
                $slider_merch_body = $(".js-slider-merch-body");

            $merch_gallery.each(function() {
                var $item = $(this),
                    $slider_preview = $item.find($slider_merch_preview),
                    $slider_body = $item.find($slider_merch_body);

                $slider_preview
                    .on("init", function(event, slick) {
                        slick.setPosition();
                    })
                    .slick({
                        lazyLoad: "progressive",
                        slidesToShow: 3,
                        slidesToScroll: 3,
                        arrows: true,
                        dots: false,
                        vertical: true,
                        verticalSwiping: true,
                        asNavFor: $slider_body,
                        centerMode: true,
                        focusOnSelect: true
                    });
                $slider_body.slick({
                    lazyLoad: "progressive",
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    asNavFor: $slider_preview,
                    fade: true,
                    arrows: false,
                    accessibility: false,
                    draggable: false,
                    swipe: false,
                    touchMove: false
                });
            });
        },

        initForms: function() {
            form_adjuster.init({
                success: function() {
                    var $form = $(form_adjuster.$form_cur),
                        $inputs = $form.find("input,textarea");

                    $(".js-popup._active").removeClass("_active");

                    if ($form.hasClass("js-form-subscribe")) {
                        $(".js-popup-subscribe-thx")
                            .add(".js-overlay")
                            .addClass("_active");
                    } else if ($form.hasClass("js-form-request")) {
                        $(".js-popup-request-thx")
                            .add(".js-overlay")
                            .addClass("_active");
                    } else if ($form.hasClass("js-form-message")) {
                        $(".js-popup-message-thx")
                            .add(".js-overlay")
                            .addClass("_active");
                    }

                    setTimeout(function() {
                        $form.trigger("reset");
                        $inputs.removeClass("valid error active _active");
                    }, 500);

                    setTimeout(function() {
                        if ($(".js-popup-type-thx").hasClass("_active")) {
                            $(".js-popup._active,.js-overlay").removeClass(
                                "_active"
                            );
                        }
                    }, 4000);
                }
            });
        },

        inspect_input: function($input) {
            $input.addClass("_active");
            var val = $input.val(),
                notValidPhone = $input.hasClass("userphone")
                    ? val.replace(/[^0-9.]/g, "").length < 2
                    : false;

            if (
                (!val.length || notValidPhone) &&
                !$input.hasClass("js-datepicker")
            )
                $input.removeClass("_active");
        },

        init_custom_scroll: function() {
            this.$scroll.perfectScrollbar();
        },
        pastUrl: function() {
            var $images = $(".js-lazy-load");

            for (var i = 0; i < $images.length; i++) {
                var $el = $($images[i]);

                if (!$el.hasClass("_loaded")) {
                    var $wrap = $el.closest(".js-delay-load-wrap"),
                        dataUrl = $el.data("url"),
                        dataMobUrl = $el.data("mob-url"),
                        pasteMob =
                            $(window).width() <= $_.points.mobile && dataMobUrl;

                    if (dataUrl || dataMobUrl) {
                        var paste = pasteMob ? dataMobUrl : dataUrl;

                        if ($el.is("img")) {
                            $el.attr("src", paste);
                        } else {
                            $el.attr(
                                "style",
                                "background-image: url('" + paste + "')"
                            );
                        }
                    } else {
                        $el.addClass("_show-img");
                    }

                    if ($wrap.length) {
                        $wrap.addClass("_loaded");
                    } else {
                        $el.addClass("_loaded");
                    }
                }
            }
        },

        initDelayImagesLoad: function() {
            $_.$body.on("body:resize:width", function() {
                $_.pastUrl();
            });

            $_.pastUrl();
        },

        initResizeTrigger: function() {
            var resizeTimer = null,
                resizeDelay = 300,
                windowWidth = $(window).width(),
                windowHeight = $(window).height();

            $(window).resize(function() {
                clearTimeout(resizeTimer);
                resizeTimer = setTimeout(function() {
                    var currentWidth = $(window).width(),
                        currentHeight = $(window).height(),
                        resizeWidth = windowWidth !== currentWidth,
                        resizeHeight = windowHeight !== currentHeight;

                    if (resizeWidth) {
                        windowWidth = currentWidth;
                        $_.windowWidth = currentWidth;

                        if (!resizeHeight)
                            $_.$body.trigger("body:resize:width");
                    }

                    if (resizeHeight) {
                        windowHeight = currentHeight;

                        if (!resizeHeight)
                            $_.$body.trigger("body:resize:height");
                    }

                    $_.$body.trigger("body:resize");
                }, resizeDelay);
            });
        }
    };

    $(document).ready(function() {
        $_.init();
    });
});
