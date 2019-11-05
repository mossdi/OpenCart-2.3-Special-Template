"use strict";
jQuery(function($) {
    var product_card = {
        init: function() {
            this.initCache();
            this.initEvents();
            this.initContentLoad();
        },

        initCache: function() {
            this.$body = $("body");
            this.$loader = $(".js-loader");
            this.$productContainer = $(".js-product-container");

            this.request = false;
        },

        initEvents: function() {
            product_card.$body.on(
                "trigger:init-product-card-content-load",
                function() {
                    product_card.initContentLoad();
                }
            );
        },

        initContentLoad: function() {
            var $productColorBtn = $(".js-product-color-btn");

            $productColorBtn.on("click", function(e) {
                e.preventDefault();
                var $el = $(e.currentTarget),
                    isActive = $el.hasClass("_active");

                if (!product_card.request && !isActive) {
                    var href = $el.attr("href") || $el.data("url"),
                        $form = $el.closest("form"),
                        data = $form.serializeArray();

                    product_card.request = true;
                    product_card._sendAjax(href, data);
                }
            });
        },

        _sendAjax: function(href, data) {
            product_card.$loader.addClass("_active");

            $.ajax({
                type: "POST",
                url: href,
                data: data
            })
                .success(function(data) {
                    product_card._pasteContent(data);
                    product_card.$body.trigger("trigger:init-sliders");
                })
                .fail(function(data) {
                    var alertText =
                        data && data.responseJSON
                            ? data.responseJSON.message || data.statusText
                            : "loading error";
                    alert(alertText);
                })
                .always(function() {
                    product_card.request = false;
                    product_card.$loader.removeClass("_active");
                });
        },

        _pasteContent: function(data) {
            var obj = JSON.parse(data);

            if (obj.link) {
                var $canonicalLink = $("link[rel='canonical']");

                history.pushState(null, null, obj.link);
                if ($canonicalLink.length)
                    $canonicalLink.attr("href", obj.link);
            }

            if (obj.meta) {
                var $metaDescription = $("meta[name='description']"),
                    $metaKeywords = $("meta[name='keywords']");

                if (obj.meta.meta_title) {
                    document.title = obj.meta.meta_title;
                }

                if (obj.meta.meta_description && $metaDescription.length) {
                    $metaDescription.attr("content", obj.meta.meta_description);
                }

                if (obj.meta.meta_keyword && $metaKeywords.length) {
                    $metaKeywords.attr("content", obj.meta.meta_keyword);
                }
            }

            if (obj.content) {
                product_card.$productContainer.html(obj.content);

                product_card.$body.trigger("trigger:init-product-card-slider");
                product_card.$body.trigger("trigger:init-product-color-picker");
                product_card.$body.trigger("trigger:init-products-list-slider");
                product_card.$body.trigger("trigger:init-tabs-content");
                product_card.$body.trigger(
                    "trigger:init-product-card-content-load"
                );
            }
        }
    };

    $(window).load(function() {
        product_card.init();
    });
});
