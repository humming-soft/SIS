﻿/*
Author : Agaile
06/02/2017
Custom login validation script
*/

var Login = function () {

    var runLoginValidator = function () {
        var Splash = $('.splash');
        var loginCon = $('#login-con');
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                txtuname: {
                    minlength: 2,
                    required: true
                },
                txtpassword: {
                    minlength: 4,
                    maxlength: 30,
                    required: true
                }
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
                loginCon.fadeOut('slow');
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