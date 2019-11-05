"use strict";
jQuery(function($) {
    var show = {
        init: function() {
            this.init_cache();
            this.events();
            this.test_elements();
        },

        init_cache: function() {
            this.$block = $(".js-more-block");
            this.$btn = $(".js-show-more");
            this.$items = $(".js-more-item");
            this.$text_block = $(".js-text-block");
            this.max_elements = 5;

            this.windowWidth = $(window).width();
            this.breakpoints = {
                laptop: 1500
            };
            this.counter = this.windowWidth > this.breakpoints.laptop ? 3 : 2;
        },

        test_elements: function() {
            this.$block.each(function() {
                var $item = $(this),
                    max = $item.data("max"),
                    max_elements = max ? max : show.max_elements,
                    childrens = $item.find(show.$items);

                if (childrens.length > max_elements) {
                    childrens
                        .filter(`:nth-of-type(n+${max_elements + 1})`)
                        .css("display", "none");
                } else {
                    $item.find(show.$btn).addClass("_disabled");
                }
            });
        },

        events: function() {
            this.$btn.click(function(e) {
                e.preventDefault();

                var $btn = $(this),
                    $block = $btn.closest(show.$block);

                if (!$btn.hasClass("_active")) {
                    if (!$btn.hasClass("js-show-more-text")) {
                        var $units = $block.find(show.$items),
                            $items = $units.filter(":not(:visible)");

                        if ($btn.hasClass("js-show-unit")) {
                            $items.each(function(index) {
                                var $el = $(this);
                                if (index < show.counter) {
                                    $el.slideDown(300, function() {
                                        $el.addClass("_active");
                                    });
                                }
                            });
                        } else {
                            $($items).slideDown(500, function() {
                                $btn.addClass("_active");
                            });
                        }
                    } else {
                        var $text_block = $block.find(show.$text_block),
                            $units = $text_block.children(),
                            $items = $units.filter(":not(:visible)");

                        $items.slideDown(500);
                    }

                    if (!$units.filter(":not(:visible)").length) {
                        $btn.addClass("_active");
                    }
                } else {
                    var max = $block.data("max"),
                        max_elements = max ? max : show.max_elements;

                    $block
                        .find(show.$items)
                        .filter(`:not(:nth-of-type(-n + ${max_elements}))`)
                        .slideUp(500, function() {
                            $btn.removeClass("_active");
                        });
                }
            });
        }
    };

    $(window).load(function() {
        show.init();
    });
});
