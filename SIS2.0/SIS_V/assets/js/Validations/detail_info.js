/*
Author : Agaile
17/03/2017
Detail info validation script
*/

var Detail_Info = function () {

    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            ignore: [],
            rules: {
                ctl00$ContentPlaceHolder1$dp_kawasan: {
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
            runValidator();
        }
    };
}();