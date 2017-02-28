/**
 * Created by sebin on 03-02-2017.
 */
var _sn = function (options) {

    var Window = $(window);
    var Splash = $('.splash');

    var runCustom = function (options) {
        $('form').submit(function () {
            if (!$(this).hasClass('no-loader')) {
                Splash.fadeIn('slow');
            }
        })
        $('a').click(function () {
            if (($(this).attr('href') != '#')) {
                if (!$(this).hasClass('no-loader')) {
                    Splash.fadeIn('slow');
                }
            }
        })
        $(document).on("click", ".add-loader", function () {
            Splash.fadeIn('slow');
        })
        Window.bind("load", function () {
            // Remove splash screen after load
            Splash.fadeOut('slow');
        });

        Window.bind("pageshow", function (event) {
            Splash.fadeOut('slow');
        });

    }
    return {
        init: function (options) {
            runCustom();
        }
    }
}();
var justifikasi = function () {

    var Splash = $('.splash');

    var runLoginValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$TextComment: {
                    minlength: 2,
                    required: true
                }
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
                Splash.fadeIn('slow');
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                errorHandler.show();
            }
        });
    };
    return {
        //main function to initiate template pages
        init: function () {
            runLoginValidator();
        }
    };
}();
jQuery(document).ready(function () {
    "use strict";
    _sn.init();
});
