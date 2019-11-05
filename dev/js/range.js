"use strict";
jQuery(function($) {
    var range = {
        init: function() {
            this.init_cache();
            this.events();
            this.init_sliders();
        },

        init_cache: function() {
            this.$module = $(".js-range-module");
            this.$input = $(".js-range-input");
            this.$input_from = $(".js-range-price-from");
            this.$input_to = $(".js-range-price-to");
            this.$input_number = $(".js-range-input-number");
        },

        events: function() {
            this.$input_number.focusout(function() {
                var $input = $(this),
                    val = Number($input.val()),
                    $module = $input.closest(range.$module),
                    $range_input = $module
                        .find(range.$input)
                        .data("ionRangeSlider"),
                    { options } = $range_input;

                if ($input.hasClass("js-range-price-from")) {
                    if (val < options.min) {
                        $input.val(options.min);
                        $range_input.update({
                            from: options.min
                        });
                    } else {
                        if (val > options.to) {
                            $input.val(options.to);
                            $range_input.update({
                                from: options.to
                            });
                        } else {
                            $range_input.update({
                                from: val
                            });
                        }
                    }
                } else {
                    if (val > options.max) {
                        $input.val(options.max);
                        $range_input.update({
                            to: options.max
                        });
                    } else {
                        if (val < options.from) {
                            $input.val(options.from);
                            $range_input.update({
                                to: options.from
                            });
                        } else {
                            $range_input.update({
                                to: val
                            });
                        }
                    }
                }
            });
        },

        init_sliders: function() {
            this.$input.each(function() {
                var $item = $(this),
                    $module = $item.ionRangeSlider({
                        onStart: function(data) {
                            range.set_inputs_value(data);
                        },
                        onFinish: function(data) {
                            range.set_inputs_value(data);
                        }
                    });
            });
        },

        set_inputs_value: function(data) {
            var $module = data.input.closest(this.$module),
                $input_from = $module.find(this.$input_from),
                $input_to = $module.find(this.$input_to);

            $input_from.val(data.from);
            $input_to.val(data.to);
        }
    };

    $(window).load(function() {
        range.init();
    });
});
