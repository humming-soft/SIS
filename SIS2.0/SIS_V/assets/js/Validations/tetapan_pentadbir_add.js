/*
Author : Agaile
06/02/2017
Custom login validation script
*/

var tetapan_view = function () {

    var ruenTetapanValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                txtuname: {
                    minlength: 2,
                    required: true
                },
                txtpassword: {
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
            runLoginValidator();
        }
    };
}();