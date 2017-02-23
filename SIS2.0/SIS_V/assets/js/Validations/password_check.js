/*
Author : Jane
23/02/2017
Password validation script
*/

var Password_Check = function () {

    var runPasswordValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$txtNewPassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 10
                },
                ctl00$txtConfirmPassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 10,
                    equalTo: '[name="ctl00$txtNewPassword"]'
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
            runPasswordValidator();
        }
    };
}();