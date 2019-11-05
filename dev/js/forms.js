//using plugins:
//jquery v2.1.4
//jquery.validate
//jquery.inputmask Version: 4.0.0-beta.18

"use strict";
jQuery(function($) {
    window.form_adjuster = {
        init: function(options) {
            this.options = options;
            this.init_cache();
            this.init_validation();
            this.init_mask();

            if (this.options["file"]) {
                this.check_file();
                this.input_file_reset();
            }

            this.send_validation();
            this.init_btn_no_ajax();
            this.init_ajax_without_form();
            this.number_only_init();
        },

        init_options: function() {
            var default_handler_url = window.wp_data ? window.wp_data : false,
                default_settings = {
                    $form: $("form.js-form-adjuster"),
                    type: "POST",
                    handler: default_handler_url.sau_sender_ajax_url
                        ? default_handler_url.sau_sender_ajax_url
                        : "./form-handler.php",
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    task: "task",

                    //file
                    file: false, //not finished yet
                    //callbacks for file
                    onload: false,
                    //classes for input type file
                    //.js-file-preview - for preview

                    //callbacks success,error for ajax
                    success: false,
                    error: false
                };
            return this.options
                ? $.extend(default_settings, this.options)
                : default_settings;
        },

        init_cache: function(options) {
            this.options = this.init_options();
            this.$input_phone = $(".userphone");
            this.$input_date = $(".js-input-date");
            this.$form = this.options.$form;
            this.$noajax_btn = $(".js-noajax-btn");
            this.$number_only = $(".js-number-only");

            //file
            this.$file_input = $(".js-file-check");

            //ajax without form
            //parameters: data-json="{'action':'foo','parameters':'bar'}"
            this.$btn_without_form = $(".js-single-button");
        },

        init_validation: function() {
            $.validator.addMethod(
                "regexp",
                function(value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "Please check your input."
            );

            $.validator.addClassRules({
                userphone: {
                    minlength: 16,
                    regexp: "[^_]+$"
                },
                usermail: {
                    email: true
                },
                required: {
                    required: true
                },
                password: {
                    minlength: 6
                },
                passwordConfirm: {
                    minlength: 6,
                    equalTo: function(element) {
                        var $element = $(element),
                            $form = $element.closest("form"),
                            $password = $form.find("input[name=password]");

                        return $password;
                    }
                }
            });
        },

        init_mask: function() {
            this.$input_phone.inputmask({
                mask: "+7(999)999-99-99",
                showMaskOnHover: false
            });
            this.$input_date.inputmask("dd/mm/yyyy");
        },

        //send form with custom ajax
        form_send: function(formObject, $form) {
            var settings = form_adjuster.options,
                action = $form.attr("action"),
                type = $form.attr("type");

            //formObject - formData,
            //action - action for handler
            //form_adjuster.$form_cur - current form
            $.ajax({
                type: type ? type : settings["type"],
                url: action ? action : settings["handler"],
                //full url in global variable wp_data.sau_sender_ajax_url
                // + "?action=" + (action ? action : "sau_send_mail"),
                dataType: settings["dataType"],
                contentType: settings["contentType"],
                processData: settings["processData"],
                data: formObject,
                success: function() {
                    if (settings["success"]) {
                        settings["success"]();
                    } else {
                        form_adjuster.ajax_success();
                    }

                    form_adjuster.$form_cur = false;
                },
                error: function() {
                    if (settings["error"]) {
                        settings["error"]();
                    } else {
                        form_adjuster.ajax_error();
                    }

                    form_adjuster.$form_cur = false;
                }
            });
        },

        ajax_success: function() {
            console.log("success");

            if (form_adjuster.$form_cur) {
                form_adjuster.$form_cur.trigger("reset");
                //doing smth
            }
        },

        ajax_error: function() {
            console.log("error");
        },
        //assembly form with formData
        formData_assembly: function(form) {
            var formSendAll = new FormData(),
                formdata = {},
                form_arr,
                $form = $(form),
                $fields = $form.find(":input,select,textarea"),
                pos_arr = [],
                action = $form.attr("action");

            form_arr = $fields.serializeArray();

            for (var i = 0; i < form_arr.length; i++) {
                if (form_arr[i].value.length > 0) {
                    var $current_input = $fields.filter(
                        "[name=" + form_arr[i].name + "]"
                    );

                    formSendAll.append(
                        $current_input.attr("name"),
                        $current_input.val()
                    );
                }
            }

            //file
            if (form_adjuster.options["file"]) {
                var $input_file = $(form).find(".js-file-check");

                if ($input_file.length > 0) {
                    $input_file.each(function() {
                        var $input_cur = $(this),
                            val_length = $input_cur.val().length,
                            multy = $input_cur.prop("multiple");

                        if (val_length > 0) {
                            if (!multy) {
                                formSendAll.append(
                                    $input_cur.attr("name"),
                                    $input_cur[0].files[0]
                                );
                            } else {
                                form_adjuster.collect_multiple_file(
                                    formSendAll,
                                    $input_cur
                                );
                            }
                        }
                    });
                }
            }

            this.form_send(formSendAll, $form);
        },

        collect_multiple_file: function(data, $input) {
            var $wrapper = $input.closest(".js-file-wrapper"),
                $list = $wrapper.find(".js-file-list");

            $(".js-file-list li").each(function() {
                var file_name = $(this).attr("data-name");

                for (var i = 0; i < $input[0].files.length; i++) {
                    if (file_name == $input[0].files[i].name) {
                        data.append($input.attr("name"), $input[0].files[i]);
                    }
                }
            });
        },

        //file reader and handlers
        check_file: function() {
            var reader;

            function abortRead() {
                reader.abort();
            }

            function errorHandler(evt) {
                switch (evt.target.error.code) {
                    case evt.target.error.NOT_FOUND_ERR:
                        alert("File Not Found!");
                        break;
                    case evt.target.error.NOT_READABLE_ERR:
                        alert("File is not readable");
                        break;
                    case evt.target.error.ABORT_ERR:
                        break; // noop
                    default:
                        alert("An error occurred reading this file.");
                }
            }

            function handleFileSelect(evt) {
                var $input = $(this);

                for (var i = 0; i < $input[0].files.length; i++) {
                    reader_file($input[0].files[i], $input);
                }
            }

            function reader_file(file, $input) {
                var reader = new FileReader();

                reader.file_name = file.name;
                reader.onerror = errorHandler;

                reader.onabort = function(e) {
                    alert("File read cancelled");
                };

                reader.onload = function(event) {
                    if (form_adjuster.options["onload"]) {
                        form_adjuster.options["onload"]();
                    } else {
                        form_adjuster.file_onload($input, reader);
                    }
                };

                reader.readAsDataURL(file);
            }

            form_adjuster.$file_input.on("change", handleFileSelect);
        },

        file_onload: function($input, reader) {
            var $module = $input.closest(".js-file-module"),
                $filename = $module.find(".js-file-name");

            $module.addClass("_active");
            $filename.text(reader.file_name);
        },

        //reset input type file with save all handlers
        input_file_reset: function() {
            $(document).on("click", ".js-file-reset", function() {
                var $btn = $(this),
                    $module = $btn.closest(".js-file-module"),
                    $input = $module.find(".js-file-input");

                $module.removeClass("_active");

                $input.replaceWith($input.val("").clone(true));
            });
        },

        //send data without form (add in favorite etc.)
        init_ajax_without_form: function() {
            form_adjuster.$btn_without_form.click(function(e) {
                e.preventDefault();

                var json = JSON.parse($(this).attr("data-json"));

                form_adjuster.form_send(
                    JSON.stringify(json.parameters),
                    json.action
                );
            });
        },

        //send form without custom ajax
        init_btn_no_ajax: function() {
            form_adjuster.$noajax_btn.click(function(e) {
                e.preventDefault();

                var $form = $(this).closest("form");

                $form.submit();
            });
        },

        //possible enter only number in input
        number_only_init: function() {
            $(document).on("keydown", ".js-number-only", function(event) {
                if (
                    event.keyCode == 46 ||
                    event.keyCode == 8 ||
                    event.keyCode == 9 ||
                    event.keyCode == 27 ||
                    (event.keyCode == 65 && event.ctrlKey === true) ||
                    (event.keyCode >= 35 && event.keyCode <= 39)
                ) {
                    return;
                } else {
                    if (
                        (event.keyCode < 48 || event.keyCode > 57) &&
                        (event.keyCode < 96 || event.keyCode > 105)
                    ) {
                        event.preventDefault();
                    }
                }
            });
        },

        send_validation: function() {
            this.$form.each(function() {
                var $form = $(this);

                $form.validate({
                    errorPlacement: function(error, element) {
                        error.remove();
                    },
                    submitHandler: function(form) {
                        form_adjuster.$form_cur = $(form);

                        if (!$(form).hasClass("js-custom-ajax")) {
                            form_adjuster.formData_assembly(form);
                        } else {
                            $(form).trigger("custom_ajax");
                        }
                    }
                });
            });
        }
    };
});
