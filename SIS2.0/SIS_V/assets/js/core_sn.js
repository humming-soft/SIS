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

jQuery(document).ready(function () {
    "use strict";
    _sn.init();

});
