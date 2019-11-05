"use strict";
jQuery(function($) {
    var sel = {
        init: function() {
            this.init_cache();
            this.events();
            this.init_selects();
        },

        init_cache: function() {
            this.$module = $(".js-select-module");
            this.$select = $(".js-select-module-select");
            this.$container = $(".js-select-module-container");
            this.$opt_container = $(".js-select-module-options");
            this.$btn = $(".js-select-module-text-block");
        },

        events: function() {
            this.$container.click(function(e) {
                var $el = $(e.currentTarget),
                    $relatedModule = $el.closest(sel.$module);

                $relatedModule.toggleClass("_active");
            });
        },

        init_selects: function() {
            this.$module.each(function() {
                var $item = $(this),
                    $select = $item.find(sel.$select),
                    $opt_container = $item.find(sel.$opt_container),
                    $btn = $item.find(sel.$btn);

                sel.build_options($select, $opt_container, $btn);
                sel.add_events($item, $btn, $select);
            });
        },

        build_options: function($select, $opt_container, $btn) {
            var $options = $select.find("option");

            for (var i = 0; i < $options.length; i++) {
                var $item = $($options[i]),
                    isDisabled = $item.is(":disabled"),
                    isSelected = $item.is(":selected"),
                    selectedClass = isSelected ? "_active" : "",
                    value = $item.val(),
                    title = $item.text();

                if (!isDisabled) {
                    $opt_container.append(
                        '<div class="select-module__option p4 js-select-module-option ' +
                            selectedClass +
                            '" data-value="' +
                            value +
                            '">' +
                            title +
                            "</div>"
                    );
                }

                if (isSelected) {
                    if (value && value.length) {
                        $select.closest(sel.$module).addClass("_selected");
                        $btn.text(title);
                    }
                }
            }

            $opt_container.perfectScrollbar();
        },

        add_events: function($item, $btn, $select) {
            var $options = $item.find(".js-select-module-option");

            $options.on("click", function() {
                var $opt = $(this),
                    value = $opt.data("value"),
                    title = $opt.text();

                $options.add($item).removeClass("_active");
                $opt.addClass("_active");

                $item.addClass("_selected");
                $btn.text(title);
                $select.val(value);
                $select.valid();
            });
        }
    };

    $(window).load(function() {
        sel.init();
    });
});
