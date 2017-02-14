/*
Author : Agaile
06/02/2017
Custom login validation script
*/

var Add = function () {

    var runAddValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                txt_log_name: {
                    minlength: 2,
                    required: true
                },
                txt_user_name: {
                    minlength: 6,
                    maxlength: 10,
                    required: true
                }
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
            runAddValidator();
        }
    };
}();