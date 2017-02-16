﻿/*
Author : Jane
16/02/2017
Parliment Info login validation script
*/

var Parliment_Info = function () {

    var runParlimentInfoValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtKodKawasan: {
                    required: true
                }
                /*,
                ctl00$ContentPlaceHolder1$txtKodKawasan: {
                    required: true
                }*/
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                errorHandler.show();
            }
        });
    };
    return {
        //main function to initiate template pages
        init: function () {
            runParlimentInfoValidator();
        }
    };
}();